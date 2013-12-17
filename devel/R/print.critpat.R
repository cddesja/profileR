
#'@S3method print critpat

print.critpat <- function(object, ...){
	cat("Call:\n")
	print(object$call)
  cat("\nCoefficients\n")
	print(object$b)
}