
#'@S3method print profg

print.profg <- function(x, ...){
  if (!inherits(x, "profg")) stop("Use only with 'profg' objects.\n")
	cat("\nData Summary:\n")
	print(x$data.summary)
  invisible(x) 
}
