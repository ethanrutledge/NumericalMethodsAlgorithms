# NumericalMethodsAlgorithms

## Simpson
This program uses the Simpon's 1/3 rule to numerically integrate a function
### Inputs
x-given manipulated data
y-given function value with respect to x
### Output
I-solved integral value
### Warnings
x & y must be the same length
x must be evenly spaced
if odd number of intervals Trapezoidal Method will be used on last interval

## False Position Function
This program uses the false position method to find the root of a function over a given interval

### Inputs
func-the function
xl-lower bound
xu-upper bound
es- (optional-defaults to 0.0001)
maxiter-maximum iterations to be completed (optional-defualts to 200)

### Outputs
root-the x value of the root
fx-function evaluated at the root
ea-
iter-iterations completed

### Warnings
There must be a root within the given bounds

## LU Factor
This program uses LU factorization and partial pivoting to break A up into L, U, and P.

### Input
A-initial matrix 

### Outputs
L- Lower triangular matrix
U- Upper triangular matrix
P- Pivot matrix

### Warnings
A must be a square matrix
A must be the only input



