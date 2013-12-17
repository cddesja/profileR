
#'@S3method summary critpat

summary.critpat <- function(object, ...){
	cat("Call:\n")
	print(object$call)
  cat("\n")
  cat("\nRelability\n")
	print(object$r2)
  cat("\n Level Component\n")
  print(object$lvl.comp)
  cat("\n Pattern Component \n")
  print(object$pat.comp)
}