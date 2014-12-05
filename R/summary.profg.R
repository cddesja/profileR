#' Summary of profile by group: testing parallel, coincidental, and level profiles
#'
#' Provides a summary of profile group
#'
#' @method summary profg
#' @param object object of class \code{profg}
#' @param ... additional arguments affecting the summary produced.
#' @export
#' @seealso \code{\link{pbg}}
summary.profg <- function(object, ...){
	cat("Call:\n")
	print(object$call)
	cat("\nHypothesis Tests:\n")
	print(object$profile.test)
}

