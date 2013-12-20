\name{pc}
\alias{pc}
\title{Cross-Validation for Profile Analysis}
\usage{
  pc(criterion, predictor, seed = NULL, na.action = "na.fail")
}
\arguments{
  \item{criterion}{Corresponds to the criterion variable}

  \item{predictor}{Corresponds to the predictor variable}
  
  \item{seed}{Should a seed be set? Function defaults to a random seed.}
  
  \item{na.action}{How should missing data be handled? Function defaults to failing if missing data are present.}
}
\value{
  \item{R2.full}{Test of the null hypothesis that R2 = 0}
  \item{R2.pat}{Test that the R2_pattern = 0}
  \item{R2.level}{Test that the R2_level = 0}
  \item{R2.full.lvl}{Test that the R2_full = R2_level = 0}
  \item{R2.full.pat}{Test that the R2_full = R2_pattern =
  0}
}
\description{
  Implements the cross-validation described in Davison &
  Davenport (2002).
}
\details{
  The \code{pc} function requires two arguments: criterion
  and predictor. The criterion corresonds to the dependent variable and the predictor corresponds to the matrix of predictor variables. The function performs the cross-validation
  technique described in Davison & Davenport (2002) and an object of class \code{critpat} is returned. There the following s3 generic functions are available: \code{summary()},\code{anova()}, \code{print()}, and \code{plot()}. These functions provide a summary of the cross-validation (namely, R2); performs ANOVA of the R2 based on the split for the level, pattern, and overall; provide output similar to \code{lm()}; and plot the estimated parameters for the random split.  Missing data are presently handled by specifying \code{na.action = "na.omit"}, which performs listwise deletion and \code{na.action = "na.fail"}, the default, which causes the function to fail. A seed may also be set for reproducibility by setting the \code{seed}. 
}
\author{
  Christopher David Desjardins
  \email{cddesjardins@gmail.com}
}
\references{
  Davison, M., & Davenport, E. (2002). Identifying
  criterion-related patterns of predictor scores using
  multiple regression. \emph{Psychological Methods, 7}(4),
  468-484.
}
\seealso{
  \code{\link{cp}},\code{\link{print.critpat}},\code{\link{summary.critpat}},\code{\link{anova.critpat}},\code{\link{plot.critpat}} 
}
\keyword{methods}

