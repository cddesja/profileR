#' Print a profile by group: testing parallel, coincidental, and level profiles
#' 
#' Prints the generic output from a \code{profg} object.
#'
#' @method print profg
#' @param x object of class \code{profg}
#' @param ... additional arguments affecting the output produced.
#' @seealso \code{\link{pbg}}
#' @export


print.profg <- function(x, ...){
  if (!inherits(x, "profg")) stop("Use only with 'profg' objects.\n")
	cat("\nData Summary:\n")
	print(x$data.summary)
  invisible(x) 
}

