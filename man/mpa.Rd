\name{mpa}
\alias{mpa}
\title{Moderated Profile Analysis}

\usage{
	mpa(formula, data, k=100, na.action = "na.fail", family = "gaussian", weights = NULL)
}

\arguments{
  \item{formula}{N/A}
  \item{data}{N/A}
  \item{k}{Corresponds to the scalar constant and must be greater than 0. Defaults to 100.}
  \item{na.action}{How should missing data be handled? Function defaults to failing if missing data are present.}
  \item{family}{N/A}
  \item{weights}{N/A}
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
  N/A
}

\details{
  N/A
}
\examples{
\dontrun{
N/A
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
  \code{\link{cpa}}
}
\keyword{methods}

