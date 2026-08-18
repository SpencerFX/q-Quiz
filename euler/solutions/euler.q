//====================================================================
// euler — solutions
//
// Expected output per problem, verified by running each problem's own
// solve function (euler/questions/problemNNNN.q, via .euler.ref.dict)
// against its registered input in euler/inputs/inputs.q - same
// convention as hackerRank/Solutions/sql.q.
//====================================================================

.solutions.euler.easy: (!) . flip raze 2 cut
    (
        (`problem0001; enlist 233168);          / sum of multiples of 3 or 5 below 1000
        (`problem0002; 4613732);                / sum of even Fibonacci terms not exceeding 4,000,000
        (`problem0003; 6857);                   / largest prime factor of 600851475143
        (`problem0004; 101101 793397);          / largest palindrome below 101110 / 800000 from a product of two 3-digit numbers
        (`problem0005; 6 2520);                 / smallest number evenly divisible by all of 1..3 / 1..10
        (`problem0006; 22 2640);                / sum-of-squares vs square-of-sum difference, first 3 / first 10 naturals
        (`problem0007; 5 13);                   / 3rd and 6th primes
        (`problem0008; 3150 0)                  / greatest product of 5 adjacent digits, two 10-digit test numbers
    );
