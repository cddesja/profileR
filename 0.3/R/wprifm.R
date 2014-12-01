wprifm <- function(data, scale = FALSE, save.model = FALSE){
	if(scale){
		data <- scale(data)
	} 
	
    # Define random Intercept Factor
	f1x <- paste("1", paste("x", 1:ncol(data), sep=""), sep="*")
    f1 <- paste("f1 =~ ", paste(f1x[1:length(f1x)-1],"+ ", collapse=""), f1x[length(f1x)], sep = "") 

    # Define factor of interest
    f2params <- paste("lam",1:ncol(data),sep="")
    f2x <- paste(f2params, paste("x", 1:ncol(data), sep=""), sep="*")
 	f2 <- paste("f2 =~ ", paste(f2x[1:length(f2x)-1],"+ ", collapse=""), f2x[length(f2x)], sep = "")

 	# Constraints
 	constraints <- "f1 ~~ f2\nf2 ~~ 1*f2"
 	cx <- paste("0 == ", paste(f2params[1:length(f2params)-1], " + ",sep = "", collapse = ""), f2params[length(f2params)], sep = "")

 	# Write to a temporary file
 	write(c(f1,f2,constraints,cx), file = "tmp.out")
 	model <- readLines("tmp.out")

 	# Remove file unless asked not to
 	if(save.model == FALSE){
 		system("rm tmp.out")
 	}
 	fit <- sem(model, data = data)
 	return(fit)
}


