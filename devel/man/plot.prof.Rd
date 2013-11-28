\name{plot.prof}
\alias{plot.prof}
\title{Plot the Output from a Within-person and Between-person Subscore Reliability via Profile Analysis}
\usage{
  \S3method{plot}{prof}(x,y = NULL,...)
}
\arguments{
  \item{x}{an object of class prof}
  \item{y}{an optional argument}
  \item{...}{further arguments to be passed}
}
\value{
  \item{reliability}{Within-person, between-person, and
  overall subscore reliability}

  \item{pattern.level}{A matrix of all pattern and level
  values obtained from the subscores}
}
\description{
  The \code{subscore.reliability} function uses subscores
  from two parallel test forms and compute profile
  analysis-based subscore reliability coefficients as
  described in Bulut (2013).
}
\details{
  Within-person and between-person reliability coefficients
  are based on the profile analysis approach described in
  Davison and Davenport (2002) and Bulut (2013). Using the
  parallel test forms or multiple administration of the
  same test form, within-person and between-person subscore
  reliability coefficients are computed. Within-person
  reliability is an indicator of variability between the
  subscores of an examinee and the between-person subscore
  reliability is an indicator of the variation among all
  examinees. For details, see
  \href{http://conservancy.umn.edu/bitstream/155592/1/Bulut_umn_0130E_13879.pdf}{Bulut
  (2003)}.
}
\examples{
\dontrun{
data(EEGS)
result <- subscore.reliability(EEGS[,c(1,3,5)],EEGS[,c(2,4,6)])
print(result)
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

