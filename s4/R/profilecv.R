#' @name profilecv
#' @title Cross-Validation for Profile Analysis
#' @aliases profilecv
#' @description Implements the cross-validation described in Davison & Davenport (2002).
#' @usage profilecv(x, y)
#' @param x Corresponds to the predictor variable
#' @param y Corresponds to the dependent variable
#'  
#' @details The \code{profile.cv} function requires two arguments: X and Y. The argument X corresponds to the predictor variables. 
#' This matrix of covariates may be in their own object or in the same object as the dependent variable. 
#' The Y argument corresponds to the dependent variable. This vector may be in a separate object or in the same object as X. 
#' The function returns the cross-validation technique described in Davison & Davenport (2002). 
#' The data must be specified as matrices and there can be no missing data.
#' 
#' @return
#'  \item{R2.full}{Test of the null hypothesis that R2 = 0}
#'  \item{R2.pat}{Test that the R2_pattern = 0}
#'  \item{R2.level}{Test that the R2_level = 0}
#'  \item{R2.full.lvl}{Test that the R2_full = R2_level = 0}
#'  \item{R2.full.pat}{Test that the R2_full = R2_pattern = 0}
#'
#' @author Christopher David Desjardins \email{cddesjardins@@gmail.com}
#'  
#' @references 
#' Davison, M., & Davenport, E. (2002). Identifying criterion-related patterns of predictor scores
#' using multiple regression. \emph{Psychological Methods, 7}(4), 468-484.
#' 
#' @seealso \code{\link{criterion.pattern}}
#' 
#' @keywords methods
#' 
#' @export  

