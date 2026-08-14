/====================================================================/
/* *Two Children*
/*
/* *Calculates the conditional probability that both children are
/* *boys given that at least one child is a boy.*
/*
/* *Usage:*
/*      *.quiz.hackerRank.quant.probability.twoChildren.info[]
/*====================================================================/
.quiz.hackerRank.quant.probability.twoChildren.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Two Children";
    -1 "";
    -1 "A family has exactly two children.";
    -1 "";
    -1 "Each child independently has probability p of being a boy.";
    -1 "";
    -1 "You are told that at least one child is a boy.";
    -1 "";
    -1 "Task:";
    -1 "- Calculate the probability that both children are boys.";
    -1 "";
    -1 "For p = 0.5 the possible outcomes are:";
    -1 "";
    -1 "BB";
    -1 "BG";
    -1 "GB";
    -1 "GG";
    -1 "";
    -1 "Given that at least one child is a boy, GG is removed.";
    -1 "";
    -1 "Remaining outcomes:";
    -1 "";
    -1 "BB";
    -1 "BG";
    -1 "GB";
    -1 "";
    -1 "Therefore:";
    -1 "";
    -1 "P(BB | at least one B) = 1 / 3";
    -1 "";
    -1 "Result:";
    -1 "0.3333333";
    -1 "";
    -1 "Function Description:";
    -1 "probTwoBoys takes:";
    -1 "  - pBoy: probability that a child is a boy";
    -1 "";
    -1 "Returns:";
    -1 "  - probability that both children are boys given";
    -1 "    that at least one child is a boy";
    -1 "";
    -1 "Constraints:";
    -1 "- 0 < pBoy < 1";
    -1 "";
    -1 "Notes:";
    -1 "- P(BB) = pBoy^2";
    -1 "- P(at least one B) = 1 - (1-pBoy)^2";
    -1 "";
    -1 "Goal:";
    -1 "- Correctly calculate the conditional probability.";
    -1 "- Avoid incorrectly assuming the conditional sample space";
    -1 "  contains only two outcomes.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "pBoy:.5;";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    };


/* *Solution Info ===============================================*
/* *probTwoBoys[pBoy]*
probTwoBoys:{[pBoy]
    pBB:pBoy xexp 2;
    pAtLeastOne:1-(1-pBoy)xexp 2;
    pBB%pAtLeastOne
    };
/* *=============================================================*/