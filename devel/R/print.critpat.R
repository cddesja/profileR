
#'@S3method print critpat

print.critpat <- function(x, ...){
	cat("Call:\n")
	print(object$call)
  cat("\nCoefficients\n")
	print(object$b)
}