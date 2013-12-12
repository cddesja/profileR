profile.by.group <- function(x, y, original.names=FALSE, profile.plot=FALSE, ...) {
	
	x <- as.data.frame(x)
	y <- as.data.frame(y)
	n=nrow(x)
	m=nrow(y)
	k=ncol(x)
	
	if(!(n == m)){ stop("Number of rows are not equal in x and y.")}
	
	else {
  	
	z <- as.data.frame(cbind(x,y))
	cor.table=by(z[,1:k],z[,(1+k)],cor)
	
	if(original.names) {colnames(z) <- c(labs <- colnames(x),"group")}
		else {colnames(z) <- c(labs <- paste("v",1:k,sep=""),"group")}
	z$group <- as.factor(z$group)
	
	average <- matrix(NA,k,2) #average scores
	colnames(average) <- levels(z[,(k+1)])
	rownames(average) <- labs
	
	
	for(groups in colnames(average)) # for each column of grouping variable
		average[,groups] <- colMeans(z[z$group==groups,1:k],na.rm = TRUE)
	rm(groups)
	
	#The following part creates a profile plot of observed variables across two groups
	if(profile.plot) {
	par(mar=c(4.1,4.1,0.5,0.5))
	p.plot <- matplot(1:k, average, type="b", pch=21:22, col=c("red","green3"),
					  xaxt="n", ylab="Mean Score", xlab="Observed Variables",cex=1.5)
	axis(1,at=1:k,lab=labs)
	legend(x="topleft", legend=colnames(average), lty=1:2, pch=21:22,col=c("red","green3")) }
	
	#Profile analysis 
	Cont <- diag(x = -1, k, k)
	for(i in 1:(k-1)) {Cont[i,(i+1)]=1}
	Cont <- Cont[1:(k-1),] #contrast matrix
	
	a <- levels(z$group)[1]
	b <- levels(z$group)[2]
	
	S1 <- var(z[z$group==a,1:k])
	S2 <- var(z[z$group==b,1:k])
	
	c1 <- nrow(z[z$group==a,])
	c2 <- nrow(z[z$group==b,])
	
	if(c1==c2) {
	Spooled <- (S1 + S2) / 2 
	}

	else {Spooled <- (((c1-1)*S1) + ((c2-1)*S2)) / (c1+c2-2)}
	
	S <- (1/c1+1/c2)*Spooled
	y <- Cont %*% (average[,a]-average[,b]) 
	
	#Parallel profile test
	F1 <- t(y) %*% solve(Cont %*% S %*% t(Cont)) %*% y 
	pf1 <- pf(F1*(c1+c2-k)/(c1+c2-2)/(k-1), k-1, (c1+c2-k), lower=F) #P-value
	df1=k-1
	df2=(c1+c2-k)
	parallel <- data.frame(F1,df1,df2,pf1)
	names(parallel) <- c("F","df1","df2","p-value")
	
	#Coincidential profile test
	F2 <- sum(average[,1] - average[,2])^2 / sum(S) 
	pf2 <- pf(F2, 1, (c1+c2-2), lower=F) # P-value
	df1 <- 1
	df2 <- (c1+c2-2)
	coincidential <- data.frame(F2,df1,df2,pf2)
	names(coincidential) <- c("F","df1","df2","p-value")
	
	#Level profile test
	allS <- var(z[,1:k]) #overall variance
	xbar <- apply(z[,1:k],2,mean) #grand mean
	y <- Cont %*% xbar
	F3 <- (c1+c2)*sum(y*(solve(Cont%*%allS%*%t(Cont)) %*% y))

	pf3 <- pf(F3*(c1+c2-k+1)/(c1+c2-1)/(k-1), (k-1), (c1+c2-k+1), lower=F) #P-value
	
	df1 <- (k-1)
	df2 <- (c1+c2-k+1)
	level <- data.frame(F3,df1,df2,pf3)
	names(level) <- c("F","df1","df2","p-value")
  	result <- rbind(parallel,coincidential,level)
  	rownames(result) <- c("Ho: Profiles are parallel","Ho: Profiles are coincidental","Ho: Profiles are level")
	
	call<- match.call()
	output <- list(call=call, data.summary=average, corr.table=cor.table, profile.test=result)
	class(output) <- "profg"
	return(output)
		}
	}










