#' Moderated Profile Analysis
#'
#' Implements the moderated profile analysis approach developed by Davison & Davenport (unpublished)
#'
#' The function returns the criterion-related moderated profile analysis described in Davison & Davenport (unpublished). Missing data are presently handled by specifying \code{na.action = "na.omit"}, which performs listwise deletion and \code{na.action = "na.fail"}, the default, which causes the function to fail. The following S3 generic functions are available: \code{summary()},\code{anova()}, \code{print()}, and \code{plot()}. These functions provide a summary of the analysis (namely, R2 and the level and pattern components); perform ANOVA of the R2 for the pattern, the level, and the overall model; provide output similar to \code{lm()}, and plots the pattern effect.
#' @export
#' @param formula An object of class \code{\link{formula}} of the form \code{response ~ terms}.
#' @param data An optional data frame, list or environment containing the variables in the model.
#' @param moderator Name of the moderator variable.
#' @param k Corresponds to the scalar constant and must be greater than 0. Defaults to 100.
#' @param stage2 Should stage 2 be executed regardless of stage 1 outcome? defaults to FALSE.
#' @return An object of class \code{critpat} is returned, listing the following components:
#' \itemize{
#'  \item \code{lvl.comp} - the level component
#'  \item \code{pat.comp} - the pattern component
#'  \item \code{b} - the unstandardized regression weights
#'  \item \code{bstar} - the mean centered regression weights
#'  \item \code{xc} - the scalar constant times bstar
#'  \item \code{k} - the scale constant
#'  \item \code{Covpc} - the pattern effect
#'  \item \code{Ypred} - the predicted values
#'  \item \code{r2} - the proportion of variability attributed to the different components
#'  \item \code{F.table} - the associated F-statistic table
#'  \item \code{F.statistic} - the F-statistics
#'  \item \code{df} - the df used in the test
#'  \item \code{pvalue} - the p-values for the test}
#'
#' @examples
#' \dontrun{
#' data(mod_data)
#' mod <- mpa(dv ~ pred1 * mod + pred2 * mod, data = mod_data)
#' print(mod)
#' summary(mod)
#' plot(mod)
#' anova(mod)
#' }
#'
#' @references Davison, M., & Davenport, E. (unpublished). Comparing Criterion-Related Patterns of Predictor Variables across Populations Using Moderated Regression.
#' @seealso \code{\link{cpa}}
#' @keywords method

