
#'@S3method summary critpat

summary.critpat <- function(object, ...){
	cat("Call:\n")
	print(object$call)
	cat("\nHypothesis Tests:\n")
	cat("\n")
	print(object$F.table)
}