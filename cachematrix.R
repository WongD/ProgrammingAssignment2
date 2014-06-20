## Functions to invert a matrix and cache results
## If the inversion has been carried out immediately previously the cached value should be returned 
## ------------------------------------------------------------------------------------

## set matrix object and cache, set inverted matrix and cache

makeCacheMatrix <- function(x = matrix()) {
  
        ## initialise matrix to x (m), inverted matrix mi to null
        m <<- x            ## assign initial matrix entry
        mi<- NULL
        
        ## set matrix 
        set <- function(y) {
        m<<-y             ## assign matrix to m (global)
        mi<<-NULL                   
                           }
        
        ## get cached matrix 
        get <- function() m    ## get cached matrix
        
        ## set inverted matrix
        setmi <- function(z){  ## set inverted matrix
        mi<<-z              }
        
        ##get inverted matrix 
        getmi <- function() mi ## get inverted matrix
        
        list (set=set, get=get, setmi=setmi, getmi=getmi) ## create list of functions 
}

## If inverted matrix has not been already cached, invert it and cache otherwise return the cached value
cacheSolve <- function(x, ...) {
  
        ## Check if there is no inverted matrix is in the cache OR if the existing matrix differs
        
        a<- x$getmi()
        b<- x$get()
      	
        if (is.null(a)|!identical(m,b)) {
        ## Invert the matrix and cache result
              result <-solve(x$get())   ## invert the matrix
            	x$setmi(result)           ## cache the inverted matrix
            	print (result)            ## print the result 
              }           
      	else {
            	## Otherwise return the cached value
            	result <- x$getmi()
              print ("Retrieving cache...")
              print (result)  
      	}
}




