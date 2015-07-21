## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        #m <- NULL
        m <- matrix()
        
        set <- function(y) {
                x <<- y
                #m <<- NULL
                m <<- matrix()
        }
        get <- function() x
        
        setSolve <- function(InvMatrix) m <<- InvMatrix 
        getSolve <- function() m
        list(set = set, get = get,
             setSolve = setSolve,
             getSolve = getSolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- matrix()
        m <- x$getSolve()
        #message("blab1")
        #print(m)
        #f(!is.null(m)) {
        if(!is.na(m[[1,1]])) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setSolve(m)
        m
}
#list(makeCacheMatrix = makeCacheMatrix, cacheSolve = cacheSolve)
