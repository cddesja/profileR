
#'@S3method print critpat

print.critpat <- function(x, ...){
	cat("Call:\n")
	print(x$call)
  cat("\nCoefficients\n")
	print(x$b)
}