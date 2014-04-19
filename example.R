# load example Vector funtions
source("makevector.R")
source("cachemean.R")

# create special vecto
aux <- makeVector(10:0)
# calculated mean (as it is the first time, i will calculate the mean, and cache its)
cachemean(aux)
# as it is the second time, it will get the cached mean
cachemean(aux)



