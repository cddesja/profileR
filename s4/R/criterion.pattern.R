criterion.pattern <- function(criterion,predictor, k=100){
    x <- predictor
    y <- criterion
    N <- nrow(x)
    v <- ncol(x)
    V <- 1/ncol(x)
    pat.comp <- x - apply(x,1,mean)
    Xp <- apply(x,1,mean)
    dv <- "y ~ 1"
    pred <- colnames(x)
    basic <- paste(pred,collapse="+",sep="")
    form <- as.formula(paste(dv,"+",basic,sep=""))
    regweg<- coef(lm(formula=form,data=as.data.frame(cbind(x,y))))
    b <- regweg[-1]
    bstar <- b - mean(b)
    xc <- k*bstar
    Covpc <- V*(as.matrix(pat.comp)%*%as.matrix(xc))
    ypred <- fitted(lm(y ~ 1 + Covpc + Xp))
    R2.f <- cor(ypred,y)^2
    R2.pat <- cor(y,as.vector(Covpc))^2 ## pattern effect
    R2.lvl <- cor(y,Xp)^2 ## level effect
    r2 <- rbind(R2.f,R2.pat,R2.lvl)
    colnames(r2) <- "R2"
    rownames(r2) <- c("Full Model","Pattern","Level")
    r2 <- round(r2,digits=6)
    
    full.df <- c(v,N-v-1)
    F.R2.full <- (R2.f*full.df[2])/((1-R2.f)*full.df[1])
    p.value.F.R2.full <- pf(F.R2.full,full.df[1],full.df[2],lower.tail=FALSE)
    
    pat.df <- c(v-1,N-v-1)
    F.R2.pat <- ((R2.f - R2.lvl)*pat.df[2])/((1-R2.f)*pat.df[1])
    p.value.F.R2.pat <- pf(F.R2.pat,pat.df[1],pat.df[2],lower.tail = FALSE)
    
    lvl.df<-c(1,N-v-1)
    F.R2.lvl <- ((R2.f - R2.pat)*lvl.df[2])/((1-R2.f))
    p.value.F.R2.lvl <- pf(F.R2.lvl,lvl.df[1],lvl.df[2],lower.tail=FALSE)
    
    F.R2.pat.only <- ((R2.pat)*pat.df[2])/((1-R2.pat)*pat.df[1])
    p.value.F.R2.pat.only <- pf(F.R2.pat.only,pat.df[1],pat.df[2],lower.tail = FALSE)
    
    F.R2.lvl.only <- ((R2.lvl)*lvl.df[2])/((1-R2.lvl)*lvl.df[1])
    p.value.F.R2.lvl.only <- pf(F.R2.lvl.only,lvl.df[1],lvl.df[2],lower.tail = FALSE)
    
    fvalue <- c(F.R2.full,F.R2.pat.only,F.R2.lvl.only,F.R2.pat,F.R2.lvl)
    df <- rbind(full.df,pat.df,lvl.df,pat.df,lvl.df)
    pvalue <- rbind(p.value.F.R2.full,p.value.F.R2.pat.only,p.value.F.R2.lvl.only,p.value.F.R2.pat,p.value.F.R2.lvl)
    ftable <- cbind(df,fvalue,pvalue)	
	
    rownames(ftable) <- c("R2.full = 0 ","R2.pat = 0","R2.lvl = 0","R2.full = R2.lvl","R2.full = R2.pat")
    colnames(ftable) <- c("df1", "df2", "F value", "Pr(>F)")
    
    call <- match.call()
    
    method="criterion.pattern"
     
    output <- new("profileR",
			call=call,
			lvl.comp=Xp,
			pat.comp=pat.comp,
			b=regweg,
			bstar=bstar, 
			xc=xc, 
			k=k, 
			Covpc=Covpc,
			Ypred=ypred,
			reliability=r2,
			ftable=ftable, 
			method = method)
    
    return(output)
  }



x <- profile.reliability(EEGS[,c(1,3,5)],EEGS[,c(2,4,6)])

print(x)

IPMMc <- matrix(c(75, 60, 50, 50, 1,
60, 75, 45, 55, 1,
60, 60, 55, 45, 1,
50, 50, 75, 60, 0,
45, 55, 60, 75, 0,
55, 45, 60, 60, 0), byrow=T, ncol=5)

IPMMc <- as.data.frame(IPMMc)
colnames(IPMMc) <- c("A", "H", "S", "B", "R")

test <- criterion.pattern(predictor = IPMMc[,1:4], criterion = IPMMc[,5])

x = IPMMc[,1:4]
y = IPMMc[,5]
# 
#
#
#
