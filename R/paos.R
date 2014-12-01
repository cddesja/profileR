
#Profile Analysis for One Sample with Hotelling's T-Square
paos <- function(data, mu0=NULL) {
  if(is.null(mu0)) {mu0=1} else
  {mu0=mu0}
  
  data <- as.matrix(data)
  i=ncol(data)
  j=nrow(data)
  
  m <- rep(mu0,i)
  one <- matrix(1,nrow=j,ncol=1)
  ident <- diag(j)
  ybar <- t(data)%*%one/j
  s <- (t(data)%*%(ident-one%*%t(one)/j))%*%(data/(j-1))
  
  #ybar <- as.matrix(colMeans(data, na.rm=TRUE),nrow=i,ncol=1)
  #s <- cov(data)
  
  t2 <- j*t(ybar-mu0)%*%solve(s)%*%(ybar-mu0)
  f <- (j-i)*t2/i/(j-1)
  df1=i
  df2=j-i
  p <- 1-pf(f, df1, df2) 
  ftable <- data.frame(t2,f,df1,df2,p)
  colnames(ftable) <- c("T-Squared","F","df1","df2","p-value")
  rownames(ftable) <- c("Ho: Ratios of the means=Mu0")
  
  cat("\nProfile Analysis for One Sample with Hotelling's T-Square:\n")
  cat("\n")
  
  return(ftable)
}





