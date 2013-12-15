\name{profilecv}
\alias{profilecv}
\title{Cross-Validation for Profile Analysis}
\usage{
  profilecv(x, y)
}
\arguments{
  \item{x}{Corresponds to the predictor variable}

  \item{y}{Corresponds to the dependent variable}
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
  The \code{profilecv} function requires two arguments: X
  and Y. The argument X corresponds to the predictor
  variables. This matrix of covariates may be in their own
  object or in the same object as the dependent variable.
  The Y argument corresponds to the dependent variable.
  This vector may be in a separate object or in the same
  object as X. The function returns the cross-validation
  technique described in Davison & Davenport (2002). The
  data must be specified as matrices and there can be no
  missing data.
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
  \code{\link{criterion.pattern}}
}
\keyword{methods}

