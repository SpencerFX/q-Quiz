//--------------------------------------------------------------------
// HARD — full snippets / choosing the correct syntax
//--------------------------------------------------------------------
.quiz.syntaxGW.hard:`fullUserQuery`fullServiceAlloc`fullGwPc`fullRequestServiceTrace`fullServiceAvailableTrace`fullLbPc`fullQueryServiceBlock`deferredSyncPattern`sendServiceRaze`registerGwFunc`ztsRetryLogicPair`returnResFullBlock`crossEachSignalDisconnect!
    (
    `question`answers`correct!(
        "Which definition correctly reproduces userQuery, validating the service, appending a new row with an incrementing sequence number, and requesting allocation — or returning an error for an unknown service?";

        `a`b`c`d!(
            "userQuery:{$[(serv:x 0) in exec distinct source from resources; [queryTable,:(SEQ+:1;.z.w;.z.p;0Np;0Np;.z.u;0N;serv;x 1); NLB(`requestService;SEQ;serv)]; (neg .z.w)(`$\"Service Unavailable\")]}";
            "userQuery:{$[(serv:x 0) in exec distinct source from resources; (neg .z.w)(`$\"Service Unavailable\"); [queryTable,:(SEQ+:1;.z.w;.z.p;0Np;0Np;.z.u;0N;serv;x 1); NLB(`requestService;SEQ;serv)]]}";
            "userQuery:{queryTable,:(SEQ+:1;.z.w;.z.p;0Np;0Np;.z.u;0N;x 0;x 1); NLB(`requestService;SEQ;x 0)}";
            "userQuery:{$[(serv:x 0) in exec distinct source from resources; [queryTable,:(SEQ+:1;.z.w;.z.p;0Np;0Np;.z.u;0N;serv;x 1); LB(`requestService;SEQ;serv)]; (neg .z.w)(`$\"Service Unavailable\")]}"
        );

        `a
    );

    `question`answers`correct!(
        "Which definition correctly reproduces serviceAlloc, checking for a disconnected user before sending the query to the allocated resource and stamping queryTable?";

        `a`b`c`d!(
            "serviceAlloc:{[sq;addr] $[null queryTable[sq;`uh]; NLB(`returnService;sq); [(neg sh:resources[addr;`sh])(`queryService;(sq;queryTable[sq;`query])); queryTable[sq;`snt`sh]:(.z.p;sh)]]}";
            "serviceAlloc:{[sq;addr] $[null queryTable[sq;`uh]; [(neg sh:resources[addr;`sh])(`queryService;(sq;queryTable[sq;`query])); queryTable[sq;`snt`sh]:(.z.p;sh)]; NLB(`returnService;sq)]}";
            "serviceAlloc:{[sq;addr] (neg sh:resources[addr;`sh])(`queryService;(sq;queryTable[sq;`query])); queryTable[sq;`snt`sh]:(.z.p;sh)}";
            "serviceAlloc:{[sq;addr] $[null resources[addr;`sh]; NLB(`returnService;sq); queryTable[sq;`snt`sh]:(.z.p;addr)]}"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z.pc definition for the GATEWAY correctly handles a user disconnect, a resource disconnect (including notifying any in-flight user), and a Load Balancer disconnect, in that combined order of checks?";

        `a`b`c`d!(
            "A definition that first nulls uh for the disconnecting handle, deletes any matching resource row, sends 'Service Disconnect' to any user whose query was mid-flight on that resource, and — only if the handle matches LB — notifies all still-waiting users, closes and clears resources, marks outstanding queryTable rows closed, and resets LB/NLB with a 10-second reconnect timer";
            "A definition that only ever resets LB/NLB and schedules a reconnect timer, regardless of which handle disconnected";
            "A definition that deletes the entire queryTable on any disconnect, to guarantee a clean slate";
            "A definition that immediately calls registerGWFunc to re-register on every single disconnect event, including ordinary user disconnects"
        );

        `a
    );

    `question`answers`correct!(
        "Tracing requestService for a NEW request when NO idle instance of the requested service exists: which sequence of effects is correct?";

        `a`b`c`d!(
            "res comes back null → addRequestToQueue[seq;serv;.z.w] is called → the request (gwHandle;sq;source;time) is upserted into serviceQueue, and no service allocation is sent back yet";
            "res comes back null → sendService is called immediately with a null resource address, which the gateway is expected to handle gracefully";
            "res comes back non-null pointing at a busy resource anyway, and the query proceeds regardless of that resource's current load";
            "The request is silently dropped, since requestService has no defined behavior for the no-idle-resource case"
        );

        `a
    );

    `question`answers`correct!(
        "Tracing serviceAvailable[zw;serv] when serviceQueue DOES contain a matching queued request: what is the full correct sequence of effects?";

        `a`b`c`d!(
            "The first matching queued request (nxt) is captured and popped off serviceQueue; services[zw] is updated with that request's gwHandle, sq and current timestamp; then, since count n is truthy, sendService[nxt`gwHandle;zw] sends the allocation back to that gateway";
            "The resource zw is simply marked idle in services, with no further action taken even if requests are queued";
            "Every queued request for that service is allocated to zw simultaneously in a single batch send";
            "sendService is called BEFORE the queue is popped, risking a duplicate allocation of the same request"
        );

        `a
    );

    `question`answers`correct!(
        "Which .z.pc definition for the LOAD BALANCER correctly removes a disconnected handle from both services and gateways, clears any queued requests tied to it as a gateway, and frees any resource it had claimed as a gateway?";

        `a`b`c`d!(
            ".z.pc:{[h] services _:h; gateways::gateways except h; delete from `serviceQueue where gwHandle=h; update gwHandle:0N from `services where gwHandle=h}";
            ".z.pc:{[h] gateways::gateways except h; services _:h}";
            ".z.pc:{[h] delete from `services where handle=h; delete from `gateways where gwHandle=h}";
            ".z.pc:{[h] update gwHandle:0N from `services where gwHandle=h; services _:h; delete from `serviceQueue}"
        );

        `a
    );

    `question`answers`correct!(
        "Which block correctly reproduces the example service's queryService/execRequest pair, evaluating the query under protected evaluation, replying to the gateway, flushing the handle, and then notifying the Load Balancer the service is free?";

        `a`b`c`d!(
            "execRequest:{[nh;rq]nh(`returnRes;(rq 0;@[value;rq 1;{x}]));nh[]}; queryService:{errProj:{[nh;sq;er]nh(sq;`$er);nh[]}; @[execRequest[neg .z.w];x;errProj[neg .z.w;x 0]]; NLB(`returnService;serviceName)}";
            "execRequest:{[nh;rq]nh[];nh(`returnRes;(rq 0;@[value;rq 1;{x}]))}; queryService:{NLB(`returnService;serviceName); @[execRequest[neg .z.w];x;{[er]-1 er}]}";
            "queryService:{execRequest[neg .z.w;x]; NLB(`returnService;serviceName)}; execRequest:{[nh;rq]value rq 1}";
            "execRequest:{[nh;rq]nh(`returnRes;(rq 0;value rq 1));nh[]}; queryService:{@[execRequest[neg .z.w];x;{-1 x}]}"
        );

        `a
    );

    `question`answers`correct!(
        "The client's gw function uses h:hopen x followed by (neg x)(...) and a bare x[] to receive the reply. What is this pattern called, and why is it needed instead of a plain synchronous call like h(`userQuery;y)?";

        `a`b`c`d!(
            "Deferred synchronous communication: sending the request asynchronously (freeing the gateway to serve other users while the query is outstanding) but still blocking the ORIGINAL caller on x[] until a reply eventually arrives, unlike a plain sync call which would tie up the gateway process for the whole round trip";
            "It's called Each Parallel messaging, used purely to spread load across multiple gateway threads";
            "It's identical in effect to h(`userQuery;y); the async send and later x[] are just stylistic alternatives with no behavioral difference";
            "It's required because hopen cannot be used with synchronous calls at all in this framework"
        );

        `a
    );

    `question`answers`correct!(
        "In sendService:{[gw;h]neg[gw]raze(`serviceAlloc;services[h;`sq`address])}, what does raze accomplish when combining `serviceAlloc with services[h;`sq`address]?";

        `a`b`c`d!(
            "It flattens the function symbol and the two-item (sq;address) pair into a single flat 3-item list, matching the message shape expected by the gateway's serviceAlloc callback (function;sq;address)";
            "It sums the sq and address values together into one combined value";
            "It removes duplicate entries from the services table before sending";
            "It converts the services table into a flat list of all resource addresses only"
        );

        `a
    );

    `question`answers`correct!(
        "What does registerGWFunc:{addResource LB(`registerGW;`)} do as a whole, tracing the synchronous call through to its effect?";

        `a`b`c`d!(
            "Synchronously calls registerGW on the Load Balancer (which adds this gateway's handle to its gateways list and returns the current source/address of every known resource), and immediately feeds that returned resource list into the gateway's local addResource function to populate its own resources table";
            "Asynchronously tells the Load Balancer to remove this gateway from its gateways list";
            "Registers a brand-new resource named registerGW with the Load Balancer";
            "Simply pings the Load Balancer to check connectivity with no state changes on either side"
        );

        `a
    );

    `question`answers`correct!(
        "Comparing the gateway's .z.ts:{manageConn[]; if[0<LB;@[registerGWFunc;`;{show x}];value\"backslash-t 0\"]} to the service's .z.ts:{manageConn[];if[0<LB;@[NLB;serviceDetails;{show x}];value\"backslash-t 0\"]}, what is the shared retry logic pattern, and what does value\"backslash-t 0\" accomplish once connected?";

        `a`b`c`d!(
            "Both attempt to (re)connect via manageConn[], then only proceed to register (as a gateway or as a service resource, respectively) if the connection succeeded (0<LB); value\"backslash-t 0\" cancels the recurring timer once registration succeeds, since it's no longer needed until a future disconnect resets it";
            "Both immediately register regardless of connection success, and value\"backslash-t 0\" starts a brand new timer ticking every 0 milliseconds";
            "manageConn[] registers the process, while the if-branch attempts the actual connection — the reverse of the actual roles";
            "value\"backslash-t 0\" permanently disables .z.ts from ever being called again, even after a future disconnect"
        );

        `a
    );

    `question`answers`correct!(
        "Which definition correctly reproduces returnRes, looking up the user handle by sequence number, replying only if the user is still connected, and stamping the return time regardless?";

        `a`b`c`d!(
            "returnRes:{[res] uh:first exec uh from queryTable where sq=(res 0); if[not null uh;(neg uh)(res 1)]; queryTable[(res 0);`ret]:.z.p}";
            "returnRes:{[res] uh:first exec uh from queryTable where sq=(res 0); (neg uh)(res 1); queryTable[(res 0);`ret]:.z.p}";
            "returnRes:{[res] uh:first exec sh from queryTable where sq=(res 0); if[not null uh;(neg uh)(res 1)]}";
            "returnRes:{[res] if[not null res 1;(neg res 0)(res 1)]; queryTable[(res 0);`ret]:.z.p}"
        );

        `a
    );

    `question`answers`correct!(
        "What does returnRes'[sq cross `$\"Service Disconnect\"] do inside the gateway's .z.pc, where sq is a list of affected sequence numbers?";

        `a`b`c`d!(
            "cross pairs every sequence number in sq with the disconnect message, producing a list of (sq;message) pairs; Each (') then applies returnRes to every one of those pairs individually, notifying each affected user";
            "It applies returnRes once to the entire list sq at once, ignoring the message entirely";
            "cross computes the Cartesian product of every possible sequence number with every possible error message in the system";
            "Each (') here iterates over the characters of the string \"Service Disconnect\" rather than over sq"
        );

        `a
    )
 );
//====================================================================