\name{cp}
\alias{cp}
\alias{plot.critpat}
\alias{summary.critpat}
\alias{anova.critpat}
\alias{print.critpat}

\title{Criterion-Related Profile Analysis}

\usage{
	cp(criterion, predictor,k = 100, na.action = NULL)
	
	\method{summary}{critpat}(object, ...)
  
  \method{plot}{critpat}(x, ...)
  
  \method{anova}{critpat}(object, ...)
  
  \method{print}{critpat}(x, ...)
}

\arguments{
  \item{criterion}{Corresponds to the criterion variable.}
  \item{predictor}{Corresponds to the predictor variables.}
  \item{k}{Corresponds to the scalar constant and must be greater than 0. Defaults to 100.}
  \item{na.action}{How should missing data be handled? Function defaults to failing if missing data are present.}
  \item{x}{An object of class \code{"critpat"}.}
  \item{object}{An object of class \code{"critpat"}.}
  \item{...}{Additional arguments to be passed.}
}
\value{
  An object of class \code{critpat} is returned, listing the
  following components: \item{lvl.comp}{The level
  component} \item{pat.comp}{The pattern component}
  \item{b}{The regression weights} \item{bstar}{The mean
  centered regression weights} \item{xc}{The scalar
  constant times bstar} \item{k}{The scale constant}
  \item{Covpc}{The pattern effect} \item{Ypred}{The
  predicted values} \item{r2}{The proportion of variability
  attributed to the different components}
  \item{F.table}{The associated F-statistic table}
  \item{F.statistic}{The F-statistics} \item{df}{The df
  used in the test} \item{pvalue}{The p-values for the
  test}
}
\description{
  Implements the criterion-related profile analysis
  described in Davison & Davenport (2002).
}
\details{
  The \code{criterion.pattern} function requires two
  arguments: criterion and predictors. The function returns the
  criterion-related profile analysis described in Davison &
  Davenport (2002). Missing data are presently handled by specifying \code{na.action = "na.omit"}, which performs listwise deletion and \code{na.action = "na.fail"}, the default, which causes the function to fail. The following s3 generic functions are available: \code{summary()},\code{anova()}, \code{print()}, and \code{plot()}. These functions provide a summary of the analysis (namely, R2 and the level and pattern components); perform ANOVA of the R2 for the pattern, the level, and the overall model; provide output similar to \code{lm()}, and plots the pattern effect.

}
\examples{
\dontrun{
data(IPMMc)
mod <- cp(IPMMc[,5], IPMMc[,1:4],k=100)
print(mod)
summary(mod)
plot(mod)
anova(mod)
}
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
  \code{\link{pc}}
}
\keyword{methods}

