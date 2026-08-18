//====================================================================
// fundamentals — overloads solutions
//
// Expected output per problem, computed directly from
// .inputs.overloads.* (via the reference operation for each overload
// being tested) rather than hand-transcribed, so there's no risk of
// a typo'd expected value silently diverging from what the reference
// operation actually produces. See fundamentals/inputs/overloads.q
// for the underlying data and questions/overloads/*.q for what each
// problem asks for.
//
// A few overloads worth calling out because q's bare verb glyphs
// don't dispatch monadically the way most languages' do - the named
// function is the one that actually works:
//   - unaryMinus: bare "-x" errors; "neg x" is the real function.
//   - unaryPlus:  bare "+t" errors; "flip t" is the real function
//     (and needs a matrix/table, not a bare atom).
//====================================================================

.solutions.overloads.easy:
    `unaryPlus`unaryMinus`binaryPlus`binaryMinus`binaryMultiply`binaryDivide`vectorScalar`vectorVector`scalarList`listScalar`typeOfArgument`typeMismatch!(
        flip first .inputs.overloads.easy`unaryPlus;
        neg first .inputs.overloads.easy`unaryMinus;
        (.inputs.overloads.easy`binaryPlus)[0]+(.inputs.overloads.easy`binaryPlus)[1];
        (.inputs.overloads.easy`binaryMinus)[0]-(.inputs.overloads.easy`binaryMinus)[1];
        (.inputs.overloads.easy`binaryMultiply)[0]*(.inputs.overloads.easy`binaryMultiply)[1];
        (.inputs.overloads.easy`binaryDivide)[0]%(.inputs.overloads.easy`binaryDivide)[1];
        (.inputs.overloads.easy`vectorScalar)[0]+(.inputs.overloads.easy`vectorScalar)[1];
        (.inputs.overloads.easy`vectorVector)[0]+(.inputs.overloads.easy`vectorVector)[1];
        (.inputs.overloads.easy`scalarList)[0]+(.inputs.overloads.easy`scalarList)[1];
        (.inputs.overloads.easy`listScalar)[0]+(.inputs.overloads.easy`listScalar)[1];
        type first .inputs.overloads.easy`typeOfArgument;
        (.inputs.overloads.easy`typeMismatch)[0]+(.inputs.overloads.easy`typeMismatch)[1]
    );

.solutions.overloads.medium:
    `dictionaryLookup`dictionaryAssignment`tableIndexing`keyedTableIndexing`listIndexing`indexingWithInteger`indexingWithList`indexingWithBoolean`indexingWithSymbol`functionApplication`monadicFunction`dyadicFunction`operatorOverload`eachIterator`eachLeftIterator`eachRightIterator`eachPriorIterator!(
        (.inputs.overloads.medium`dictionaryLookup)[0] (.inputs.overloads.medium`dictionaryLookup)[1];
        {[d;k;v] d[k]:v; d} . .inputs.overloads.medium`dictionaryAssignment;
        (.inputs.overloads.medium`tableIndexing)[0] (.inputs.overloads.medium`tableIndexing)[1];
        (.inputs.overloads.medium`keyedTableIndexing)[0] (.inputs.overloads.medium`keyedTableIndexing)[1];
        (.inputs.overloads.medium`listIndexing)[0] (.inputs.overloads.medium`listIndexing)[1];
        (.inputs.overloads.medium`indexingWithInteger)[0] (.inputs.overloads.medium`indexingWithInteger)[1];
        (.inputs.overloads.medium`indexingWithList)[0] (.inputs.overloads.medium`indexingWithList)[1];
        / boolean bracket-indexing auto-casts the mask to 0/1 ints (a
        / real gotcha) rather than filtering - "where" is the actual
        / boolean-mask idiom
        (.inputs.overloads.medium`indexingWithBoolean)[0] where (.inputs.overloads.medium`indexingWithBoolean)[1];
        (.inputs.overloads.medium`indexingWithSymbol)[0] (.inputs.overloads.medium`indexingWithSymbol)[1];
        {[f;x] f x} . .inputs.overloads.medium`functionApplication;
        {[f;x] f x} . .inputs.overloads.medium`monadicFunction;
        {[f;x;y] f[x;y]} . .inputs.overloads.medium`dyadicFunction;
        (.inputs.overloads.medium`operatorOverload)[0]+(.inputs.overloads.medium`operatorOverload)[1];
        {x*x} each first .inputs.overloads.medium`eachIterator;
        {[a;b] a +\: b} . .inputs.overloads.medium`eachLeftIterator;
        {[a;b] a +/: b} . .inputs.overloads.medium`eachRightIterator;
        (-':) first .inputs.overloads.medium`eachPriorIterator
    );

.solutions.overloads.hard:
    `selectOverload`updateOverload`deleteOverload`amendOverload`joinOverload`asofJoinOverload`functionComposition`projection`ternaryProjection`variadicFunction`operatorFunction`implicitIteration`mixedTypeOverload`typePromotion`errorOverload`systemFunctionOverload!(
        select from first .inputs.overloads.hard`selectOverload where sym=`AAPL;
        update size2:size*2 from first .inputs.overloads.hard`updateOverload;
        delete price from first .inputs.overloads.hard`deleteOverload;
        @[first .inputs.overloads.hard`amendOverload;0;:;99];
        (first .inputs.overloads.hard`joinOverload) lj (`time`sym xkey last .inputs.overloads.hard`joinOverload);
        aj[`time`sym;first .inputs.overloads.hard`asofJoinOverload;last .inputs.overloads.hard`asofJoinOverload];
        neg sqrt first .inputs.overloads.hard`functionComposition;
        ({[f;x] (f[x;]) 100} . .inputs.overloads.hard`projection);
        ({[f;x;y] (f[x;y;]) 1} . .inputs.overloads.hard`ternaryProjection);
        sum first .inputs.overloads.hard`variadicFunction;
        +/[first .inputs.overloads.hard`operatorFunction];
        2*first .inputs.overloads.hard`implicitIteration;
        (.inputs.overloads.hard`mixedTypeOverload)[0]+(.inputs.overloads.hard`mixedTypeOverload)[1];
        type (.inputs.overloads.hard`typePromotion)[0]+(.inputs.overloads.hard`typePromotion)[1];
        .[+;.inputs.overloads.hard`errorOverload;{x}];
        count first .inputs.overloads.hard`systemFunctionOverload
    );
