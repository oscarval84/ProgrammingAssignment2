## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  if (!is.matrix(x)) {
    stop("This is not a matrix")
  }
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  
  # Functions for getting and setting cached inv. matrix value
  get <- function() x
  # Inversing the matrix using build in solve() function in R
  setinverse <- function(solve) inverse <<- solve
  getinverse <- function() inverse
  
  list(
    set = set, 
    get = get,
    setinverse = setinverse,
    getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("Inverse matrix")
    return(x)
  }
  originalmatrix <- x$get()
  inverse <- solve(originalmatrix)
  x$setinverse(inverse)
        ## Return a matrix that is the inverse of 'x'
  inverse
}

