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
  # init inverse cached matrix to NULL
  inv <- NULL
  # function to set a new value for the matrix
  set <- function(y) {
    # assign value
    x <<- y
    # reset cached inverse matrix to NULL
    inv <<- NULL
  }
  # function to obtain the value of the matrix
  get <- function() x
  # function to set the inverse matrix
  setInverse <- function(inverse) inv <<- inverse
  # function to get the inverse matrix
  getInverse <- function() inv
  # return a list containing the functions
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

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
  # get the cached inverse matrix      
  inv <- x$getInverse()
  # check if it is diffirent to NULL
  if(!is.null(inv)) {
    # if different (cached) return chaced inverse matrix (and display it was cached)
    message("getting cached data")
    return(inv)
  }
  # if it is NULL, calculate the inverse of the matrix
  # get matrix data (calling get() function)
  data <- x$get()
  # calculate the inverse of the matrix with solve()
  inv <- solve(data, ...)
  # set the value calculated (callint setInverse())
  x$setInverse(inv)
  # return the inverse matrix calculated
  inv		
}
