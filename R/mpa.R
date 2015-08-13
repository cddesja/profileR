#' Moderated Profile Analysis
#'
#' Implements the moderated profile analysis approach described in Stanke et al. (XXXX).
#'
#' The function returns the criterion-related profile analysis described in Davison & Davenport (2002). Missing data are presently handled by specifying \code{na.action = "na.omit"}, which performs listwise deletion and \code{na.action = "na.fail"}, the default, which causes the function to fail. The following S3 generic functions are available: \code{summary()},\code{anova()}, \code{print()}, and \code{plot()}. These functions provide a summary of the analysis (namely, R2 and the level and pattern components); perform ANOVA of the R2 for the pattern, the level, and the overall model; provide output similar to \code{lm()}, and plots the pattern effect.
#' @export
#' @param formula An object of class \code{\link{formula}} of the form \code{response ~ terms}.
#' @param data An optional data frame, list or environment containing the variables in the model.
#' @param k Corresponds to the scalar constant and must be greater than 0. Defaults to 100.
#' @param na.action How should missing data be handled? Function defaults to failing if missing data are present.
#' @param family A description of the error distribution and link function to be used in the model. See \code{\link{family}}.
#' @param weights An option vector of weights to be used in the fitting process.
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
#' mod <- mpa(dv ~ pred1 + pred2 + pred3, data = mod_data, moderator = group)
#' print(mod)
#' summary(mod)
#' plot(mod)
#' anova(mod)
#' }
#'
#' @references Davison, M., & Davenport, E. (2002). Identifying criterion-related patterns of predictor scores using multiple regression. \emph{Psychological Methods, 7}(4), 468-484.
#' @seealso \code{\link{pcv}}
#' @keywords method

mpa <- function(formula, data, moderator, k=100, na.action = "na.fail", family = "gaussian"){
  regweg <- plyr::dlply(data, .(data[,moderator]), glm, formula = formula, family = family, na.action = na.action)
  b <- plyr::ldply(regweg, coef)
  bsum <- rowSums(b[,-c(1,2)])
  bstar <- b[,-c(1:2)] - apply(b[,-c(1:2)], 1, mean)
  xc <- t(k*bstar)
  y <- ldply(regweg, model.frame)
  y <- y[,-2]
  N <- plyr::ddply(data, .(data[, moderator]), nrow)
  v <- ncol(y[,-1])
  V <- 1/v
  pat.comp <- y[,-1] - apply(y[,-1], 1, mean)
  pat.comp <- data.frame(moderator = y[,1], pat.comp)

  tmp <- split(pat.comp, pat.comp$moderator)
  Covpc <- list()
  for(i in 1: length(tmp)){
    Covpc[[i]] <- V*(as.matrix(tmp[[i]][,-1])%*%xc[,i])
  }
  Covpc = unlist(Covpc)
  Xp <- apply(y[,-1], 1, mean)
  betas <- rep(bsum[,2], N$V1)
  betas <- data.frame(moderator = y[,1], betas)
  betas <- tidyr::spread(betas, moderator, betas)
  betas[is.na(betas)] <- 0
  data_model <- data.frame(Covpc, Xp, betas)

  # THIS IS WHERE I STOPPED #

    ypred <- fitted(lm(y ~ 1 + Covpc + Xp, na.action = na.action))
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

    call<- match.call()
    output <- list(call=call,lvl.comp=Xp,pat.comp=pat.comp,b=regweg,bstar=bstar, xc=xc, k=k, Covpc=Covpc, Ypred=ypred,r2=r2,ftable=ftable)

    class(output) <- "critpat"
    return(output)
  }
