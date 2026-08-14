import threading

from qpython import qconnection

import config


API_SCRIPT = "./web/q/web_api.q"


class QClient:

    def __init__(self):

        self.conn = qconnection.QConnection(
            host=config.Q_HOST,
            port=config.Q_PORT
        )

        self._api_loaded = False

        self._lock = threading.Lock()

    def connect(self):

        if not self.conn.is_connected():

            self.conn.open()

            self._api_loaded = False

        if not self._api_loaded:

            self.conn(f'system "l {API_SCRIPT}"')

            self._api_loaded = True

    def close(self):

        if self.conn.is_connected():

            self.conn.close()

    def execute(self, expression, *parameters):

        # The underlying QConnection is a single TCP socket to q. If two
        # Flask request threads call into it at the same time, their reads
        # and writes interleave on the wire and corrupt the IPC framing -
        # the client then decodes garbage (eg a bogus "type" error) instead
        # of a real response. Serialize access per-connection to prevent it.
        with self._lock:

            self.connect()

            return self.conn(expression, *parameters)