## Put comments here that give an overall description of what your
## functions do

##There are two functions makeCacheMatrix,library(MASS)
##makeCacheMatrix consists of set,get,setinv,getinv
##library(MASS) is used for calculating matrix

library(MASS)
makeCacheMatrix<-function(x=matrix()){
  inv<-NULL
  set<-function(y){
    x<<-y
    inv<<NULL
  }
  get<-function(x)
  setinv<-function(inverse)inv<<-inverse
  getinv<-function(){
    inver<-ginv(x)
    inver%*%x
  }
  list(set=set,get=get,
       setinv=setinv
       getinv=getinv)
}

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function
##This is used to get the cached data
cacheSolve <- function(x, ...) {
  inv<-x$getinv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data<-x$get()
  inv<-solve(data,...)
  x$setinv(inv)
  inv
        ## Return a matrix that is the inverse of 'x'
}
> f<-makeCacheMatrix(matrix(1:8,2,4))
> f$get()

