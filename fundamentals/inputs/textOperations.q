//====================================================================
// fundamentals — textOperations inputs
//
// Own dedicated fixtures, same pattern as fundamentals/inputs/joins.q.
//
// Covers 10 core string-processing keywords: like, lower, ltrim, md5,
// rtrim, ss, ssr, string, trim, upper - one question each.
//
// Named "textOperations" rather than the more obvious "text" - qIdioms
// already has its own, completely unrelated .inputs.text.*/
// .solutions.text.* (qIdioms/inputs/text.q, character-matrix-formatting
// idioms). q's namespace is flat and global regardless of which file
// defines it, so reusing "text" here would have silently clobbered (or
// been clobbered by) that other section's fixtures depending on load
// order - caught by grepping for the name before creating anything,
// same lesson as banksDebug/general's earlier collision with
// banks/general this session.
//====================================================================

.inputs.textOperations.easy:
    `lowerCase`upperCase`stringCast`trimBoth!(
        (enlist "HELLO World");
        (enlist "hello World");
        (enlist 42);
        (enlist "  hello  ")
    );

.inputs.textOperations.medium:
    `ltrimLeft`rtrimRight`likeMatch!(
        (enlist "  hello  ");
        (enlist "  hello  ");
        ("hello";"h*o")
    );

.inputs.textOperations.hard:
    `ssFind`ssrReplace`md5Hash!(
        ("the cat sat on the mat";"at");
        ("hello world";"o";"0");
        (enlist "hello")
    );
