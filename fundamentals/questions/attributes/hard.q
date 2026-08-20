//====================================================================
// HARD
//====================================================================

.fundamental.attributes.inPlaceAppendPreservesAttr:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Attributes - In-Place Append Preserves `s#";
    -1 "======================================";
    -1 "";
    -1 "Given an `s# list xs and a value y that keeps it sorted, amend xs IN PLACE (xs,:y) and return attr xs afterwards using input: .inputs.attributes.hard.inPlaceAppendPreservesAttr";
    -1 "Input: ", -3!.inputs.attributes.hard`inPlaceAppendPreservesAttr;
    -1 "Expected Output: ", -3!.solutions.attributes.hard`inPlaceAppendPreservesAttr
 };

.fundamental.attributes.joinDropsAttr:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Attributes - A Plain Join Drops `s#";
    -1 "======================================";
    -1 "";
    -1 "Same xs and y as the in-place case, but build a NEW list with a plain join (xs,y) instead of amending in place, and return its attribute - using input: .inputs.attributes.hard.joinDropsAttr";
    -1 "Input: ", -3!.inputs.attributes.hard`joinDropsAttr;
    -1 "Expected Output: ", -3!.solutions.attributes.hard`joinDropsAttr
 };

.fundamental.attributes.stripAttrExplicitly:{[]
    -1 "";
    -1 "======================================";
    -1 " Fundamentals - Attributes - Removing An Attribute";
    -1 "======================================";
    -1 "";
    -1 "Use `# (an empty attribute) to explicitly strip whatever attribute a value already has, then return attr of the result, using input: .inputs.attributes.hard.stripAttrExplicitly";
    -1 "Input: ", -3!.inputs.attributes.hard`stripAttrExplicitly;
    -1 "Expected Output: ", -3!.solutions.attributes.hard`stripAttrExplicitly
 };
