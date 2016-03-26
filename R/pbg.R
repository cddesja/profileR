#' Profile by group: Testing Parallel, Coincidental, and Level Profiles
#'
#' The \code{pbg} function implements three hypothesis tests. These tests are whether the profiles are parallel, coincidental, and level across two groups defined by the grouping variable. If parallelism is rejected, the other two tests are meaningless. In that case, flatness may be assessed within each group, and various within- and between-group contrasts may be analyzed. 
#'
#' @importFrom graphics par matplot axis legend
#' @importFrom stats pf var
#' @param data A matrix or data frame with multiple scores; rows represent individuals, columns represent subscores. Missing subscores have to be inserted as NA.
#' @param group A vector or data frame that indicates a grouping variable. It can be either numeric or character (e.g., male-female, high-low, 0-1). The grouping variable must have the same length of x. Missing values are not allowed in y.
#' @param original.names Use original column names in x. If FALSE, variables are renamed using v1, v2, ..., vn for subscores and "group" for the grouping variable. Default is FALSE.
#' @param profile.plot Print a profile plot of scores for two groups. Default is FALSE.
#' @param ... Additional arguments to be passed.
#'
#' @return An object of class \code{profg} is returned, listing the following components:
#' \itemize{
#' \item \code{data.summary} - Means of observed variables by the grouping variable	
#' \item \code{corr.table} - A matrix of correlations among observed variables splitted by the grouping variable
#' \item \code{profile.test} - Results of F-tests for testing parallel, coincidential, and level profiles across two groups.
#' }
#' @examples
#' \dontrun{
#'#Read spouse data from Professor Richard Jonhson's website 
#'spouse <- read.table(file="http://www.stat.wisc.edu/~rich/JWMULT02dat/T6-14.DAT")
#'mod <- pbg(spouse[,1:4],spouse[,5],labels=FALSE,profile.plot=TRUE)
#'print(mod) #prints average scores in the profile across two groups
#'summary(mod) #prints the results of hypothesis tests
#' }
#' @seealso \code{\link{pr}}, \code{\link{profileplot}}
#'@export

pbg <- function(data, group, original.names=FALSE, profile.plot=FALSE, ...) {
	
	x <- as.data.frame(data)
	y <- as.data.frame(group)
	n=nrow(x)
	m=nrow(y)
	k=ncol(x)
	
	if(!(n == m)){ stop("Number of rows are not equal in data and group.")}
	
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
	axis(1,at=1:k,labels=labs)
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
	pf1 <- pf(F1*(c1+c2-k)/(c1+c2-2)/(k-1), k-1, (c1+c2-k), lower.tail=F) #P-value
	df1=k-1
	df2=(c1+c2-k)
	parallel <- data.frame(F1,df1,df2,pf1)
	names(parallel) <- c("F","df1","df2","p-value")
	
	#Equal levels
	F2 <- sum(average[,1] - average[,2])^2 / sum(S) 
	pf2 <- pf(F2, 1, (c1+c2-2), lower.tail=F) # P-value
	df1 <- 1
	df2 <- (c1+c2-2)
	level <- data.frame(F2,df1,df2,pf2)
	names(level) <- c("F","df1","df2","p-value")
	
	#Flatness
	allS <- var(z[,1:k]) #overall variance
	xbar <- apply(z[,1:k],2,mean) #grand mean
	y <- Cont %*% xbar
	F3 <- (c1+c2)*sum(y*(solve(Cont%*%allS%*%t(Cont)) %*% y))

	pf3 <- pf(F3*(c1+c2-k+1)/(c1+c2-1)/(k-1), (k-1), (c1+c2-k+1), lower.tail=F) #P-value
	
	df1 <- (k-1)
	df2 <- (c1+c2-k+1)
	flatness <- data.frame(F3,df1,df2,pf3)
	names(flatness) <- c("F","df1","df2","p-value")
  	result <- rbind(parallel,level,flatness)
  	rownames(result) <- c("Ho: Profiles are parallel","Ho: Profiles have equal levels","Ho: Profiles are flat")
	
	call<- match.call()
	output <- list(call=call, data.summary=average, corr.table=cor.table, profile.test=result)
	class(output) <- "profg"
	return(output)
		}
	}










