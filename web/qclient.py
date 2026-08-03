from qpython import qconnection

import config


class QClient:

    def __init__(self):

        self.conn = qconnection.QConnection(
            host=config.Q_HOST,
            port=config.Q_PORT
        )

    def connect(self):

        if not self.conn.is_connected():

            self.conn.open()

    def close(self):

        if self.conn.is_connected():

            self.conn.close()

    def execute(self, expression):

        self.connect()

        return self.conn(expression)