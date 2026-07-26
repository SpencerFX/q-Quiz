/ Question Info ===============================================
/ Staircase
/ Given a positive integer n, print a staircase of height n using
/ the '#' symbol and spaces.
 
/ The staircase should be right-aligned, meaning:
/ - The last line has n '#' characters
/ - Each preceding line has one fewer '#'
/ - Leading spaces are used to align the staircase to the right

/ Task:
/ - Print n lines
/ - For each line i (1 to n):
/     - Print (n - i) spaces followed by i '#' characters

/ Example:
/ n = 4

/ Output:
/    #
/   ##
/  ###
// ####

/ Explanation:
/ - Line 1: 3 spaces + 1 '#'
/ - Line 2: 2 spaces + 2 '#'
/ - Line 3: 1 space  + 3 '#'
/ - Line 4: 0 spaces + 4 '#'

/ Function Description:
/ staircase takes:
/   - n: integer height of the staircase

/ Returns:
/   - None (prints pattern to standard output)
 
/ Input Format:
/ - A single integer n

/ Constraints:
/ - 1 ≤ n ≤ 100

/ Notes:
/ - Use spaces (' ') for padding
/ - Ensure right alignment
/ - Each line should be printed separately

/ Goal:
/ - Correctly format and print the staircase pattern
/ - Maintain proper spacing and alignment
/ =============================================================


/ Input Info ==================================================
input: 6;
/ =============================================================


/ Solution Info ===============================================
/ staircase input
staircase:{[n] {((x-y)#" "), y#"#"}[n;]each 1+til n};
/ =============================================================