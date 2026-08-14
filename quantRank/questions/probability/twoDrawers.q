/====================================================================/
/* *Two Drawers*
/*
/* *Uses Bayes' theorem to determine the probability that a black
/* *ball came from Drawer 1.*
/*
/* *Usage:*
/*      *.quiz.hackerRank.quant.probability.twoDrawers.info[]
/*====================================================================/
.quiz.hackerRank.quant.probability.twoDrawers.info:{
    -1 "/Question Info ===============================================";
    -1 "/";
    -1 "Two Drawers";
    -1 "";
    -1 "There are two drawers containing equal numbers of balls.";
    -1 "";
    -1 "Drawer 1 contains only black balls.";
    -1 "Drawer 2 contains 50% black balls and 50% white balls.";
    -1 "";
    -1 "A drawer is selected at random.";
    -1 "A ball is then selected from that drawer.";
    -1 "";
    -1 "The selected ball is black.";
    -1 "";
    -1 "Task:";
    -1 "- Calculate the probability that the ball came from Drawer 1.";
    -1 "";
    -1 "Example:";
    -1 "P(Black | Drawer 1) = 1";
    -1 "P(Black | Drawer 2) = 0.5";
    -1 "P(Drawer 1) = 0.5";
    -1 "P(Drawer 2) = 0.5";
    -1 "";
    -1 "Using Bayes' theorem:";
    -1 "";
    -1 "P(Drawer 1 | Black)";
    -1 " = P(Black | Drawer 1) * P(Drawer 1)";
    -1 "   --------------------------------";
    -1 "   P(Black)";
    -1 "";
    -1 "P(Black) =";
    -1 "  P(Black | Drawer 1) * P(Drawer 1)";
    -1 "  + P(Black | Drawer 2) * P(Drawer 2)";
    -1 "";
    -1 "Result:";
    -1 "0.6666667";
    -1 "";
    -1 "Function Description:";
    -1 "drawerProbability takes:";
    -1 "  - pBlack1: P(Black | Drawer 1)";
    -1 "  - pBlack2: P(Black | Drawer 2)";
    -1 "  - pDrawer1: P(Drawer 1)";
    -1 "";
    -1 "Returns:";
    -1 "  - P(Drawer 1 | Black)";
    -1 "";
    -1 "Constraints:";
    -1 "- 0 <= pBlack1 <= 1";
    -1 "- 0 <= pBlack2 <= 1";
    -1 "- 0 <= pDrawer1 <= 1";
    -1 "";
    -1 "Goal:";
    -1 "- Apply Bayes' theorem correctly.";
    -1 "- Calculate the conditional probability.";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    -1 "/ Input Info ==================================================";
    -1 "/";
    -1 "pBlack1:1f;";
    -1 "pBlack2:.5;";
    -1 "pDrawer1:.5;";
    -1 "/";
    -1 "/=============================================================";
    -1 "";
    };


/* *Solution Info ===============================================*
/* *drawerProbability[pBlack1;pBlack2;pDrawer1]*
drawerProbability:{[pBlack1;pBlack2;pDrawer1]
    pDrawer2:1-pDrawer1;
    (pBlack1*pDrawer1) % ((pBlack1*pDrawer1)+(pBlack2*pDrawer2))
    };
/* *=============================================================*/