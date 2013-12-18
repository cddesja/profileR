#'@S3method plot critpat

plot.critpat <- function(x, ...){
  if(is.null(x$xc) == TRUE)
  {
    dat0 <- as.data.frame(x$b[[1]]) 
    plot(dat0,type="b",col = "black", ylim = c(-1,1), ylab = "Estimated Parameters")
    abline(a=0,b=0)
    lines(x=x$b[[2]],type = "b", col = "red")
    text(x$b[[1]],labels(x$b[[1]]), cex = 1, pos = 1)
  }
  if(is.null(x$xc) == FALSE){
  dat0 <- as.data.frame(x$xc) 
  plot(dat0, type="b",ylab="Criterion Pattern Score")
  abline(a=0,b=0)
  text(x$xc,labels(x$xc), cex=1, pos=3)
  }
}
