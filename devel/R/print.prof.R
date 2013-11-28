#'@S3method print prof

print.prof <- function(x, ...){
	cat("Subscore Reliability Estimates:\n")
	cat("\n")
	print(x$reliability)
}