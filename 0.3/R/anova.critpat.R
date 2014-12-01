#'@S3method anova critpat
anova.critpat <- function(object, ...){
	cat("Call:\n")
	print(object$call)
	cat("\nAnalysis of Variance Table\n")
	cat("\n")
	print(object$ftable)
}
