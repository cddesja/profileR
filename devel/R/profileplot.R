#' @name profileplot
#' @aliases profileplot  
#' @title Score Profile Plot 
#' @description The \code{profile.plot} function creates a profile plot for a matrix or dataframe 
#' with multiple scores or subscores using \code{\link[ggplot2]{ggplot2}} function in  \code{ggplot2} package.
#' 
#' @usage profileplot(form,person.id,interval=10)
#' 
#' @param form A matrix or dataframe including two or more subscores.
#' @param person.id A vector that includes ID values for individuals (Optional).
#' @param interval The number of equal intervals from the mimimum score to the meximum score. Default is 10.
#' @param by.pattern Create profile plot using pattern and leves with ggplot2. If not TRUE, then a profile plot of 
#' scores by persons are created using the base graphics in R. Default is TRUE. 
#' @param original.names Use original column names in the dataset. If FALSE, then columns are renamed as v1, v2, ...,vn 
#' where n is the number of columns. Default is TRUE. 
#' 		
#' @return An object of score \code{profile.plot}.
#' 
#' @seealso \link[ggplot2]{ggplot2},\link{PS}
#' 
#' @author Okan Bulut \email{okanbulut84@@gmail.com}
#' 
#' @examples 
#'\dontrun{
#'data(PS)
#'myplot <- profile.plot(PS[,2:4],person.id=PS$Person)
#'myplot
#'
#'data(leisure)
#'leisure1 <- ddply(leisure,~Group,summarise,Read.Dance=mean(Read.Dance),Dance.TV=mean(Dance.TV),TV.Ski=mean(TV.Ski))
#'leis.plot <- profile.plot(leisure1[,2:4],person.id=leisure1$Group,interval=10)
#'leis.plot
#'}
#'@export



profileplot <- function(form,person.id,interval=10,by.pattern=TRUE,original.names=TRUE) {
	
	if(by.pattern) {
	
	subscore.id <- subscore <- NULL
	n <- ncol(form)
	k <- nrow(form)
	
	if(original.names){labels <- colnames(form)}
	else {labels <- c(paste("v",1:n,sep=""))}
	
	#Level scores
	level <- as.matrix(rowMeans(form,na.rm = TRUE),ncol=1,nrow=k)
	
	#Pattern scores
	pattern <- matrix(,ncol=n, nrow=k)
	for (i in 1:n) {
		pattern[,i] <- form[,i]-level
	}
	
	if (missing(person.id)) {
		id=c(1:k)
		form1 <- cbind(id,form)
		level1 <- cbind(id,level)
		pattern1 <- cbind(id,pattern)
		
		colnames(form1) <- c("id",paste("s",c(1:n),sep=""))
		colnames(level1) <- c("id","level")
		colnames(pattern1) <- c("id",paste("p",c(1:n),sep=""))
		
		form1 <- as.data.frame(form1)
		pattern1 <- as.data.frame(pattern1)
		level1 <- as.data.frame(level1)
		
		form2 <- melt(form1, id="id")
		pattern2 <- melt(pattern1, id="id")
		colnames(form2) <- c("id","subscore.id","subscore")
		colnames(pattern2) <- c("id","pattern.id","pattern")
		
		form.long <- merge(form2, pattern2, by="id", all=TRUE)
		form.long <- merge(form.long, level1, by="id", all=TRUE)
		form.long$id <- as.factor(form.long$id)
		
	} 
	else {
		id=as.data.frame(person.id)
		form1 <- cbind(id,form)
		level1 <- cbind(id,level)
		pattern1 <- cbind(id,pattern)
		
		colnames(form1) <- c("id",paste("s",c(1:n),sep=""))
		colnames(level1) <- c("id","level")
		colnames(pattern1) <- c("id",paste("p",c(1:n),sep=""))
		
		form1 <- as.data.frame(form1)
		pattern1 <- as.data.frame(pattern1)
		level1 <- as.data.frame(level1)
		
		form2 <- melt(form1, id="id")
		pattern2 <- melt(pattern1, id="id")
		colnames(form2) <- c("id","subscore.id","subscore")
		colnames(pattern2) <- c("id","pattern.id","pattern")
		
		form.long <- merge(form2, pattern2, by="id", all=TRUE)
		form.long <- merge(form.long, level1, by="id", all=TRUE)
		form.long$id <- as.factor(form.long$id)
	}
	
	
	max.s <- max(form.long$subscore, na.rm = TRUE)
	min.s <- min(form.long$subscore, na.rm = TRUE)
	int <- (max.s-min.s)/interval
	
	plot1 <- ggplot(form.long, aes(x=subscore.id, y=subscore, group=id, color=id)) + geom_line() + geom_point(size=3, fill="white") + scale_colour_hue(name="Person",l=30) +
		theme(panel.background = element_rect(fill='white', colour='black'),panel.grid.minor=element_blank(), 
					panel.grid.major=element_blank()) + scale_x_discrete(name=" ", labels=labels)+
		scale_y_continuous(name="Scores", limits=c(min.s,max.s),breaks=seq(min.s, max.s, int)) + scale_shape_discrete(name="Person")}
	
	else {
	
  
  	require(RColorBrewer)
  	#Prepare data for plotting
  	form <- as.data.frame(form)
  	numvariables <- ncol(form)
  	colours <- brewer.pal(numvariables,"Set1")
  	mymin <- 1e+20
  	mymax <- 1e-20
  
  	for (i in 1:numvariables){
    		Scores <- form[,i]
		mini <- min(Scores)
    		maxi <- max(Scores)
    		if (mini < mymin) { mymin <- mini }
    		if (maxi > mymax) { mymax <- maxi }
  	}
  
  	if(original.names) {names <- colnames(form)}
  	else {names <- c(paste("v",1:numvariables,sep=""))}
  
  
  	#Plot the variables
  	for (i in 1:numvariables) {
		Scoresi <- form[,i]
    		namei <- names[i]
    		colouri <- colours[i]
    		if (i == 1) { plot1 <- plot(Scoresi,col=colouri,type="l",ylim=c(mymin,mymax),ylab="Score",xlab="Person") }
    		else         {points(Scoresi, col=colouri,type="l")                                     }
    		lastxval <- length(Scoresi)
    		lastyval <- Scoresi[length(Scoresi)]
    		text((lastxval-10),(lastyval),namei,col="black",cex=0.6)}
	}
    return(plot1)
}

