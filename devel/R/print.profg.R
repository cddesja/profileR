
#'@S3method print profg

print.profg <- function(x, ...){
	cat("\nData Summary:\n")
	print(x$data.summary)
}

