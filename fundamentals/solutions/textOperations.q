//====================================================================
// fundamentals — textOperations solutions
//
// Expected output per problem, computed directly (see
// fundamentals/inputs/textOperations.q for background, including why
// this kind is named "textOperations" rather than "text").
//
// Two gotchas surfaced verifying these live, both worth knowing:
//   - ssrReplace: ssr replaces every occurrence of the match, not just
//     the first - "hello world" with "o"->"0" gives "hell0 w0rld",
//     both o's.
//   - ssFind: ss finds substring matches anywhere, including inside
//     longer words - "at" inside "the cat sat on the mat" matches
//     within "cat"/"sat"/"mat" (indices 5, 9, 20), not just as a
//     standalone word.
//====================================================================

.solutions.textOperations.easy:
    `lowerCase`upperCase`stringCast`trimBoth!(
        "hello world";
        "HELLO WORLD";
        "42";
        "hello"
    );

.solutions.textOperations.medium:
    `ltrimLeft`rtrimRight`likeMatch!(
        "hello  ";
        "  hello";
        1b
    );

.solutions.textOperations.hard:
    `ssFind`ssrReplace`md5Hash!(
        5 9 20;
        "hell0 w0rld";
        0x5d41402abc4b2a76b9719d911017c592
    );
