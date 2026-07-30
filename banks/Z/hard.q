//====================================================================
//
// q-Quiz
//
// Topic      : .z Internals
// Difficulty : Hard
//
//====================================================================
.quiz.z.hard:`zPGLifecycle`zWHandle`zTSOrdering`zPORecovery`zPCDisconnect`zExitCleanup`zDynamicTimer`zFileReload`zDateRollover`zAsyncCallbacks`zCommandLine`zEval`zHandlerOverride`zClockSelection`zProductionBestPractice!
    (
    `question`answers`correct!(
    "Why is .z.P generally preferred over .z.p when persisting timestamps to disk?";

    `a`b`c`d!(
        ".z.P always returns UTC timestamps";
        ".z.P is formatted consistently for serialization and logging";
        ".z.P executes faster than .z.p";
        ".z.P automatically compresses timestamps"
    );

    `b
    );

    `question`answers`correct!(
    "What is the main purpose of saving the original .z.w before overriding it?";

    `a`b`c`d!(
        "To restore the original callback behavior when required";
        "To reduce memory usage";
        "To improve IPC throughput";
        "To preserve command-line arguments"
    );

    `a
    );

    `question`answers`correct!(
    "Which statement about .z.ts is TRUE?";

    `a`b`c`d!(
        "It executes synchronously within the q event loop";
        "It executes in a separate operating-system thread";
        "It interrupts running q expressions";
        "It only executes once after startup"
    );

    `a
    );

    `question`answers`correct!(
    "In production systems, why is .z.po commonly overridden?";

    `a`b`c`d!(
        "To implement automatic recovery or initialization after loading";
        "To improve table compression";
        "To control garbage collection";
        "To change today's date"
    );

    `a
    );

    `question`answers`correct!(
    "Which callback is typically used to clean up resources when an IPC client disconnects unexpectedly?";

    `a`b`c`d!(
        ".z.pc";
        ".z.pg";
        ".z.ts";
        ".z.exit"
    );

    `a
    );

    `question`answers`correct!(
    "Why should production applications override .z.exit carefully?";

    `a`b`c`d!(
        "It often performs final persistence and resource cleanup";
        "It changes the system clock";
        "It controls timer frequency";
        "It initializes command-line arguments"
    );

    `a
    );

    `question`answers`correct!(
    "What happens if system\"t\" changes while the process is running?";

    `a`b`c`d!(
        "Future .z.ts invocations use the new interval";
        ".z.ts stops permanently";
        "Only newly connected clients see the change";
        "Nothing changes until restart"
    );

    `a
    );

    `question`answers`correct!(
    "Which callback is frequently used by development tools to automatically reload modified source files?";

    `a`b`c`d!(
        ".z.ts";
        ".z.pg";
        ".z.pc";
        ".z.exit"
    );

    `a
    );

    `question`answers`correct!(
    "Why do many production systems compare .z.D with a stored date during timer execution?";

    `a`b`c`d!(
        "To detect day rollover and trigger end-of-day processing";
        "To synchronize system clocks";
        "To enumerate symbols";
        "To monitor IPC latency"
    );

    `a
    );

    `question`answers`correct!(
    "Which callback executes when an asynchronous IPC message is received?";

    `a`b`c`d!(
        ".z.ps";
        ".z.pg";
        ".z.pc";
        ".z.ts"
    );

    `a
    );

    `question`answers`correct!(
    "What information is typically obtained from .z.X?";

    `a`b`c`d!(
        "Command-line arguments supplied at startup";
        "Current IPC handles";
        "Memory usage";
        "Workspace statistics"
    );

    `a
    );

    `question`answers`correct!(
    "Why can overriding .z.pg be dangerous?";

    `a`b`c`d!(
        "It intercepts every synchronous IPC request";
        "It disables timers";
        "It changes database partitions";
        "It prevents serialization"
    );

    `a
    );

    `question`answers`correct!(
    "Which clock should generally be used when measuring elapsed execution time?";

    `a`b`c`d!(
        ".z.N";
        ".z.T";
        ".z.D";
        ".z.P"
    );

    `a
    );

    `question`answers`correct!(
    "Why do many frameworks wrap existing .z callbacks instead of replacing them entirely?";

    `a`b`c`d!(
        "To preserve existing behavior while extending functionality";
        "To improve compression";
        "To reduce symbol enumeration";
        "To avoid creating dictionaries"
    );

    `a
    );

    `question`answers`correct!(
    "Which practice is generally considered safest when customizing .z callbacks?";

    `a`b`c`d!(
        "Save the original callback and delegate to it when appropriate";
        "Delete all existing callbacks";
        "Overwrite every callback at startup";
        "Call .z.ts directly instead"
    );

    `a
    )
 );
//====================================================================