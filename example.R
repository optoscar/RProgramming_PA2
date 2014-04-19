# load example Vector funtions
source("makevector.R")
source("cachemean.R")

# create special vecto
aux <- makeVector(10:0)
# calculated mean (as it is the first time, i will calculate the mean, and cache its)
cachemean(aux)
# as it is the second time, it will get the cached mean
cachemean(aux)


# load cache Matrix funtions
source("CacheMatrix.R")
# create a new matrix
m1 <- matrix(c(1,2,3,4),2,2)
# calculate inverse
inv_m1 <- solve(m1)
# check inverse
m1%*%inv_m1

# create a special Matrix object
m2 <- makeCacheMatrix(m1)
m2$get()
# calculated inverse matrix (as it is the first time, i will calculate the inv, and cache its)
inv_m2 <- cacheSolve(m2)
# check the inverse
m2$get()%*%inv_m2
# as it is the second time, it will get the cached inv
inv_m2 <- cacheSolve(m2)
m2$get()%*%inv_m2

# set new matrix to M2 object
m3 <- matrix(c(4,5,6,7),2,2)
m2$set(m3)
# get new matrix
m2$get()
# check Inverse is NULL
m2$getInverse()
# calculated inverse matrix (as it is the first time, i will calculate the inv, and cache its)
inv_m2 <- cacheSolve(m2)
m2$get()%*%inv_m2
# as it is the second time, it will get the cached inv
inv_m2 <- cacheSolve(m2)
m2$get()%*%inv_m2
