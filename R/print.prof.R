#' Print the pattern and level reliability via profile analysis
#' 
#' Prints the generic output from a \code{prof} object.
#'
#' @method print prof
#' @param x object of class \code{prof}
#' @param ... additional arguments affecting the output produced.
#' @seealso \code{\link{pr}}
#' @export

print.prof <- function(x, ...){
  if (!inherits(x, "prof")) stop("Use only with 'prof' objects.\n")
	cat("Subscore Reliability Estimates:\n")
	cat("\n")
	print(x$reliability)
  invisible(x)
}
