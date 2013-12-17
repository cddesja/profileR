#'@S3method plot critpat

plot.critpat <- function(x, y, ...){
  plot(x$xc, type="b",ylab="Criterion Pattern Score")
  abline(a=0,b=0)
  text(x$xc,labels(x$xc), cex=1, pos=3)
}