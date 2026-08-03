//--------------------------------------------------------------------
// MEDIUM — combining syntax to understand a line/short block
//--------------------------------------------------------------------
.quiz.syntaxGW.medium:`serviceAllocFullMeaning`gwPcUserBranch`gwPcLbBranch`registerResourceFlow`requestServiceLookup`addRequestVsSend`returnServiceDisambig`serviceAvailablePop`lbPcFourLines`execRequestMeaning`queryServiceTrapAt`zwVsNegZw!
    (
    `question`answers`correct!(
        "Walking through serviceAlloc:{[sq;addr] $[null queryTable[sq;`uh]; NLB(`returnService;sq); [(neg sh:resources[addr;`sh])(`queryService;(sq;queryTable[sq;`query])); queryTable[sq;`snt`sh]:(.z.p;sh)]]}, what happens in the FALSE branch?";

        `a`b`c`d!(
            "The query is sent asynchronously to the allocated resource's handle, and queryTable is updated with the send timestamp and the service handle used";
            "The Load Balancer is told the resource is free again, since the user is still connected";
            "The gateway closes the connection to the resource, believing it to be unneeded";
            "The query is re-queued locally on the gateway rather than sent anywhere"
        );

        `a
    );

    `question`answers`correct!(
        "In the gateway's .z.pc, what do these lines accomplish together: update uh:0N from `queryTable where uh=handle; delete from `resources where sh=handle?";

        `a`b`c`d!(
            "They handle two different disconnect cases in one callback: nulling out the user handle for any queries belonging to a disconnected USER, and removing a disconnected RESOURCE from the resources table — only the relevant one actually matches any rows for a given handle";
            "Both lines always execute meaningfully for every disconnect, regardless of whether it was a user or a resource";
            "They are redundant; either line alone would fully handle any disconnect";
            "The first line handles resource disconnects, and the second handles user disconnects — the reverse of the actual behavior"
        );

        `a
    );

    `question`answers`correct!(
        "In the gateway's .z.pc, specifically the branch that fires if[handle~LB;...], what four things does it do to recover?";

        `a`b`c`d!(
            "Notifies all users with still-outstanding, unsent queries that the service is unavailable; closes and clears every resource connection; marks those outstanding queryTable rows as closed with a timestamp; and resets LB/NLB while scheduling a 10-second reconnect timer";
            "It immediately shuts down the gateway process entirely, since the Load Balancer is considered a single point of failure";
            "It only resets the LB and NLB variables, leaving resources and queryTable untouched until the next query arrives";
            "It re-sends every outstanding query directly to a resource, bypassing the Load Balancer entirely"
        );

        `a
    );

    `question`answers`correct!(
        "In registerResource:{[name;addr] `services upsert (.z.w;addr;name;0N;0N;.z.p); (neg gateways)@\\:(`addResource;enlist`source`address!(name;addr)); serviceAvailable[.z.w;name]}, what is the purpose of the (neg gateways)@\\: line?";

        `a`b`c`d!(
            "It asynchronously notifies every currently-registered gateway of this newly available resource, so each gateway can add it to its own local resources table";
            "It synchronously confirms with each gateway that the new resource is reachable before proceeding";
            "It removes every gateway from the gateways list, since a new resource requires re-registration";
            "It sends the new resource's address only to the gateway that most recently connected"
        );

        `a
    );

    `question`answers`correct!(
        "In requestService, what does res:exec first handle from services where source=serv,null gwHandle look for, and what does a null result mean?";

        `a`b`c`d!(
            "It looks for an idle instance of the requested service (one with no gateway currently assigned to it); a null result means every matching instance is currently busy";
            "It looks for the total count of instances of that service; a null result means the service was never registered at all";
            "It looks for the gateway that most recently requested this service; null means no gateway has ever requested it";
            "It looks for a specific resource by address; null means the address was malformed"
        );

        `a
    );

    `question`answers`correct!(
        "Why does requestService branch to addRequestToQueue when res is null, but branch to updating services and calling sendService when it isn't?";

        `a`b`c`d!(
            "A null res means no idle resource instance was found, so the request must wait in serviceQueue; a non-null res is an available resource's handle, which can be claimed immediately and the allocation sent straight back to the gateway";
            "The opposite is true: null res means a resource IS available and can be allocated immediately";
            "addRequestToQueue and sendService are always called together regardless of res";
            "res being null indicates an error condition that halts processing entirely, rather than queueing"
        );

        `a
    );

    `question`answers`correct!(
        "In returnService:{serviceAvailable . $[.z.w in (0!services)`handle; (.z.w;x); value first select handle,source from services where gwHandle=.z.w,sq=x]}, what do the two branches of the $[...] distinguish?";

        `a`b`c`d!(
            "Whether the caller (.z.w) is itself a registered SERVICE handle finishing a query (using .z.w and x=service name directly), versus a GATEWAY reporting a user disconnect (looking up the resource by matching gwHandle and sq instead)";
            "Whether the query succeeded or failed, using two different logging paths";
            "Whether the request originated from the console or from an IPC connection";
            "Whether x is a symbol or an integer, purely for type-dispatch purposes"
        );

        `a
    );

    `question`answers`correct!(
        "In serviceAvailable, what do these two lines do together: nxt:first n:select gwHandle,sq from serviceQueue where source=serv; serviceQueue::(1#n)_ serviceQueue?";

        `a`b`c`d!(
            "They pop the first queued request for the given service off of serviceQueue — nxt captures that first row, and the second line removes exactly that one row (using its count, 1, as a Drop count) from the queue";
            "They clear the ENTIRE serviceQueue for that service in one step, discarding all but the most recent request";
            "They add a new request to the back of serviceQueue rather than removing one";
            "They sort serviceQueue by source without changing its length"
        );

        `a
    );

    `question`answers`correct!(
        "In the Load Balancer's .z.pc:{[h] services _:h; gateways::gateways except h; delete from `serviceQueue where gwHandle=h; update gwHandle:0N from `services where gwHandle=h}, which lines specifically matter when a GATEWAY (as opposed to a resource) disconnects?";

        `a`b`c`d!(
            "gateways::gateways except h removes it from the subscriber list, delete from serviceQueue where gwHandle=h clears any of its queued requests, and update gwHandle:0N from services frees up any resource that was allocated to it — services _:h only matters for a resource disconnect";
            "Only services _:h matters; the other three lines are dead code for a gateway disconnect";
            "All four lines are meaningful ONLY for a resource disconnect, never for a gateway";
            "update gwHandle:0N from services would incorrectly delete resource rows entirely on a gateway disconnect"
        );

        `a
    );

    `question`answers`correct!(
        "In execRequest:{[nh;rq] nh(`returnRes;(rq 0;@[value;rq 1;{x}])); nh[]}, what does @[value;rq 1;{x}] achieve?";

        `a`b`c`d!(
            "Protected evaluation of the query string (rq 1): if evaluating it errors, the error object itself is returned instead of raising, rather than crashing the service";
            "It converts the query string to a value type without executing it as code";
            "It always returns the literal string \"x\" regardless of the query";
            "It retries evaluating the query up to x times before giving up"
        );

        `a
    );

    `question`answers`correct!(
        "In queryService:{ errProj:{[nh;sq;er]nh(sq;`$er);nh[]}; @[execRequest[neg .z.w];x;errProj[neg .z.w;x 0]]; NLB(`returnService;serviceName) }, when does NLB(`returnService;serviceName) get called relative to whether execRequest succeeded or errored?";

        `a`b`c`d!(
            "It runs unconditionally after the Trap At call, whether execRequest succeeded normally or errProj had to handle a failure — the Load Balancer is always told the service is free again either way";
            "It only runs if execRequest succeeded; on error, the Load Balancer is never notified and the resource stays marked busy";
            "It only runs if execRequest failed, as part of error cleanup";
            "It runs twice: once inside execRequest and once again afterward"
        );

        `a
    );

    `question`answers`correct!(
        "What is the functional difference between .z.w and neg .z.w as used across this framework (e.g. in userQuery versus execRequest)?";

        `a`b`c`d!(
            ".z.w is the plain (positive) handle, typically stored/recorded for later reference (like a user handle in queryTable); neg .z.w is used when actually SENDING an asynchronous message back over that same connection";
            "They are interchangeable in every context, with no functional difference";
            ".z.w only works inside .z.pc, while neg .z.w only works inside .z.po";
            "neg .z.w returns the handle of a completely different, unrelated connection"
        );

        `a
    )
 );