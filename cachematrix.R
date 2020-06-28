## makeCacheMatrix creatiz a matrix that can Cahce its inverse,
## understanding cahce as the idea of making it easier to rad and process
## a function withput using execive RAM memory

## cacheSolve takes that new Matrix and returns its inverse

  makeCacheMatrix <- function(New_Mat = matrix()) {
    ## declaring it a function that receives a new matrix
    mat1 <- NULL
    ## new empty object
    savedMat <- function(x){
      ## New function that receives a new matrix in this enviroment 
      New_Mat <<- x
      ## assign the new the matrix the one from the universal enviroment
      mat1 <<- NULL
      ## declaring again the new object empty in this enviroment
    }
    get <- function()New_Mat
    ## New phamtom function with the original matrix
    setInverse <- function(inv1) mat1 <<- inv1
    ## setting the object for the new object that later will invert the matrix
    getInverse <- function() mat1 
    ## getting the object for the new object
    list(savedMat = savedMat, get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
    ## making a list of all the variables checked
  }

cacheSolve <- function(New_Mat, ...) {
  ##function that recives the makeCacheMatrix funcion
  mat1 <- New_Mat$getInverse()
  ## storing the getInverse in a new object
  if(!is.null(mat1)){
    ## If contains someting enters here
    message("getting cached data")
    ## printin a message because we asume it proceesing and thinking
    return(mat1)
    ## returning the object
  }
  matrix1 <- New_Mat$get()
  ## getting the matrix in a new matrix to invert
  mat1 <- solve(matrix1,...)
  ## inverting the recently created matrix
  New_Mat$setInverse(mat1)
  ## calling the new matrix with the function from the global matrix
  mat1
  ## returning the inverted matrix
}

