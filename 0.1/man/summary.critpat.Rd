\name{summary.critpat}
\alias{summary.critpat}

\title{Methods for Criterion-Related Profile Analysis}

\description{
  Methods for extracting information from model objects of class \code{"critpat"}. Presently, only the summary function is implemented.
}

\usage{
  \S3method{summary}{critpat}(object, ...) 
}
\arguments{
  \item{object}{an object of class \code{"critpat"} as returned by
    \code{\link{criterion.pattern}}.}

  \item{...}{additional arguments to be passed}
  
}


\details{
  The \code{summary} returns various hypotheses tests of the
  pattern and the level components described in Davison &
  Davenport (2002). 
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
  \code{\link{profilecv}}
}
\keyword{methods}

