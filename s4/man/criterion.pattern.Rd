\name{criterion.pattern}
\alias{criterion.pattern}
\title{Criterion-Related Profile Analysis}
\usage{
  criterion.pattern(x, y, k = 100)
}
\arguments{
  \item{x}{Corresponds to the predictor Variable}

  \item{y}{Corresponds to the Dependent Variable}

  \item{k}{Corresponds to the scalar constant and must be
  greater than 0. Defaults to 100}
  
  \item{...}{additional arguments to be passed}
}
\value{
  An object of class "profileR" is returned, listing the
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
  arguments: X and Y. The argument X corresponds to the
  predictor variables.  This matrix of covariates may be in
  their own object or in the same object as the dependent
  variable.  The Y argument corresponds to the dependent
  variable. This vector may be in a separate object or in
  the same object as X. The function returns the
  criterion-related profile analysis described in Davison &
  Davenport (2002). Presently there can be no missing data.
}
\examples{
\dontrun{
data(IPMMc)
mod <- criterion.pattern(IPMMc[,1:4],IPMMc[,5],k=100)
summary(mod)
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
  \code{\link{profilecv}}}
}
\keyword{methods}

