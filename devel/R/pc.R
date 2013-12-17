pc <- function(criterion,predictor,seed=NULL, na.action = NULL){
  
  if(is.numeric(seed) == T)
    set.seed(seed)
  

  if(na.action == "na.omit"){
    dat.tmp <- cbind(criterion,predictor)
    dat.tmp <- na.omit(dat.tmp)
    criterion <- dat.tmp[,1]
    predictor <- dat.tmp[,-1]
  }
  
  if(na.action == "na.fail"){
    stop("Missing data are present. This function will terminate.")
  }

  if(any(is.na(criterion == T))) 
    stop("Missing data mechanism not yet implement. Please specify via na.action")
  if(any(is.na(predictor == T))) 
    stop("Missing data mechanism not yet implement. Please specify via na.action")
  
  
  x <- predictor
  y <- criterion
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
  r2.full <- cbind(r2.frs,df.full, r2.frF,r2.fr.p)
  rownames(r2.full) <- c("Random Sample 1","Random Sample 2")
  colnames(r2.full) <- c("R2","df1","df2","F value","Pr(>F)")
  
  F.R2.patOrs1 <- (R2.pat.rs1*df.rs1[2])/((1-R2.pat.rs1)*df.rs1[1])
  F.R2.patOrs2 <- (R2.pat.rs2*df.rs2[2])/((1-R2.pat.rs2)*df.rs2[1])
  p.value.F.R2.patOrs1 <- pf(F.R2.patOrs1,df.rs1[1],df.rs1[2],lower.tail = FALSE)
  p.value.F.R2.patOrs2 <- pf(F.R2.patOrs2,df.rs2[1],df.rs2[2],lower.tail = FALSE)
  r2.patOrs <- rbind(R2.pat.rs1,R2.pat.rs2)
  r2.pOrF <- rbind(F.R2.patOrs1,F.R2.patOrs2)
  r2.pOr.p <- rbind(p.value.F.R2.patOrs1,p.value.F.R2.patOrs2)
  df.pat <- rbind(df.rs1,df.rs2)
  R2.patO <- cbind(r2.patOrs,df.pat,r2.pOrF,r2.pOr.p)
  rownames(R2.patO) <- c("Random Sample 1","Random Sample 2")
  colnames(R2.patO) <- c("R2","df1","df2","F value","Pr(>F)")
  
  F.R2.lvlOrs1 <- (R2.lvl.rs1*df.rs1[2])/((1-R2.lvl.rs1)*df.rs1[1])
  F.R2.lvlOrs2 <- (R2.lvl.rs2*df.rs2[2])/((1-R2.lvl.rs2)*df.rs2[1])
  p.value.F.R2.lvlOrs1 <- pf(F.R2.lvlOrs1,df.rs1[1],df.rs1[2],lower.tail = FALSE)
  p.value.F.R2.lvlOrs2 <- pf(F.R2.lvlOrs2,df.rs2[1],df.rs2[2],lower.tail = FALSE)
  r2.lvlOrs <- rbind(R2.lvl.rs1,R2.lvl.rs2)
  r2.lOrF <- rbind(F.R2.lvlOrs1,F.R2.lvlOrs2)
  r2.lOr.p <- rbind(p.value.F.R2.lvlOrs1,p.value.F.R2.lvlOrs2)
  df.lvl <- rbind(df.rs1,df.rs2)
  R2.lvlO <- cbind(r2.lvlOrs,df.lvl, r2.lOrF,r2.lOr.p)
  rownames(R2.lvlO) <- c("Random Sample 1","Random Sample 2")
  colnames(R2.lvlO) <- c("R2","df1","df2", "F value","Pr(>F)")
  
  F.R2.patrs1 <- ((R2.f.rs1 - R2.lvl.rs1)*df.rs1[2])/((1-R2.f.rs1)*df.rs1[1])
  F.R2.patrs2 <- ((R2.f.rs2 - R2.lvl.rs2)*df.rs2[2])/((1-R2.f.rs2)*df.rs2[1])
  p.value.F.R2.patrs1 <- pf(F.R2.patrs1,df.rs1[1],df.rs1[2],lower.tail = FALSE)
  p.value.F.R2.patrs2 <- pf(F.R2.patrs2,df.rs2[1],df.rs2[2],lower.tail = FALSE)
  r2.prs <- rbind(R2.pat.rs1,R2.pat.rs2)
  r2.prF <- rbind(F.R2.patrs1,F.R2.patrs2)
  r2.pr.p <- rbind(p.value.F.R2.patrs1,p.value.F.R2.patrs2)
  r2.pattern <- cbind(r2.prs,r2.prF,df.pat,r2.pr.p)
  rownames(r2.pattern) <- c("Random Sample 1","Random Sample 2")
  colnames(r2.pattern) <- c("R2","F value","df1","df2","Pr(>F)")
  
  F.R2.lvl.rs1 <- ((R2.f.rs1 - R2.pat.rs1)*df.rs1[2])/((1-R2.f.rs1))
  F.R2.lvl.rs2 <- ((R2.f.rs2 - R2.pat.rs2)*df.rs2[2])/((1-R2.f.rs2))
  p.value.F.R2.lvl.rs1 <- pf(F.R2.lvl.rs1,df.rs1[1],df.rs1[2],lower.tail=FALSE)
  p.value.F.R2.lvl.rs2 <- pf(F.R2.lvl.rs2,df.rs2[1],df.rs2[2],lower.tail=FALSE)
  r2.lrs <- rbind(R2.lvl.rs1,R2.lvl.rs2)
  r2.lrF <- rbind(F.R2.lvl.rs1,F.R2.lvl.rs2)
  df.lvl <- rbind(df.rs1,df.rs2)
  r2.lr.p <- rbind(p.value.F.R2.lvl.rs1,p.value.F.R2.lvl.rs2)
  r2.level <- cbind(r2.lrs,df.lvl,r2.lrF,r2.lr.p)
  rownames(r2.level) <- c("Random Sample 1","Random Sample 2")
  colnames(r2.level) <- c("R2","df1","df2","F value","Pr(>F)")
  r2.full <- round(r2.full,digits=6)
  R2.patO <- round(R2.patO,digits=6)
  R2.lvlO <- round(R2.lvlO,digits=6)
  r2.pattern <- round(r2.pattern,digits=6)
  r2.level <- round(r2.level,digits=6)
  b = list(X1.b,X2.b)
  names(b) = c("Random Sample 1", "Random Sample 2")
  call<- match.call()
  ftable <- list(r2.full, R2.patO,R2.lvlO,r2.pattern,r2.level)
  r2 <- list(r2.full[,1],R2.patO[,1],R2.lvlO[,1],r2.pattern[,1],r2.level[,1])
  names(ftable) <- c("R2.full = 0", "R2.pat = 0", "R2.lvl = 0", "R2.full = R2.lvl", "R2.full = R2.pat")
  names(r2) <- names(ftable)
  
  output = list(call=call,b = b, ftable = ftable,r2 = r2)
  class(output) <- "critpat"
  return(output)
}




