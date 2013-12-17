\name{profile.reliability}
\alias{profile.reliability}
\title{Pattern and Level Reliability via Profile Analysis}
\usage{
  profile.reliability(form1,form2)
}
\arguments{
  \item{form1,form2}{Two data matrices or data frames; rows
  represent individuals, columns represent subscores. Both
  forms should have the same individuals and subscores in
  the same order. Missing subscores have to be inserted as
  NA.}
}
\value{
  \item{reliability}{Pattern, level, and
  overall subscore reliability}

  \item{pattern.level}{A matrix of all pattern and level
  values obtained from the subscores}
}
\description{
  The \code{profile.reliability} function uses subscores
  from two parallel test forms and compute profile 
  reliability coefficients as described in Bulut (2013).
}
\details{
  Profile pattern and level reliability coefficients
  are based on the profile analysis approach described in
  Davison and Davenport (2002) and Bulut (2013). Using the
  parallel test forms or multiple administration of the
  same test form, pattern and level reliability coefficients are computed. 
  Pattern reliability is an indicator of variability between the
  subscores of an examinee and the level reliability is an indicator of 
  the average subscore variation among all examinees. For details, see
  \href{http://conservancy.umn.edu/bitstream/155592/1/Bulut_umn_0130E_13879.pdf}{Bulut
  (2003)}.
}
\examples{
\dontrun{
data(EEGS)
result <- profile.reliability(EEGS[,c(1,3,5)],EEGS[,c(2,4,6)])
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
  \code{\link{profileplot}}}


