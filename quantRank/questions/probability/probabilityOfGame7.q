/====================================================================/
/* *Probability of Game 7*
/*
/* *Calculates the probability that a best-of-seven series reaches
/* *Game 7.*
/*
/* *Usage:*
/*      *.quiz.hackerRank.quant.probability.game7.info[]
/*====================================================================/
.quiz.hackerRank.quant.probability.game7.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Probability of Game 7";
    -1 "";
    -1 "An NBA Finals series is played as a best-of-seven series.";
    -1 "";
    -1 "The Eastern Conference team has probability p of winning";
    -1 "each individual game.";
    -1 "";
    -1 "Games are independent and p remains constant.";
    -1 "";
    -1 "Task:";
    -1 "- Calculate the probability that the series reaches Game 7.";
    -1 "";
    -1 "For the series to reach Game 7, the teams must be tied";
    -1 "3-3 after the first six games.";
    -1 "";
    -1 "Therefore the Eastern team must win exactly 3 of the";
    -1 "first 6 games.";
    -1 "";
    -1 "There are C(6,3) possible arrangements.";
    -1 "";
    -1 "Each arrangement has probability:";
    -1 "p^3 * (1-p)^3";
    -1 "";
    -1 "Therefore:";
    -1 "";
    -1 "P(Game 7) = C(6,3) * p^3 * (1-p)^3";
    -1 "";
    -1 "Example:";
    -1 "p = 0.5";
    -1 "";
    -1 "P(Game 7) = 20 * 0.5^3 * 0.5^3";
    -1 "";
    -1 "Result:";
    -1 "0.3125";
    -1 "";
    -1 "Function Description:";
    -1 "probGame7 takes:";
    -1 "  - p: probability of the Eastern team winning a game";
    -1 "";
    -1 "Returns:";
    -1 "  - probability that the series reaches Game 7";
    -1 "";
    -1 "Constraints:";
    -1 "- 0 <= p <= 1";
    -1 "";
    -1 "Goal:";
    -1 "- Recognize the binomial distribution.";
    -1 "- Calculate the probability of exactly 3 wins in 6 games.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "p:.5;";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    };


/* *Solution Info ===============================================*
/* *probGame7[p]*
probGame7:{[p]
    / q has no operator precedence - it evaluates strictly right to
    / left, so the unparenthesised form bound "3*(1-p)xexp 3" as one
    / exponent (p^(3(1-p)^3)) instead of (p^3)*((1-p)^3)
    20*(p xexp 3)*((1-p)xexp 3)
    };
/* *=============================================================*/