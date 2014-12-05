#' ANOVA table for criterion-related profile analysis
#' 
#' Compute analysis of variance tables for the \code{critpat} object.
#' @method anova critpat
#' @param object \code{critpat} object resulting from \code{cpa}
#' @param ... additional arguments affecting the ANOVA table produced.
anova.critpat <- function(object, ...){
  cat("Call:\n")
  print(object$call)
  cat("\nAnalysis of Variance Table\n")
  cat("\n")
  print(object$ftable)
}

