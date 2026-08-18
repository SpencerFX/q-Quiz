/====================================================================/
/* *Probability of No Women*
/*
/* *Calculates the probability that a randomly selected table
/* *contains no women.*
/*
/* *Usage:*
/*      *.quiz.hackerRank.quant.probability.noWomenAtTableA.info[]
/*====================================================================/
.quiz.hackerRank.quant.probability.noWomenAtTableA.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Probability of No Women at Table A";
    -1 "";
    -1 "20 people, including exactly 3 women, are seated randomly";
    -1 "at four tables, A, B, C and D.";
    -1 "";
    -1 "Each table contains exactly 5 people.";
    -1 "All possible arrangements are equally likely.";
    -1 "";
    -1 "Task:";
    -1 "- Calculate the probability that no women sit at Table A.";
    -1 "- Return the probability rounded to four decimal places.";
    -1 "";
    -1 "Example:";
    -1 "n = 20";
    -1 "w = 3";
    -1 "k = 5";
    -1 "";
    -1 "There are 17 people who are not women.";
    -1 "";
    -1 "The probability that all 5 positions at Table A";
    -1 "are occupied by non-women is:";
    -1 "";
    -1 "P = C(n-w,k) / C(n,k)";
    -1 "";
    -1 "P = C(17,5) / C(20,5)";
    -1 "";
    -1 "Result:";
    -1 "0.3991";
    -1 "";
    -1 "Function Description:";
    -1 "probNoWomen takes:";
    -1 "  - n: integer (total number of people)";
    -1 "  - w: integer (number of women)";
    -1 "  - k: integer (number of seats at Table A)";
    -1 "";
    -1 "Returns:";
    -1 "  - probability that Table A contains no women";
    -1 "";
    -1 "Constraints:";
    -1 "- 1 <= w < n";
    -1 "- 1 <= k < n";
    -1 "- w + k <= n";
    -1 "";
    -1 "Notes:";
    -1 "- Sampling is without replacement.";
    -1 "- Table A contains exactly k people.";
    -1 "- The probability can be expressed using combinations.";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly calculate the probability.";
    -1 "- Return a floating-point value.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "n:20;";
    -1 "w:3;";
    -1 "k:5;";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    };


/* *Solution Info ===============================================*
/* *probNoWomen[n;w;k]*
/ C(n,k) via a falling-factorial product; "k _ n-w" (drop) in the
/ original didn't compute a combination at all - it dropped k items
/ from a scalar, which is a type error, not C(n-w,k)
comb:{[n;k] prd[((n-k)+1)+til k] % prd[1+til k]};
probNoWomen:{[n;w;k]
    comb[n-w;k] % comb[n;k]
    };
/* *=============================================================*/