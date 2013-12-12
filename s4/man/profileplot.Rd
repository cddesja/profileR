\name{profileplot}
\alias{profileplot}
\title{Score Profile Plot}
\usage{
  profileplot(form,person.id,interval=10)
}
\arguments{
  \item{form}{A matrix or dataframe including two or more
  subscores.}

  \item{person.id}{A vector that includes ID values for
  individuals (Optional).}

  \item{interval}{The number of equal intervals from the
  mimimum score to the meximum score. Default is 10.}
}
\value{
  An object of score \code{profile.plot}.
}
\description{
  The \code{profile.plot} function creates a profile plot
  for a matrix or dataframe with multiple scores or
  subscores using \code{\link[ggplot2]{ggplot2}} function
  in \code{ggplot2} package.
}
\examples{
\dontrun{
data(PS)
myplot <- profileplot(PS[,2:4],person.id=PS$Person)
myplot

data(leisure)
leisure1 <- ddply(leisure,~Group,summarise,Read.Dance=mean(Read.Dance),
Dance.TV=mean(Dance.TV),TV.Ski=mean(TV.Ski))
leis.plot <- profile.plot(leisure1[,2:4],person.id=leisure1$Group,interval=10)
leis.plot
}
}
\author{
  Okan Bulut \email{okanbulut84@gmail.com}
}
\seealso{
  \link[ggplot2]{ggplot2},\link{PS}
}

