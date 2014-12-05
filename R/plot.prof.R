#' Plot profile
#'
#' Plots the profile
#'
#' @method plot prof
#' @export
#' @param x \code{prof} object resulting from \code{pr}
#' @param ... additional arguments affecting the plot produced.
#' @seealso \code{\link{pr}}
plot.prof <- function(x, ...){
	dat0 <- x$pattern.level
	dim <- ncol(dat0)
	dat1 <- as.data.frame(dat0[,c(dim/2,dim)])
	plot(dat1, xlab="Level 1", ylab="Level 2", ...)
}


