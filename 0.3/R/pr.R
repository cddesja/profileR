
#'@export

pr <- function(form1,form2) {
	
	n <- ncol(form1)
	k <- nrow(form1)
	
	#Average score for each person (level)
	f1 <- as.matrix(rowMeans(form1,na.rm = TRUE),ncol=1,nrow=k)
	f2 <- as.matrix(rowMeans(form2,na.rm = TRUE),ncol=1,nrow=k)
	
	pattern1 <- matrix(,ncol=n, nrow=k)
	pattern2 <- matrix(,ncol=n, nrow=k)
	
	#Creating pattern scores
	for (i in 1:n) {
		pattern1[,i] <- form1[,i]-f1
		pattern2[,i] <- form2[,i]-f2
	}
	
	#Overall profile reliability
	covar1 <- matrix(,ncol=n, nrow=1)
	
	for (i in 1:n) {
		covar1[,i]=cov(form1[,i],form2[,i])
	}
	num1=rowSums(covar1,na.rm = TRUE)
	
	variance.form1 <- sum(apply(form1,2,var),na.rm = TRUE)
	variance.form2 <- sum(apply(form2,2,var),na.rm = TRUE)
	
	denum1 <- sqrt(variance.form1*variance.form2)
	
	overall <- num1/denum1
	
	
	#Level reliability
	num2 <- n*(cov(f1,f2))
	denum2 <- sqrt((n*var(f1))*(n*var(f2)))
	level <- num2/denum2
	
	
	#Pattern reliability
	covar2 <- matrix(,ncol=n, nrow=1)
	
	for (i in 1:n) {
		covar2[,i]=cov(pattern1[,i],pattern2[,i])
	}
	num3=rowSums(covar2,na.rm = TRUE)
	
	var.form1 <- sum(apply(pattern1,2,var),na.rm = TRUE)
	var.form2 <- sum(apply(pattern2,2,var),na.rm = TRUE)
	
	denum3 <- sqrt(var.form1*var.form2)
	
	pattern <- num3/denum3
	
	result1 <- rbind(level,pattern,overall)
	rownames(result1) <- c("Level","Pattern","Overall")
	colnames(result1) <- c("Estimate")
	
	colnames(pattern1) <- c(paste("Form1_pattern",c(1:n),sep=""))
	colnames(pattern2) <- c(paste("Form2_pattern",c(1:n),sep=""))
	colnames(f1) <- c("Level1")	
	colnames(f2) <- c("Level2")	
	
	result2 <- cbind(pattern1,f1,pattern2,f2)
        
        call<- match.call()
        
	output <- list(call=call,reliability=result1,pattern.level=result2)
	class(output) <- "prof"
	output
}

