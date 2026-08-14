/====================================================================/
/* *Amoeba Extinction*
/*
/* *Calculates the probability that a population of amoebas will
/* *eventually become extinct.*
/*
/* *Usage:*
/*      *.quiz.hackerRank.quant.probability.amoebaExtinction.info[]
/*====================================================================/
.quiz.hackerRank.quant.probability.amoebaExtinction.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Amoeba Extinction";
    -1 "";
    -1 "We start with one amoeba.";
    -1 "";
    -1 "Each amoeba independently produces one of the following";
    -1 "numbers of offspring:";
    -1 "";
    -1 "- 0 offspring";
    -1 "- 1 offspring";
    -1 "- 2 offspring";
    -1 "";
    -1 "Each outcome is equally likely.";
    -1 "";
    -1 "The process continues indefinitely.";
    -1 "";
    -1 "Task:";
    -1 "- Calculate the probability of eventual extinction.";
    -1 "";
    -1 "Let q be the probability of eventual extinction.";
    -1 "";
    -1 "Conditioning on the number of offspring:";
    -1 "";
    -1 "q = 1/3 + (1/3)q + (1/3)q^2";
    -1 "";
    -1 "Rearranging:";
    -1 "";
    -1 "q^2 - 2q + 1 = 0";
    -1 "";
    -1 "(q - 1)^2 = 0";
    -1 "";
    -1 "Therefore:";
    -1 "";
    -1 "q = 1";
    -1 "";
    -1 "Result:";
    -1 "1";
    -1 "";
    -1 "Function Description:";
    -1 "extinctionProbability takes:";
    -1 "  - p0: probability of producing 0 offspring";
    -1 "  - p1: probability of producing 1 offspring";
    -1 "  - p2: probability of producing 2 offspring";
    -1 "";
    -1 "Returns:";
    -1 "  - probability of eventual extinction";
    -1 "";
    -1 "Constraints:";
    -1 "- p0 + p1 + p2 = 1";
    -1 "- 0 <= p0,p1,p2 <= 1";
    -1 "";
    -1 "Notes:";
    -1 "- q satisfies the probability generating function equation";
    -1 "- q = G(q)";
    -1 "- The relevant solution is the smallest root in [0,1]";
    -1 "";
    -1 "Goal:";
    -1 "- Formulate the recursive extinction equation.";
    -1 "- Solve for the valid probability.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "p0:1f%3;";
    -1 "p1:1f%3;";
    -1 "p2:1f%3;";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    };


/* *Solution Info ===============================================*
/* *extinctionProbability[p0;p1;p2]*
extinctionProbability:{[p0;p1;p2]
    a:p2;
    b:p1-1;
    c:p0;
    d:b*b-4*a*c;
    r1:(-b-sqrt d)%(2*a);
    r2:(-b+sqrt d)%(2*a);
    min r1 r2
    };
/* *=============================================================*/