## The Second Program assignment 
## Matrix inversion is usually a costly computation 
## so we will be caching the inverse of a matrix rather than
## compute it repeatedly

## makeCacheMatrix is a function that stores a list of functions,
##  get, set, getSolve, and setSolve.

makeCacheMatrix <- function(x = matrix()) {
        m <- matrix()
       
        set <- function(y) {
                x <<- y
                m <<- matrix()
        }
        get <- function() x
        setSolve <- function(InvMatrix) m <<- InvMatrix 
        getSolve <- function() m
        list(set = set, get = get,
             setSolve = setSolve,
             getSolve = getSolve)
}


## cacheSolve returns the stored Inverted Matrix from memory,
## or computes one.

cacheSolve <- function(x, ...) {
        m <- matrix()
        m <- x$getSolve()
        if(!is.na(m[[1,1]])) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setSolve(m)
        m
}
