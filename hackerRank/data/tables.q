//====================================================================
//
// hackerRank/data/tables.q
//
// Sample data backing the HackerRank SQL section (hackerRank/SQL/).
// These are q-native standins for the classic HackerRank SQL
// datasets (CITY, STATION, STUDENTS, EMPLOYEE, TRIANGLES,
// OCCUPATIONS, BST, and the Company/Lead_Manager/Senior_Manager/
// Employee hierarchy) - not scraped from HackerRank (that data is
// hidden test data, not published), but built to the same well-known
// schemas so the real problem statements apply unchanged. Loaded once
// by hackerRank/scripts/init.q, before any SQL/ problem file, since
// every SQL reference solution queries these tables directly as
// globals rather than taking them as function arguments (that's also
// why every SQL problem's own function is niladic - {[] ...} - and
// registered with an empty () input in hackerRank/Inputs/sql.q).
//
// EMPLOYEE (Employee Names/Salaries, Top Earners) and NEWCO_EMPLOYEE
// (New Companies) are deliberately different globals from EMPLOYEES
// (The Blunder) - HackerRank's own real problem set uses that same
// singular/plural distinction, and giving the New Companies hierarchy
// its own EMPLOYEE-shaped table under a different name avoids a
// three-way name collision entirely.
//====================================================================

CITY:([]
    ID:1+til 15;
    NAME:`$("Tokyo";"Yokohama";"Osaka";"Nagoya";"Sapporo";"Kobe";"Kyoto";"Fukuoka";
        "New York";"Los Angeles";"Chicago";"Houston";"Phoenix";"Philadelphia";"San Antonio");
    COUNTRYCODE:`JPN`JPN`JPN`JPN`JPN`JPN`JPN`JPN`USA`USA`USA`USA`USA`USA`USA;
    DISTRICT:`$("Tokyo";"Kanagawa";"Osaka";"Aichi";"Hokkaido";"Hyogo";"Kyoto";"Fukuoka";
        "New York";"California";"Illinois";"Texas";"Arizona";"Pennsylvania";"Texas");
    POPULATION:8336599 3339594 2668586 2154376 1790673 1493398 1461974 1341470 8008278 3694820 2896016 1953631 1321045 1517550 1327407
 );

/ City names deliberately span every vowel-boundary case the Weather
/ Observation Station problems ask about: Odessa is the only name that
/ both starts AND ends with a vowel, Wingo only ends with one,
/ Arlington/Ellery only start with one, and the rest do neither - so
/ every WS6-12 query below has a genuinely non-empty, distinct answer.
STATION:([]
    ID:1+til 10;
    CITY:`$("Kissee Mills";"Loma Mar";"Sandy Hook";"Tipton";"Arlington";"Turtle Creek";"Ellery";"Deer Park";"Odessa";"Wingo");
    STATE:`MO`CA`CT`IN`CO`PA`CA`VA`CO`KY;
    LAT_N:36.7128 37.2258 41.4260 40.2842 40.4459 40.4090 42.3676 39.0392 39.6127 36.6058;
    LONG_W:93.2925 122.2854 73.2523 86.0402 105.3466 79.8442 79.2887 78.4302 104.8148 88.9053
 );

STUDENTS:([]
    ID:1+til 6;
    NAME:`$("Ashley";"Samantha";"Julia";"Belvet";"Jane";"Priya");
    MARKS:81 75 88 92 74 99
 );

/ Employee Names / Employee Salaries / Top Earners
EMPLOYEE:([]
    EMPLOYEE_ID:1+til 6;
    NAME:`$("Kimberly";"Vanessa";"Sarah";"Belen";"Nasim";"Ashley");
    MONTHS:10 5 4 3 8 2;
    SALARY:6200 5600 4800 6100 7200 3100
 );

/ The Blunder - Samantha's average-salary query divided every salary
/ by 1000 and truncated instead of dividing correctly, i.e. she
/ computed avg[SALARY div 1000] instead of avg SALARY div 1000 - q has
/ no operator precedence (strictly right-to-left) so that's a genuine,
/ easy-to-make mistake here, not just flavour text. The problem is to
/ find round[correctAvg] - round[blunderedAvg].
EMPLOYEES:([]
    EMPLOYEE_ID:1+til 8;
    SALARY:96060 128540 89400 110000 204500 65900 150300 88200
 );

TRIANGLES:([]
    A:20 20 13 7 10;
    B:20 20 14 24 12;
    C:23 20 30 25 10
 );

OCCUPATIONS:([]
    NAME:`$("Jenny";"Ashley";"Samantha";"Julia";"Britney";"Maria";"Meera";"Priya";"Priyanka");
    OCCUPATION:`Doctor`Professor`Actor`Actor`Professor`Singer`Singer`Singer`Doctor
 );

/ Binary Tree Nodes - a small tree:
/          5 (root)
/        /   \
/       2     8
/      /     / \
/     1     6   9
BST:([]
    N:1 2 3 5 6 8 9;
    P:2 5 5 0N 8 5 8
 );

/ New Companies - Company -> Lead_Manager -> Senior_Manager -> Employee
COMPANY:([]
    COMPANY_CODE:`C1`C2;
    FOUNDER:`Monika`Samantha
 );

LEAD_MANAGER:([]
    LEAD_MANAGER_CODE:`LM1`LM2;
    COMPANY_CODE:`C1`C2;
    LEAD_MANAGER_NAME:`Jose`Angela
 );

SENIOR_MANAGER:([]
    SENIOR_MANAGER_CODE:`SM1`SM2`SM3;
    LEAD_MANAGER_CODE:`LM1`LM1`LM2;
    COMPANY_CODE:`C1`C1`C2;
    SENIOR_MANAGER_NAME:`Mark`Jill`Todd
 );

NEWCO_EMPLOYEE:([]
    EMPLOYEE_CODE:`E1`E2`E3`E4`E5;
    SENIOR_MANAGER_CODE:`SM1`SM1`SM2`SM3`SM3;
    COMPANY_CODE:`C1`C1`C1`C2`C2;
    EMPLOYEE_NAME:`John`Jane`Alex`Sam`Priti
 );
