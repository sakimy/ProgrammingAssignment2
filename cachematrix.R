## These functions will create a matrix object to cache the inverse matrix
## and then compute the inverse of makeCacheMatrix

## Create a matrix object

makeCacheMatrix <- function(x = matrix()) {
        ## x = an invertible matrix
        ## returns a list containing functions to 
        ##      a. set the matrix
        ##      b. get the matrix
        ##      c. set the inverse
        ##      d. get the inverse
        ## this list will be input for cacheSolve()
        
        inv = NULL
        set = function(y) {
                x <<- y
                inv <<- NULL
        }
        get = function() x
        setinv = function(inverse) inv <<- inverse
        getinv = funtion() inv
        list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Compute inverse of makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## x = result from makeCacheMatrix()
        ## returns inverse of original matrix input in makeCacheMatrix()
        inv = x$getinv()
        
        # if the inverse has already been calculated
        if (!is.null(inv)) {
                #pull from cache and skip computing
                message("getting cached data")
                return(inv)
        }
        
        # if inverse not calculated, then calculated it
        mat.data = x$get()
        inv = solve(mat.data, ...)
        
        # sets value of inverse in cache
        x$setinv(inv)
        return(inv)
}