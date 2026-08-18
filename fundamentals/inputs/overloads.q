/====================================================================*
/*
/* Helper values for entries whose input is too large/structured
/* to inline directly.
/*
/* These are intentionally small examples designed to test q
/* overloads, implicit iteration, indexing, projections, and
/* type-dependent behavior.
/*
/====================================================================*

/--------------------------------------------------------------------*
/* Basic vectors and mixed types
/*--------------------------------------------------------------------*

overloadInts:1 2 3 4 5;
overloadFloats:1.0 2.0 3.0 4.0 5.0;
overloadSymbols:`A`B`C`D;
overloadStrings:("A";"B";"C";"D");
overloadBools:1010b;


/--------------------------------------------------------------------*
/* Tables
/*--------------------------------------------------------------------*

overloadTrade:([] time:09:30 09:31 09:32; sym:`AAPL`MSFT`AAPL; price:100.5 200.2 101.0; size:100 200 150);

overloadQuote:([] time:09:30 09:31 09:32; sym:`AAPL`MSFT`AAPL; bid:100 200 100.5; ask:101 201 101.5);

overloadTrades2:([] sym:`AAPL`AAPL`MSFT`MSFT; price:100 101 200 201; size:100 150 200 250);

overloadQuotes2:([] sym:`AAPL`AAPL`MSFT`MSFT; bid:99 100 199 200; ask:101 102 201 202);


/--------------------------------------------------------------------*
/* Dictionaries
/*--------------------------------------------------------------------*

overloadDict:`a`b`c!10 20 30;

overloadDict2:`AAPL`MSFT`EURUSD!100 200 1.1;


/--------------------------------------------------------------------*
/* Keyed table
/*--------------------------------------------------------------------*

overloadKeyedTable:
  `sym xkey
  ([] sym:`AAPL`MSFT`EURUSD;
     price:100.5 200.2 1.1;
     size:100 200 100000);


/--------------------------------------------------------------------*
/* Nested / general lists
/*--------------------------------------------------------------------*

overloadNested:(1 2 3;4 5;6 7 8 9);

overloadMixed:(1;`A;2.5;"ABC";101b);


/--------------------------------------------------------------------*
/* Function helpers
/*--------------------------------------------------------------------*

overloadUnary:{x*x};

overloadBinary:{[x;y] x+y};

overloadTernary:{[x;y;z] x+y+z};

overloadType:{type x};

overloadCount:{count x};


/====================================================================*
/* EASY
/*====================================================================*

.inputs.overloads.easy: (!) . flip raze 2 cut
    (
        (`unaryPlus; enlist (1 2 3;4 5 6));                      / +(1 2 3;4 5 6) - flip needs a matrix/table, not a bare atom
        (`unaryMinus; enlist 5);                                 / -5
        (`binaryPlus; (5;3));                                    / 5+3
        (`binaryMinus; (5;3));                                   / 5-3
        (`binaryMultiply; (5;3));                                / 5*3
        (`binaryDivide; (10;2));                                 / 10%2
        (`vectorScalar; (1 2 3;10));                             / vector + scalar
        (`vectorVector; (1 2 3;4 5 6));                         / vector + vector
        (`scalarList; (10;1 2 3));                               / scalar + list
        (`listScalar; (1 2 3;10));                               / list + scalar
        (`typeOfArgument; enlist overloadInts);                  / type
        (`typeMismatch; (1b;5))                                  / boolean+int - resolved via automatic type promotion, not an error (a char+int mismatch, tried first, genuinely errors in q - too fragile to grade on exact error text)
    );


/====================================================================*
/* MEDIUM
/*====================================================================*

.inputs.overloads.medium: (!) . flip raze 2 cut
    (
        (`dictionaryLookup; (overloadDict;`b));                  / dict lookup
        (`dictionaryAssignment; (overloadDict;`b;99));            / dict assignment
        (`tableIndexing; (overloadTrade;1));                     / row indexing
        (`keyedTableIndexing; (overloadKeyedTable;`AAPL));        / key lookup
        (`listIndexing; (overloadInts;2));                       / list indexing
        (`indexingWithInteger; (overloadInts;3));                / integer index
        (`indexingWithList; (overloadInts;1 3));                 / list of indices
        (`indexingWithBoolean; (overloadInts;10101b));            / boolean index
        (`indexingWithSymbol; (overloadDict;`c));                 / symbol lookup
        (`functionApplication; (overloadUnary;5));               / function application
        (`monadicFunction; (overloadUnary;6));                   / unary function
        (`dyadicFunction; (overloadBinary;4;7));                 / binary function
        (`operatorOverload; (5;3));                               / overloaded +
        (`eachIterator; enlist 1 2 3 4);                         / each
        (`eachLeftIterator; (1 2 3;10 20 30));                   / each-left
        (`eachRightIterator; (1 2 3;10 20 30));                  / each-right
        (`eachPriorIterator; enlist 10 20 30 40)                 / each-prior
    );


/====================================================================*
/* HARD
/*====================================================================*

.inputs.overloads.hard: (!) . flip raze 2 cut
    (
        (`selectOverload; enlist overloadTrade);                 / select - unary, needs enlist so .[func;input;..] doesn't try to spread the table's rows as separate positional args
        (`updateOverload; enlist overloadTrade);                 / update
        (`deleteOverload; enlist overloadTrade);                 / delete
        (`amendOverload; enlist overloadInts);                   / amend
        (`joinOverload; (overloadTrade;overloadQuote));           / join
        (`asofJoinOverload; (overloadTrade;overloadQuote));       / aj
        (`functionComposition; enlist 5);                        / composition
        (`projection; (overloadBinary;5));                       / projection
        (`ternaryProjection; (overloadTernary;5;10));             / ternary projection
        (`variadicFunction; enlist 1 2 3 4);                     / variadic
        (`operatorFunction; enlist 1 2 3 4);                     / operator as function
        (`implicitIteration; enlist 1 2 3 4);                    / implicit iteration
        (`mixedTypeOverload; (1;2.5));                            / mixed numeric types
        (`typePromotion; (1;2.5));                               / numeric promotion
        (`errorOverload; ("ABC";1));                             / invalid overload
        (`systemFunctionOverload; enlist overloadTrade)           / system function
    );