mpa <- function(formula, data, moderator, k=100, na.action = "na.fail", stage2 = FALSE){
  cat("# -------- Executing Stage 1 --------  #\n\n")
  stage1_mod <- lm(formula=formula,data=data,na.action = na.action)
  print(stage1_tab <- anova(stage1_mod))
  if(stage1_tab[nrow(stage1_tab) - 1, ncol(stage1_tab)] < .05 | stage2 == TRUE){
    cat("\n# ------- Executing Stage 2 --------  #\n\n")
    
    # Drop response and moderator variables
    loc <- which(names(stage1_mod$model) == moderator)
    resp <- stage1_mod$model[,1]
    
    # Identify number of predictors
    pred_num <- length(names(stage1_mod$model)[-c(1, loc)])
    x <- stage1_mod$model[,-c(1, loc)]
    z <- stage1_mod$model[,loc]
    z <- ifelse(z == levels(z)[1], 1, 0)
    
    # Find level effect
    Xp <- apply(x, 1, mean)
    
    # Pattern component by groups
    dat <- stage1_mod$model
    mod_data <- dat[,loc]
    reg_names <- levels(data[, moderator])
    ref <- which(mod_data == reg_names[1])
    foc <- which(mod_data == reg_names[2])
    x.ref <- dat[ref,-c(1, loc)]
    x.foc <- dat[foc,-c(1, loc)]
    pat.comp.ref <- matrix(ncol = pred_num, rep(0,length(z)*pred_num))
    pat.comp.foc <- matrix(ncol = pred_num, rep(0,length(z)*pred_num))
    pat.comp.ref.t <- x.ref - apply(x.ref,1,mean)
    pat.comp.ref[which(mod_data == reg_names[1]),] <- pat.comp.ref.t
    
    pat.comp.foc.t <- x.foc - apply(x.foc,1,mean)
    
    # Set up the regression weight contrast
    
    bref <- coef(stage1_mod)[-(grep(levels(data$mod)[2], names(coef(stage1_mod))))]
    bref <- bref[-1]
    brefsum <- sum(bref) 
    refstar <- (bref - mean(bref)) * k
    bfoc <- coef(stage1_mod)[-1]
    
    variable_names <- variable.names(stage1_mod$model)[-1]
    variable_names <- variable_names[-(grep(moderator, variable_names))]
    vlen <- length(variable_names)
    bfoc_tmp <- list()
    for(i in 1:vlen){
    bfoc_tmp[[i]] <- sum(coef(stage1_mod)[grep(variable_names[i], names(coef(stage1_mod)))])
    }
    bfoc_tmp <- unlist(bfoc_tmp)
    focstar <- (bfoc_tmp - mean(bfoc_tmp)) * k
    bfocsum <- sum(bfoc_tmp)
    
    V <- length(bref)
    Covpc.ref <- V*(as.matrix(pat.comp.ref)%*%as.matrix(refstar))
    Covpc.foc <- V*(as.matrix(pat.comp.foc)%*%as.matrix(focstar))
    
    model_data <- data.frame(resp, first = brefsum*Xp, sec = (bfocsum - brefsum)*z*Xp, thr = V*Covpc.ref, four =  (Covpc.foc - Covpc.ref)*V*z, z = z)
    
    lm_full <- lm(V*as.numeric(z)*(Covpc.foc - Covpc.ref) + as.numeric(z))
  } else {
    cat("Interaction not significant. Not executing stage 2\n")
    break
  }
  
  #     ypred <- fitted(lm(y ~ 1 + Covpc + Xp, na.action = na.action))
  #     R2.f <- cor(ypred,y)^2
  #     R2.pat <- cor(y,as.vector(Covpc))^2 ## pattern effect
  #     R2.lvl <- cor(y,Xp)^2 ## level effect
  #     r2 <- rbind(R2.f,R2.pat,R2.lvl)
  #     colnames(r2) <- "R2"
  #     rownames(r2) <- c("Full Model","Pattern","Level")
  #     r2 <- round(r2,digits=6)
  # 
  #     full.df <- c(v,N-v-1)
  #     F.R2.full <- (R2.f*full.df[2])/((1-R2.f)*full.df[1])
  #     p.value.F.R2.full <- pf(F.R2.full,full.df[1],full.df[2],lower.tail=FALSE)
  # 
  #     pat.df <- c(v-1,N-v-1)
  #     F.R2.pat <- ((R2.f - R2.lvl)*pat.df[2])/((1-R2.f)*pat.df[1])
  #     p.value.F.R2.pat <- pf(F.R2.pat,pat.df[1],pat.df[2],lower.tail = FALSE)
  # 
  #     lvl.df<-c(1,N-v-1)
  #     F.R2.lvl <- ((R2.f - R2.pat)*lvl.df[2])/((1-R2.f))
  #     p.value.F.R2.lvl <- pf(F.R2.lvl,lvl.df[1],lvl.df[2],lower.tail=FALSE)
  # 
  #     F.R2.pat.only <- ((R2.pat)*pat.df[2])/((1-R2.pat)*pat.df[1])
  #     p.value.F.R2.pat.only <- pf(F.R2.pat.only,pat.df[1],pat.df[2],lower.tail = FALSE)
  # 
  #     F.R2.lvl.only <- ((R2.lvl)*lvl.df[2])/((1-R2.lvl)*lvl.df[1])
  #     p.value.F.R2.lvl.only <- pf(F.R2.lvl.only,lvl.df[1],lvl.df[2],lower.tail = FALSE)
  # 
  #     fvalue <- c(F.R2.full,F.R2.pat.only,F.R2.lvl.only,F.R2.pat,F.R2.lvl)
  #     df <- rbind(full.df,pat.df,lvl.df,pat.df,lvl.df)
  #     pvalue <- rbind(p.value.F.R2.full,p.value.F.R2.pat.only,p.value.F.R2.lvl.only,p.value.F.R2.pat,p.value.F.R2.lvl)
  #     ftable <- cbind(df,fvalue,pvalue)
  # 
  #     rownames(ftable) <- c("R2.full = 0 ","R2.pat = 0","R2.lvl = 0","R2.full = R2.lvl","R2.full = R2.pat")
  #     colnames(ftable) <- c("df1", "df2", "F value", "Pr(>F)")
  # 
  #     call<- match.call()
  #     output <- list(call=call,lvl.comp=Xp,pat.comp=pat.comp,b=regweg,bstar=bstar, xc=xc, k=k, Covpc=Covpc, Ypred=ypred,r2=r2,ftable=ftable)
  # 
  #     class(output) <- "critpat"
  #     return(output)
  #   }
}