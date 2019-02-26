#The following two functions will calculate the inverse of a matrix and store it in a cache for furture retrievement.

# makeCacheMatrix function is a setter and getter that caches the objects defined within the function.

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
# Assign values using <<- to x and s in the parent environment      
         set <- function(matrix) {
                x <<- matrix
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) s <<- solve
        getsolve <- function() s
#Creat a list of 4 functions in MakeCacheMatrix to use the $ operator       
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


# cacheSolve tests if the inverse of a matrix is already cached and calculate the inverse if it hasn't been cached.

cacheSolve <- function(x, ...) {
        s <- x$getsolve()
# Test to see if the inverse of a matrix has been calculated before
         if(!is.null(s)) {
                message("getting cached data")
                return(s)
        }
        data <- x$get()
        s <- solve(data, ... )
        x$setsolve(s)
        s
}
        ## Return a matrix that is the inverse of 'x'

