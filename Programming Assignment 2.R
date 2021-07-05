makecachematrix<-function(x=matrix()){
  i<-NULL
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  
  get<-function()x
  setinverse<-function(inverse)i<<-inverse
  getinverse<-function()i
  list(set=set,
       get=get,
       setinverse=setinverse,
       getinverse=getinverse)
}

cachesolve<-function(x,...){
  i<x$getinverse()
  message("getting cached data")
  return(i)
}

data<-x$get(){
i<-solve(data,...)
x$setinverse(i)
i
}

b<-matrix(c(1,2,3,4),2,2)

b1<-makecachematrix(b)
cachesolve(b1)
