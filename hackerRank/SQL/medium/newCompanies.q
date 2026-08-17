.quiz.hackerRank.sql.newCompanies.info:{
    -1 "";
    -1 "======================================";
    -1 " HackerRank SQL - New Companies";
    -1 "======================================";
    -1 "";
    -1 "Four tables describe a company hierarchy: each COMPANY has a";
    -1 "founder, each LEAD_MANAGER reports into a company, each";
    -1 "SENIOR_MANAGER reports into a lead manager, and each employee";
    -1 "(NEWCO_EMPLOYEE) reports into a senior manager. For each";
    -1 "company, count how many distinct lead managers, senior";
    -1 "managers and employees it has.";
    -1 "";
    -1 "Tables:";
    -1 "- COMPANY(COMPANY_CODE;FOUNDER)";
    -1 "- LEAD_MANAGER(LEAD_MANAGER_CODE;COMPANY_CODE;LEAD_MANAGER_NAME)";
    -1 "- SENIOR_MANAGER(SENIOR_MANAGER_CODE;LEAD_MANAGER_CODE;";
    -1 "  COMPANY_CODE;SENIOR_MANAGER_NAME)";
    -1 "- NEWCO_EMPLOYEE(EMPLOYEE_CODE;SENIOR_MANAGER_CODE;COMPANY_CODE;";
    -1 "  EMPLOYEE_NAME)";
    -1 "";
    -1 "Task:";
    -1 "- For every company, in COMPANY_CODE order, count its distinct";
    -1 "  lead managers, senior managers, and employees";
    -1 "";
    -1 "Function Description:";
    -1 "newCompanies takes no arguments - query the four global tables";
    -1 "directly.";
    -1 "";
    -1 "Returns:";
    -1 "- A list of strings, one per company, \"COMPANY_CODE FOUNDER";
    -1 "  LEAD_MANAGER_COUNT SENIOR_MANAGER_COUNT EMPLOYEE_COUNT\"";
 };


/ Solution Info ===============================================
/ newCompanies[]

newCompanies:{[]
  {[code]
    founder:first exec FOUNDER from COMPANY where COMPANY_CODE=code;
    lmCount:count distinct exec LEAD_MANAGER_CODE from LEAD_MANAGER where COMPANY_CODE=code;
    smCount:count distinct exec SENIOR_MANAGER_CODE from SENIOR_MANAGER where COMPANY_CODE=code;
    empCount:count distinct exec EMPLOYEE_CODE from NEWCO_EMPLOYEE where COMPANY_CODE=code;
    " " sv (string code;string founder;string lmCount;string smCount;string empCount)
   } each asc distinct exec COMPANY_CODE from COMPANY
 };
/ =============================================================
