
#'@S3method summary profg

summary.profg <- function(x, ...){
	cat("Call:\n")
	print(x$call)
	cat("\nHypothesis Tests:\n")
	print(x$profile.test)
}

