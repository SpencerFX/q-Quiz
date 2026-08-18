//====================================================================
// jobs - sample/placeholder listings
//
// Fictional companies and postings (not scraped/real), seeded so the
// Jobs page and country filter have real data to work with. Titles
// and descriptions follow the site's kdb+/q theme; swap this file's
// contents for a real feed/source when one exists.
//
// Exception: the 9 USA entries (ids 1-9), 5 HK entries (ids 10-14), 6
// Singapore entries (ids 15-20), 1 India entry (id 24), and 3 UK
// entries (ids 25-27) are real, currently-live postings as of
// 2026-08-17, pulled from LinkedIn "kdb+ in United States" / "kdb+ in
// Hong Kong SAR" / "kdb+ in Singapore" / "kdb+ in India" / "kdb+ in
// United Kingdom" searches and filtered down to just the postings
// whose own job TITLE mentions KDB/kdb+ (every search also surfaces
// generic "Software Engineer"/"Data Analyst"/"Quantitative
// Researcher"/"Trader" roles at kdb+ shops that don't name it in the
// title - those were left out here; the India search alone returned
// 400+ results and only one had KDB in its own title). Descriptions
// are a plain restatement of each title/team, not scraped body text -
// the LinkedIn results list doesn't expose the full posting.
//====================================================================

.jobs.data:([]
    id:1+til 27;
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
        "KDB Lead Developer";
        "kdb+ Contractor (Capital Markets)";
        "Senior kdb+ Engineer";
        "Sr Lead Software Engineer - KDB+ / Q"
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
        "EPAM Systems";
        "Data Intellect";
        "Data Intellect";
        "JPMorganChase"
    );
    country:`$(
        "USA";"USA";"USA";"USA";"USA";"USA";"USA";"USA";"USA";
        "HK";"HK";"HK";"HK";"HK";
        "Singapore";"Singapore";"Singapore";"Singapore";"Singapore";"Singapore";
        "Japan";"Japan";"Japan";
        "India";
        "UK";"UK";"UK"
    );
    location:`$(
        "New York, NY";"New York, NY";"New York, NY";"New York City Metropolitan Area";"New York, NY";
        "Jersey City, NJ";"Jersey City, NJ";"New York, NY";"Jersey City, NJ";
        "Hong Kong SAR";"Hong Kong";"Hong Kong";"Hong Kong";"Hong Kong";
        "Singapore";"Singapore";"Singapore";"Singapore";"Singapore";"Singapore";
        "Tokyo";"Tokyo";"Tokyo";
        "Pune";
        "Belfast";"Belfast";"London"
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
        "Lead kdb+ development for EPAM Systems, based in Pune.";
        "Contract kdb+ engineering role for Data Intellect supporting a capital markets client in Belfast.";
        "Senior kdb+ engineering role for Data Intellect, hybrid based in Belfast.";
        "Senior lead kdb+/q software engineering role at JPMorganChase, based in London."
    )
 );
