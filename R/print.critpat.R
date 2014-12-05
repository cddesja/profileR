#' Print the criterion-related profile analysis
#' 
#' Prints the generic output from a \code{critpat} object.
#'
#' @method print critpat
#' @param x object of class \code{critpat}
#' @param ... additional arguments affecting the output produced.
print.critpat <- function(x, ...){
  if (!inherits(x, "critpat")) stop("Use only with 'critpat' objects.\n")
	cat("Call:\n")
	print(x$call)
  cat("\nCoefficients\n")
	print(x$b)
  invisible(x) 
}


