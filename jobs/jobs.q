//====================================================================
// jobs - sample/placeholder listings
//
// Fictional companies and postings (not scraped/real), seeded so the
// Jobs page and country filter have real data to work with. Titles
// and descriptions follow the site's kdb+/q theme; swap this file's
// contents for a real feed/source when one exists.
//
// Exception: the 9 USA entries (ids 1-9), 5 HK entries (ids 10-14), and
// 6 Singapore entries (ids 15-20) are real, currently-live postings as
// of 2026-08-16, pulled from LinkedIn "kdb+ in United States" / "kdb+
// in Hong Kong SAR" / "kdb+ in Singapore" searches and filtered down to
// just the postings whose own job TITLE mentions KDB/kdb+ (all three
// searches also surface generic "Software Engineer"/"Quantitative
// Developer"/"Strat" roles at kdb+ shops that don't name it in the
// title - those were left out here). Descriptions are a plain
// restatement of each title/team, not scraped body text - the LinkedIn
// results list doesn't expose the full posting.
//====================================================================

.jobs.data:([]
    id:1+til 29;
    title:`$(
        "KDB+/Q Engineer - Up to $320,000 + Bonus + Package (New York)";
        "Principal eSoftware Engineer-KDB";
        "kdb+ Contractor (Capital Markets)";
        "Kdb+/Q Engineer";
        "KDB Product Support Engineer";
        "SVP Senior KDB+ Platform Engineer";
        "Senior KDB+ Specialist - Equities Technology - Senior Vice President";
        "Senior kdb+ Engineer";
        "Senior KDB+ Engineer, Vice President";
        "KDB Lead Software Engineer - Equities Prime Securities Lending Technology";
        "Kdb+ Engineer - Systematic Data Platform";
        "kdb+ Engineer";
        "Senior kdb+ Engineer";
        "Kdb+/Q Engineer";
        "KDB+/Q Engineer - Up to 300,000 SGD + Bonus + Package (Singapore)";
        "KDB Developer";
        "KDB DEVELOPER";
        "kdb+ Engineer";
        "Senior kdb+ Engineer";
        "Kdb+/Q Engineer";
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
        "Hunter Bond";
        "JPMorganChase";
        "Data Intellect";
        "Citadel Securities";
        "KX";
        "Citi";
        "Citi";
        "Data Intellect";
        "Citi";
        "JPMorganChase";
        "Millennium";
        "Data Intellect";
        "Data Intellect";
        "Citadel Securities";
        "Hunter Bond";
        "Synechron";
        "Synechron";
        "Data Intellect";
        "Data Intellect";
        "Citadel Securities";
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
        "USA";"USA";"USA";"USA";"USA";"USA";"USA";"USA";"USA";
        "HK";"HK";"HK";"HK";"HK";
        "Singapore";"Singapore";"Singapore";"Singapore";"Singapore";"Singapore";
        "Japan";"Japan";"Japan";
        "India";"India";"India";
        "UK";"UK";"UK"
    );
    location:`$(
        "New York, NY";"New York, NY";"New York, NY";"New York City Metropolitan Area";"New York, NY";
        "Jersey City, NJ";"Jersey City, NJ";"New York, NY";"Jersey City, NJ";
        "Hong Kong SAR";"Hong Kong";"Hong Kong";"Hong Kong";"Hong Kong";
        "Singapore";"Singapore";"Singapore";"Singapore";"Singapore";"Singapore";
        "Tokyo";"Tokyo";"Tokyo";
        "Bengaluru";"Bengaluru";"Pune";
        "London";"London";"Belfast"
    );
    description:(
        "Kdb+/q engineering role in New York recruited via Hunter Bond, covering core development work on a trading platform.";
        "Principal-level kdb+ engineering role at JPMorganChase, focused on e-trading software systems.";
        "Contract kdb+ engineering role for Data Intellect supporting a capital markets client in New York.";
        "Develop kdb+/q systems supporting Citadel Securities' market making and trading infrastructure in the New York area.";
        "Product support engineering role at KX, the company behind kdb+, covering customer-facing kdb+ support in New York.";
        "Senior Vice President-level kdb+ platform engineering role at Citi, based in Jersey City.";
        "Senior kdb+ specialist role within Citi's Equities Technology group, Jersey City.";
        "Senior kdb+ engineering role for Data Intellect, hybrid based in New York.";
        "Vice President-level kdb+ engineering role at Citi, Jersey City.";
        "Lead kdb+ engineering for JPMorganChase's Equities Prime Securities Lending technology team, driving design and delivery across the platform.";
        "Build and support the kdb+ systematic data platform underpinning Millennium's quantitative trading strategies.";
        "Deliver kdb+ consulting and engineering work for Data Intellect's financial services clients across the region.";
        "Lead senior-level kdb+ consulting engagements for Data Intellect's financial services client base.";
        "Develop kdb+/q systems supporting Citadel Securities' market making and trading infrastructure.";
        "Kdb+/q engineering role in Singapore recruited via Hunter Bond, covering core development work on a trading platform.";
        "Kdb+ developer role at Synechron, on-site in Singapore.";
        "Kdb+ developer role at Synechron, hybrid based in Singapore.";
        "Kdb+ engineering role for Data Intellect, hybrid based in Singapore.";
        "Senior kdb+ engineering role for Data Intellect, hybrid based in Singapore.";
        "Develop kdb+/q systems supporting Citadel Securities' market making and trading infrastructure in Singapore.";
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
