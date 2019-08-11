## Octave program

## This is the solution to the set of equality constraints that gives
## the cost-minimization problem in Meadows or Malls

## [ GR GD AR AD MR MD ]

A = [1,1,0,0,0,0,300;  0,0,1,1,0,0,100;  0,0,0,0,1,1,150;  0,1,0,1,0,1,300;  0,1,1,0,0,0,100;  0,0,0,0,1,0,0]

b = [300 100 150 300 100 0 ]'
A_1 = inv(A(:,1:6))
A_1 * b 


# Swap rows 5 and 6
A([5 6], :) = A([6 5], :)

# Replace row 3 with row 3 less row 5
A(3,:) = A(3,:) - A(5,:)

# Swap rows 3 and 6
A([3 6], :) = A([6 3], :)

# Replace row 4 with row 4 less row 6
A(4,:) = A(4,:) - A(6,:)

# Swap rows 2 and 4
A([2 4], :) = A([4 2], :)

A(3,:) = A(3,:) - A(2,:)

A(4,:) = A(4,:) + A(3,:)

A(3,:) = A(3,:) - 1/2 * A(4,:)

A([3 4], :) = A([4 3], :)

A(2,:) = A(2,:)  + A(4,:)

A(1,:) = A(1,:) - A(2,:)

A(3,:) = A(3,:)/2

A(4,:) = -1 * A(4,:)