profilecv <- function(x,y){
  k <- 1
  index <- 1:nrow(x)
  index.samp <- sample(index,nrow(x)/2)
  X1 <- x[index.samp,]
  X2 <- x[-index.samp,]
  Y1 <- y[index.samp]
  Y2 <- y[-index.samp]
  N1 <- nrow(X1)
  N2 <- nrow(X2)
  V1 <- 1/ncol(X1)
  V2 <- 1/ncol(X2)
  dv.X1 <- "Y1 ~ 1"
  dv.X2 <- "Y2 ~ 1"
  pred <- colnames(x)
  basic <- paste(pred,collapse="+",sep="")
  formX1 <- as.formula(paste(dv.X1,"+",basic,sep=""))
  formX2 <- as.formula(paste(dv.X2,"+",basic,sep=""))
  regweg.X1<- coef(lm(formula=formX1,data=as.data.frame(cbind(X1,Y1))))
  regweg.X2<- coef(lm(formula=formX2,data=as.data.frame(cbind(X2,Y2))))
  X1.b <- regweg.X1[-1]
  X2.b <- regweg.X2[-1]
  X1.bstar <- X1.b - mean(X1.b)
  X2.bstar <- X2.b - mean(X2.b)
  X1.xc <- k*X1.bstar # criterion-pattern
  X2.xc <- k*X2.bstar
  Xp.X1 <- apply(X1,1,mean)
  Xp.X2 <- apply(X2,1,mean)
  pat.compX1 <- X1 - apply(X1,1,mean)
  pat.compX2 <- X2 - apply(X2,1,mean)
  Covpc.X1 <- V1*(as.matrix(pat.compX1)%*%as.matrix(X2.xc))
  Covpc.X2 <- V2*(as.matrix(pat.compX2)%*%as.matrix(X1.xc))
  R2.lvl.rs1 <- cor(Xp.X1,Y1)^2
  R2.lvl.rs2 <- cor(Xp.X2,Y2)^2
  R2.pat.rs1 <- cor(Covpc.X1,Y1)^2
  R2.pat.rs2 <- cor(Covpc.X2,Y2)^2
  ypredrs1 <- fitted(lm(Y1 ~ 1 + Covpc.X1 + Xp.X1))
  ypredrs2 <- fitted(lm(Y2 ~ 1 + Covpc.X2 + Xp.X2))
  
  R2.f.rs1 <- cor(ypredrs1,Y1)^2
  R2.f.rs2 <- cor(ypredrs2,Y2)^2
  
  df.f1 <- c(1,N1-3)
  df.f2 <- c(1,N2-3)
  
  df.rs1 <- c(1,N1-2)
  df.rs2 <- c(1,N2-2)
  
  
  F.R2.fullrs1 <- (R2.f.rs1*df.f1[2])/((1-R2.f.rs1)*df.f1[1])
  F.R2.fullrs2 <- (R2.f.rs2*df.f2[2])/((1-R2.f.rs2)*df.f2[1])
  p.value.F.R2.fullrs1 <- pf(F.R2.fullrs1,df.f1[1],df.f1[2],lower.tail = FALSE)
  p.value.F.R2.fullrs2 <- pf(F.R2.fullrs2,df.f2[1],df.f2[2],lower.tail = FALSE)
  r2.frs <- rbind(R2.f.rs1,R2.f.rs2)
  r2.frF <- rbind(F.R2.fullrs1,F.R2.fullrs2)
  r2.fr.p <- rbind(p.value.F.R2.fullrs1,p.value.F.R2.fullrs2)
  df.full <- rbind(df.f1,df.f2)
  r2.full <- cbind(r2.frs,r2.frF,df.full,r2.fr.p)
  rownames(r2.full) <- c("Random Sample 1","Random Sample 2")
  colnames(r2.full) <- c("R2","F.statistic","df1","df2","pvalue")
  
  F.R2.patOrs1 <- (R2.pat.rs1*df.rs1[2])/((1-R2.pat.rs1)*df.rs1[1])
  F.R2.patOrs2 <- (R2.pat.rs2*df.rs2[2])/((1-R2.pat.rs2)*df.rs2[1])
  p.value.F.R2.patOrs1 <- pf(F.R2.patOrs1,df.rs1[1],df.rs1[2],lower.tail = FALSE)
  p.value.F.R2.patOrs2 <- pf(F.R2.patOrs2,df.rs2[1],df.rs2[2],lower.tail = FALSE)
  r2.patOrs <- rbind(R2.pat.rs1,R2.pat.rs2)
  r2.pOrF <- rbind(F.R2.patOrs1,F.R2.patOrs2)
  r2.pOr.p <- rbind(p.value.F.R2.patOrs1,p.value.F.R2.patOrs2)
  df.pat <- rbind(df.rs1,df.rs2)
  R2.patO <- cbind(r2.patOrs,r2.pOrF,df.pat,r2.pOr.p)
  rownames(R2.patO) <- c("Random Sample 1","Random Sample 2")
  colnames(R2.patO) <- c("R2","F.statistic","df1","df2","pvalue")
  
  F.R2.lvlOrs1 <- (R2.lvl.rs1*df.rs1[2])/((1-R2.lvl.rs1)*df.rs1[1])
  F.R2.lvlOrs2 <- (R2.lvl.rs2*df.rs2[2])/((1-R2.lvl.rs2)*df.rs2[1])
  p.value.F.R2.lvlOrs1 <- pf(F.R2.lvlOrs1,df.rs1[1],df.rs1[2],lower.tail = FALSE)
  p.value.F.R2.lvlOrs2 <- pf(F.R2.lvlOrs2,df.rs2[1],df.rs2[2],lower.tail = FALSE)
  r2.lvlOrs <- rbind(R2.lvl.rs1,R2.lvl.rs2)
  r2.lOrF <- rbind(F.R2.lvlOrs1,F.R2.lvlOrs2)
  r2.lOr.p <- rbind(p.value.F.R2.lvlOrs1,p.value.F.R2.lvlOrs2)
  df.lvl <- rbind(df.rs1,df.rs2)
  R2.lvlO <- cbind(r2.lvlOrs,r2.lOrF,df.lvl,r2.lOr.p)
  rownames(R2.lvlO) <- c("Random Sample 1","Random Sample 2")
  colnames(R2.lvlO) <- c("R2","F.statistic","df1","df2","pvalue")
  
  F.R2.patrs1 <- ((R2.f.rs1 - R2.lvl.rs1)*df.rs1[2])/((1-R2.f.rs1)*df.rs1[1])
  F.R2.patrs2 <- ((R2.f.rs2 - R2.lvl.rs2)*df.rs2[2])/((1-R2.f.rs2)*df.rs2[1])
  p.value.F.R2.patrs1 <- pf(F.R2.patrs1,df.rs1[1],df.rs1[2],lower.tail = FALSE)
  p.value.F.R2.patrs2 <- pf(F.R2.patrs2,df.rs2[1],df.rs2[2],lower.tail = FALSE)
  r2.prs <- rbind(R2.pat.rs1,R2.pat.rs2)
  r2.prF <- rbind(F.R2.patrs1,F.R2.patrs2)
  r2.pr.p <- rbind(p.value.F.R2.patrs1,p.value.F.R2.patrs2)
  r2.pattern <- cbind(r2.prs,r2.prF,df.pat,r2.pr.p)
  rownames(r2.pattern) <- c("Random Sample 1","Random Sample 2")
  colnames(r2.pattern) <- c("R2","F.statistic","df1","df2","pvalue")
  
  F.R2.lvl.rs1 <- ((R2.f.rs1 - R2.pat.rs1)*df.rs1[2])/((1-R2.f.rs1))
  F.R2.lvl.rs2 <- ((R2.f.rs2 - R2.pat.rs2)*df.rs2[2])/((1-R2.f.rs2))
  p.value.F.R2.lvl.rs1 <- pf(F.R2.lvl.rs1,df.rs1[1],df.rs1[2],lower.tail=FALSE)
  p.value.F.R2.lvl.rs2 <- pf(F.R2.lvl.rs2,df.rs2[1],df.rs2[2],lower.tail=FALSE)
  r2.lrs <- rbind(R2.lvl.rs1,R2.lvl.rs2)
  r2.lrF <- rbind(F.R2.lvl.rs1,F.R2.lvl.rs2)
  df.lvl <- rbind(df.rs1,df.rs2)
  r2.lr.p <- rbind(p.value.F.R2.lvl.rs1,p.value.F.R2.lvl.rs2)
  r2.level <- cbind(r2.lrs,r2.lrF,df.lvl,r2.lr.p)
  rownames(r2.level) <- c("Random Sample 1","Random Sample 2")
  colnames(r2.level) <- c("R2","F.statistic","df1","df2","pvalue")
  r2.full <- round(r2.full,digits=6)
  R2.patO <- round(R2.patO,digits=6)
  R2.lvlO <- round(R2.lvlO,digits=6)
  r2.pattern <- round(r2.pattern,digits=6)
  r2.level <- round(r2.level,digits=6)
  
  method="profilecv"
  
  output <- new(Class="profileR",
  							R2.full=r2.full,
  							R2.patO=R2.patO,
  							R2.lvlO=R2.lvlO,
  							R2.full.lvl=r2.pattern,
  							R2.full.pat=r2.level,
  							method=method)
  
  return(output)
}




