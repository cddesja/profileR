
#'@S3method summary critpat

summary.critpat <- function(object, ...){
	cat("Call:\n")
	print(object$call)
  cat("\nRelability\n")
	print(object$r2)
  
  if(is.null(object$lvl.comp) == FALSE){
  cat("\n Level Component\n")
  print(object$lvl.comp)}
  if(is.null(object$pat.comp) == FALSE){
  cat("\n Pattern Component \n")
  print(object$pat.comp)
  }
}

