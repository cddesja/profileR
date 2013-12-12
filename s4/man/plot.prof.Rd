\name{plot.prof}
\alias{plot.prof}

\title{Plot the output from profile.reliability}

\usage{
  \S3method{plot}{prof}(x,y = NULL,...)
}
\arguments{
  \item{x}{an object of class prof}
  \item{y}{an optional argument}
  \item{...}{further arguments to be passed}
}

\description{
  Methods for extracting information from model objects of class \code{"prof"} returned by
  \code{profile.reliability}. Presently, only the print and plot functions are implemented. 
  See \code{\link{profile.reliability}} for more details.
}

\details{
  The \code{print} returns a plot from the output provided by \code{profile.reliability}. 
  The plot shows profile levels of two parallel test forms used in the analysis.
  For more details, see \href{http://conservancy.umn.edu/bitstream/155592/1/Bulut_umn_0130E_13879.pdf}{Bulut(2003)}.
}

\examples{
\dontrun{
data(EEGS)
result <- profile.reliability(EEGS[,c(1,3,5)],EEGS[,c(2,4,6)])
plot(result)
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

