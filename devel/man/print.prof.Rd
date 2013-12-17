\name{print.prof}
\alias{print.prof}

\title{Print the output from profile.reliability}

\usage{
  \S3method{print}{prof}(x,...)
}
\arguments{
  \item{x}{an object of class prof}
   \item{...}{further arguments to be passed}
}

\description{
  Methods for extracting information from model objects of class \code{"prof"} returned by
  \code{pr}. Presently, only the print and plot functions are implemented. 
  See \code{\link{pr}} for more details. 
}

\details{
  The \code{summary} returns three profile reliability coefficients from
  \code{pr}. These coefficients are pattern, level, and overall
  profile reliability coefficients. For more details, see
  \href{http://conservancy.umn.edu/bitstream/155592/1/Bulut_umn_0130E_13879.pdf}{Bulut
  (2003)}.
}
\examples{
\dontrun{
data(EEGS)
result <- pr(EEGS[,c(1,3,5)],EEGS[,c(2,4,6)])
print(result)
}
}

\author{
  Okan Bulut \email{okanbulut84@gmail.com}
}
\references{
  Bulut, O. (2013). \emph{Between-person and within-person
  subscore reliability: Comparison of unidimensional and
  multidimensional IRT models}. (Doctoral dissertation).
  University of Minnesota. University of Minnesota,
  Minneapolis, MN. (AAT 3589000).

  Davison, M., & Davenport, E. (2002). Identifying
  criterion-related patterns of predictor scores using
  multiple regression. \emph{Psychological Methods, 7}(4),
  468-484.
}
\seealso{
  \link{profileplot}
}

