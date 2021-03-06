## Put comments here that give an overall description of what your
## functions do

## creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) m <<-solve
    getInverse <- function() m
    list(set = set, 
         get = get,
         setInverse = setInverse, 
         getInverse = getInverse)
}
## computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cache data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setInverse(m)
    m
}
