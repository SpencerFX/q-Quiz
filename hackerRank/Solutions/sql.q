//====================================================================
// hackerRank/Solutions/sql.q
//
// Expected output per SQL problem, verified by running each
// problem's own reference solution (hackerRank/SQL/easy|medium/*.q)
// against hackerRank/data/tables.q - same convention as
// hackerRank/Solutions/algorithms.q.
//====================================================================

.solutions.sql.easy: (!) . flip raze 2 cut
    (
        (`revisingSelectQueryI; `$("New York";"Los Angeles";"Chicago";"Houston";"Phoenix";"Philadelphia";"San Antonio"));
        (`revisingSelectQueryII; `$("New York";"Los Angeles";"Chicago";"Houston";"Phoenix";"Philadelphia";"San Antonio"));
        (`selectAll; (
            "1 Tokyo JPN Tokyo 8336599";
            "2 Yokohama JPN Kanagawa 3339594";
            "3 Osaka JPN Osaka 2668586";
            "4 Nagoya JPN Aichi 2154376";
            "5 Sapporo JPN Hokkaido 1790673";
            "6 Kobe JPN Hyogo 1493398";
            "7 Kyoto JPN Kyoto 1461974";
            "8 Fukuoka JPN Fukuoka 1341470";
            "9 New York USA New York 8008278";
            "10 Los Angeles USA California 3694820";
            "11 Chicago USA Illinois 2896016";
            "12 Houston USA Texas 1953631";
            "13 Phoenix USA Arizona 1321045";
            "14 Philadelphia USA Pennsylvania 1517550";
            "15 San Antonio USA Texas 1327407"
        ));
        (`selectById; "3 Osaka JPN Osaka 2668586");
        (`japaneseCitiesAttributes; (
            "1 Tokyo JPN Tokyo 8336599";
            "2 Yokohama JPN Kanagawa 3339594";
            "3 Osaka JPN Osaka 2668586";
            "4 Nagoya JPN Aichi 2154376";
            "5 Sapporo JPN Hokkaido 1790673";
            "6 Kobe JPN Hyogo 1493398";
            "7 Kyoto JPN Kyoto 1461974";
            "8 Fukuoka JPN Fukuoka 1341470"
        ));
        (`japaneseCitiesNames; `$("Tokyo";"Yokohama";"Osaka";"Nagoya";"Sapporo";"Kobe";"Kyoto";"Fukuoka"));
        (`revisingAggregationsCount; 15);
        (`revisingAggregationsSum; 3694820);
        (`revisingAggregationsAvg; 1640519.0);
        (`averagePopulation; 2887028);
        (`japanPopulation; 22586670);
        (`populationDensityDifference; 7015554);
        (`weatherStation1; (
            "Kissee Mills MO";
            "Loma Mar CA";
            "Sandy Hook CT";
            "Tipton IN";
            "Arlington CO";
            "Turtle Creek PA";
            "Ellery CA";
            "Deer Park VA";
            "Odessa CO";
            "Wingo KY"
        ));
        (`weatherStation2; 1305.63);
        (`weatherStation3; `$("Deer Park";"Loma Mar";"Tipton";"Turtle Creek";"Wingo"));
        (`weatherStation4; 0);
        (`weatherStation5; ("Wingo 5";"Kissee Mills 12"));
        (`weatherStation6; `$("Arlington";"Ellery";"Odessa"));
        (`weatherStation7; `$("Odessa";"Wingo"));
        (`weatherStation8; enlist `Odessa);
        (`weatherStation9; `$("Deer Park";"Kissee Mills";"Loma Mar";"Sandy Hook";"Tipton";"Turtle Creek";"Wingo"));
        (`weatherStation10; `$("Arlington";"Deer Park";"Ellery";"Kissee Mills";"Loma Mar";"Sandy Hook";"Tipton";"Turtle Creek"));
        (`weatherStation11; `$("Arlington";"Deer Park";"Ellery";"Kissee Mills";"Loma Mar";"Sandy Hook";"Tipton";"Turtle Creek";"Wingo"));
        (`weatherStation12; `$("Deer Park";"Kissee Mills";"Loma Mar";"Sandy Hook";"Tipton";"Turtle Creek"));
        (`weatherStation13; 37.8393);
        (`weatherStation14; 39.6127);
        (`weatherStation15; `Odessa);
        (`weatherStation16; 39.0393);
        (`weatherStation17; `$"Deer Park");
        (`higherThan75Marks; `$("Priya";"Belvet";"Julia";"Ashley"));
        (`employeeNames; `$("Ashley";"Belen";"Kimberly";"Nasim";"Sarah";"Vanessa"));
        (`employeeSalaries; ("2 5600";"4 6100";"5 7200"));
        (`typeOfTriangle; `Isosceles`Equilateral`Scalene`Scalene`Isosceles);
        (`theBlunder; 116496);
        (`topEarners; "62000 1")
    );

.solutions.sql.medium: (!) . flip raze 2 cut
    (
        (`thePads; (
            "Ashley(P)";
            "Britney(P)";
            "Jenny(D)";
            "Julia(A)";
            "Maria(S)";
            "Meera(S)";
            "Priya(S)";
            "Priyanka(D)";
            "Samantha(A)";
            "There are a total of 2 actors.";
            "There are a total of 2 doctors.";
            "There are a total of 2 professors.";
            "There are a total of 3 singers."
        ));
        (`binaryTreeNodes; ("1 Leaf";"2 Inner";"3 Leaf";"5 Root";"6 Leaf";"8 Inner";"9 Leaf"));
        (`newCompanies; ("C1 Monika 1 2 3";"C2 Samantha 1 1 2"));
        (`weatherStation18; 54.7949);
        (`weatherStation19; 49.3705)
    );
