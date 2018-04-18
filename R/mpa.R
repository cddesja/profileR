#' Moderated Profile Analysis
#'
#' Implements the moderated profile analysis approach developed by Davison & Davenport (unpublished)
#'
#' The function returns the criterion-related moderated profile analysis described in Davison & Davenport (unpublished). Missing data are presently handled by specifying \code{na.action = "na.omit"}, which performs listwise deletion and \code{na.action = "na.fail"}, the default, which causes the function to fail. The following S3 generic functions are not yet available but will be in future implementations. \code{summary()},\code{anova()}, \code{print()}, and \code{plot()}. These functions provide a summary of the analysis (namely, R2 and the level and pattern components); perform ANOVA of the R2 for the pattern, the level, and the overall model; provide output similar to \code{lm()}, and plots the pattern effect. WORKS ONLY WITH TWO GROUPS!
#' 
#' @export
#' @importFrom stats lm anova coef update variable.names
#' @param formula An object of class \code{\link{formula}} of the form \code{response ~ terms}.
#' @param data An optional data frame, list or environment containing the variables in the model.
#' @param moderator Name of the moderator variable.
#' @param k Corresponds to the scalar constant and must be greater than 0. Defaults to 100.
#' @param na.action How should missing data be handled? Function defaults to failing if missing data are present.
#' @return A list containing the following components:
#' \itemize{
#'  \item \code{call} - The model call
#'  \item \code{output} - The output from the moderated criterion-related profile analysis
#'  \item \code{f.table} - The corrected F-table for assessing differences in patterns.
#'  \item \code{moder.model} - The standard moderated regression model
#'  }
#'
#' @examples
#' \dontrun{
#' data(mod_data)
#' mod <- mpa(gpa ~ satv * major + satq * major, moderator = "major", data = bacc2001)
#' summary(mod$output)
#' mod$f.table
#' summary(mod$moder.model)
#' }
#' 
#'
#' @references Davison, M., & Davenport, E. (unpublished). Comparing Criterion-Related Patterns of Predictor Variables across Populations Using Moderated Regression.
#' @seealso \code{\link{cpa}}
#' @keywords method

mpa <- function(formula, data, moderator, k = 100, na.action = "na.fail"){
  cat("# -------- Executing Stage 1 --------  #")
  stage1.mod <- lm(formula = formula, data = data, na.action = na.action)
  stage1.tab <- summary(stage1.mod)
  loc.mod <- grep(":", rownames(stage1.tab$coefficients))
  if(any(stage1.tab$coefficients[loc.mod, 4] < .05)){
    cat("\n# -------- Executing Stage 2 --------  #\n")
  
    # Drop response and moderator variables
    loc <- which(names(stage1.mod$model) == moderator)
    resp <- stage1.mod$model[,1]
    
    # Identify name and number of predictors
    pred.num <- length(names(stage1.mod$model)[-c(1, loc)])
    pred.name <- names(stage1.mod$model)[-c(1, loc)]
    x <- stage1.mod$model[, -c(1, loc)]
    z <- stage1.mod$model[,loc]
    
    # is moderator numeric? if not, change it to numeric
    if(!(is.numeric(z))) z <- ifelse(z == sort(unique(z))[1], 0, 1)
    
    # Find level effect
    xp <- apply(x, 1, mean)
    
    # Extract predictors associated with reference group
    bv <- coef(stage1.mod)[names(coef(stage1.mod)) %in% pred.name]
    b.bar <- mean(bv)
    covpr <- 1 / length(pred.name) * as.matrix(x - xp)%*%as.matrix(bv - b.bar)
    
    wv <- coef(stage1.mod)[grep(":", names(coef(stage1.mod)))]
    w.bar <- mean(wv)
    diff.cov <- 1 / length(pred.name) * as.matrix(x - xp)%*%as.matrix(wv - w.bar)
    
    model.data <- data.frame(resp, level.ref = xp, level.focal = z * xp, pat.ref = covpr,
                             pat.diff = z * diff.cov, z = z)
    
    # fit full and reduced models
    full.mod <- lm(resp ~ 1 + level.ref + level.focal + pat.ref + pat.diff + z, data = model.data)
    red.mod <- lm(resp ~ 1 + level.ref + level.focal + pat.ref + z, data = model.data)
    
    # calculate f-test
    f.num <- summary(full.mod)$r.squared - summary(red.mod)$r.squared
    f.den <- (1 - summary(full.mod)$r.squared)
    df.num <- nrow(model.data) - 2 * pred.num - 2
    df.den <- pred.num - 1
    f <- (f.num / f.den) * (df.num / df.den)
    f.tab <- c(f, df.den, df.num,
               pf(f, df.den, df.num, lower.tail = FALSE))
    names(f.tab) <- c("F.stat", "df1", "df2", "p-value")
    f.table <- round(f.tab, 3)
    
    call<- match.call()
    output <- list(call = call, output = full.mod, f.table = f.tab,
                   moder.model = stage1.mod)
  }
  else {
    cat("\n# -------  Not executing stage 2. There can be no moderated profile analysis  ------- #")
  }
}
