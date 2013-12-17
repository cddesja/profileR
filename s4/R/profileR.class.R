setClass(
  Class="profileR",
  representation=representation(
    R2.full="matrix",
    R2.patO="matrix",
    R2.lvlO="matrix",
    R2.full.lvl="matrix",
    R2.full.pat="matrix",
    call="call",
    lvl.comp="numeric",
    pat.comp="data.frame",
    b="numeric",
    bstar="numeric",
    xc="numeric",
    k="numeric",
    Covpc="matrix",
    Ypred="numeric",
    ftable="matrix",
    reliability="matrix",
    pattern.level="matrix",
    data.summary="matrix",
    corr.table="matrix",
    profile.test="data.frame",
    method="character"
  ),
  prototype=prototype(
    R2.full=matrix(0),
    R2.patO=matrix(0),
    R2.lvlO=matrix(0),
    R2.full.lvl=matrix(0),
    R2.full.pat=matrix(0),
    lvl.comp=numeric(0),
    pat.comp=data.frame(),
    b=numeric(0),
    bstar=numeric(0),
    xc=numeric(0),
    k=numeric(0),
    Covpc=matrix(0),
    Ypred=numeric(0),
    ftable=matrix(0),
    reliability=matrix(0),
    pattern.level=matrix(0),
    data.summary=matrix(0),
    corr.table=matrix(0),
    profile.test=data.frame(),
    method="character"
  ),        	
  validity = function(object) return(TRUE)
)

#------------------------------------------------------------------------------#

setMethod(
  f = "show",
  signature = signature(object = "profileR"),
  definition = function(object) {
    print(object)
  }
)


setMethod(
  f = "print",
  signature = signature(object = "profileR"),
  definition = function(object)
  {
    if (object@method=="profile.reliability") {
      cat("******Profile Reliability Estimates******\n")
      cat("\n")
      print(object@reliability)
    }
	if(x@method=="criterion.pattern"){
	print(object@r2)	
	}	
    else {
      print(object)
    }
  }
)

setMethod(
  f = "summary",
  signature = signature(object = "profileR"),
  definition = function(object) {
    if (object@method=="criterion.pattern") {
     
 cat("Call:\n")
      print(object@call)
      cat("\nAnalysis of Variance\n")
      cat("\n")
      print(object@ftable)
    }
    if (x@method=="profile.by.group") {
      cat("Call:\n")
      print(object@call)
      cat("\n*****Hypothesis Tests:*****\n")
      print(object@profile.test)
    }
  }
)

setMethod(
  f = "plot",
  signature = signature(x = "profileR", y = "missing"),
  definition = function(x, y, ...){
    if (x@method=="profile.reliability"){
      dat0 <- x@pattern.level
      dim <- ncol(dat0)
      dat1 <- as.data.frame(dat0[,c(dim/2,dim)])
      plot(dat1, xlab="Level 1", ylab="Level 2", main="Level 1 vs. Level 2", ...)
    }
  }
)
