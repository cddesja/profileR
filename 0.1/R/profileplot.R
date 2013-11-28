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



profileplot <- function(form,person.id,interval=10) {
	subscore.id <- subscore <- NULL
	n <- ncol(form)
	k <- nrow(form)
	labels <- colnames(form)
	
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
		scale_y_continuous(name="Scores", limits=c(min.s,max.s),breaks=seq(min.s, max.s, int)) + scale_shape_discrete(name="Person")
	
	return(plot1)
	
}

