## A set of functions to cache or calculate the inverse of a matrix

## A Function that will cache the inverse

makeCacheMatrix <- function(m = matrix()) {

        i <- NULL
        set <- function( matrix ) {
                m <<- matrix
                i <<- NULL
        }
        
        get <- function() {
                ## Return the matrix
                m
        }
        
        setInverse <- function(inverse) {
                i <<- inverse
        }
        
        getInverse <- function() {
                ## Return the inverse property
                i
        }
        
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}


## function below returns the inverse of the matrix received from above function.
## Looking at the cache, the inverse will be looked up.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        
        if( !is.null(m) ) {
                message("getting cached data")
                return(m)
        }
        
        data <- x$get()
        
        m <- solve(data) %*% data
        
        x$setInverse(m)
 
        m       
}
