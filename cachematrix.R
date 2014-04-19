## This functions create a special "matrix" object in order to store a matrix, and cache its is inverse.
## This behaviour can help to improve performance if the inverse of a matrix has to be calculated 
## repetitively (e.g. in a for loop)

## makeCacheMatrix <- function(x = matrix()) 
## The first function, makeVector creates a special "matrix", 
## which is really a list containing a function to:
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the Inverse
## 4. get the value of the Inverse
## Input:  	x -> data of a matrix
## output:	Special "matrix" object with its list of four functions. 
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

## cacheSolve <- function(x, ...)
## The following function calculates the Inverse of the special "matrix" created with the above function. 
## However, it first checks to see if the Inverse has already been calculated. 
## If so, it gets the Inverse from the cache and skips the computation. 
## Otherwise, it calculates the Inverse of the data and sets the value of the Inverse in the cache via the setInverse function.
## Input:	x <- special matrix created with the above function
## Output:	inv <- the inverse of the matrix X
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInverse(inv)
  inv		
}
