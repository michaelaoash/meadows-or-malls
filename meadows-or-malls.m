## Octave program

## This program analyzes  the particular set of equality constraints
## that gives the cost-minimizing solution in Meadows or Malls

## x = [ GR AR MR GD AD MD ]

c = [50 200 100 500 2000 1000]


A = [1,0,0,1,0,0;  0,1,0,0,1,0;  0,0,1,0,0,1;  0,0,0,1,1,1;  0,0,1,0,0,0;  0,1,0,1,0,0]
b = [300 100 150 300 0 100 ]'

## Solve by inverting A
A_1 = inv(A)
A_1 * b



## Solve by row operations on the augmented matrix 
A_aug = [A b]

## Replace row 6 with row 6 less row 2
A_aug(6, :) = A_aug(6, :) - A_aug(2, :)

## Switch rows 3 and 5
A_aug([3 5], :) = A_aug([5 3], :)

## Replace row 5 with row 5 less row 3
A_aug(5, :) = A_aug(5, :) - A_aug(3, :)

## Replace row 6 with row 6 less row 4
A_aug(6, :) = A_aug(6, :) - A_aug(4, :)

## Switch rows 5 and 6
A_aug([5 6], :) = A_aug([6 5], :)

## Divide row 5 by -2
A_aug(5, :) = A_aug(5, :) / -2

## The matrix is now upper triangular and I could solve by substitution.
## Or continue with row operations

## Replace row 5 with row 5 less one half of row 6 
A_aug(5, :) = A_aug(5, :) - A_aug(6, :) / (2)

## Replace row 4 with row 4 less row 6 and then subtract row 5
A_aug(4, :) = A_aug(4, :) - A_aug(6,:) - A_aug(5,:)

## Replace row 2 with row 2 less row 5
A_aug(2, :) = A_aug(2, :) - A_aug(5,:)

## Replace row 1 with row 1 less row 4
A_aug(1, :) = A_aug(1, :) - A_aug(4,:)


## Compute the cost of this solution
c *  A_aug(:, 7)

