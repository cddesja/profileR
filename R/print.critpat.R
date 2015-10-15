#' @method print critpat
#' @export

print.critpat <- function(x, ...){
  if (!inherits(x, "critpat")) stop("Use only with 'critpat' objects.\n")
	cat("Call:\n")
	print(x$call)
  cat("\nCoefficients\n")
	print(x$b)
  invisible(x) 
}
