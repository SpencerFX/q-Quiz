//====================================================================
// jobs - sample/placeholder listings
//
// Fictional companies and postings (not scraped/real), seeded so the
// Jobs page and country filter have real data to work with. Titles
// and descriptions follow the site's kdb+/q theme; swap this file's
// contents for a real feed/source when one exists.
//====================================================================

.jobs.data:([]
    id:1+til 18;
    title:`$(
        "Kdb+ Developer";
        "Quantitative Developer (q/kdb+)";
        "Senior kdb+ Engineer";
        "kdb+ Developer";
        "Quant Developer - Market Data";
        "kdb+/q Consultant";
        "kdb+/q Developer";
        "Quantitative Systems Engineer";
        "Junior kdb+ Developer";
        "kdb+ Developer";
        "Quant Developer (q)";
        "kdb+ Infrastructure Engineer";
        "kdb+ Developer";
        "q/kdb+ Engineer";
        "Kdb+ Support Engineer";
        "kdb+ Developer";
        "Senior Quantitative Developer";
        "kdb+ Consultant"
    );
    company:`$(
        "Meridian Capital Partners";
        "Blackwood Quantitative";
        "Apex Trading Systems";
        "Harbourview Trading";
        "Pacific Rim Quant";
        "Causeway Bay Analytics";
        "Raffles Quant Partners";
        "Marina Bay Trading";
        "Sentosa Capital Markets";
        "Sakura Systematic Trading";
        "Tokyo Bay Capital";
        "Nihonbashi Trading Group";
        "Ganges Trading Technologies";
        "Bengaluru Quant Labs";
        "Deccan Analytics";
        "Thames Capital Partners";
        "Kensington Quant Group";
        "Belfast Data Systems"
    );
    country:`$(
        "USA";"USA";"USA";
        "HK";"HK";"HK";
        "Singapore";"Singapore";"Singapore";
        "Japan";"Japan";"Japan";
        "India";"India";"India";
        "UK";"UK";"UK"
    );
    location:`$(
        "New York, NY";"Chicago, IL";"San Francisco, CA";
        "Hong Kong";"Hong Kong";"Hong Kong";
        "Singapore";"Singapore";"Singapore";
        "Tokyo";"Tokyo";"Tokyo";
        "Bengaluru";"Bengaluru";"Pune";
        "London";"London";"Belfast"
    );
    description:(
        "Build and maintain high-performance kdb+ tick capture and analytics systems for a multi-strategy trading desk.";
        "Develop low-latency q applications supporting real-time risk and market data pipelines.";
        "Lead design of a distributed kdb+ historical database serving petabyte-scale tick data.";
        "Support and extend kdb+ infrastructure for APAC equities trading strategies.";
        "Own the ingestion and normalisation of exchange market data feeds into kdb+.";
        "Deliver client kdb+ implementations across regional trading firms.";
        "Build q-based analytics tools for a systematic trading team covering APAC futures.";
        "Optimise kdb+ tickerplant and RDB performance under high message-rate conditions.";
        "Support senior engineers building kdb+ data pipelines; strong q fundamentals required.";
        "Maintain kdb+ historical and real-time databases for a systematic macro fund.";
        "Write q analytics for intraday signal research on JPX futures and equities.";
        "Manage kdb+ cluster deployments and monitoring for a low-latency trading platform.";
        "Develop and test q code for a global market data platform serving multiple trading desks.";
        "Build automated testing and CI tooling for kdb+ services.";
        "Provide production support and performance tuning for kdb+ tick databases.";
        "Join a small team building kdb+ analytics for a multi-asset hedge fund.";
        "Lead kdb+/q development for real-time risk aggregation across trading books.";
        "Deliver kdb+ consulting engagements for financial services clients across the UK."
    )
 );
