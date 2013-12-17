\name{profileplot}
\alias{profileplot}
\title{Score Profile Plot}
\usage{
  profileplot(form,person.id,interval=10,by.pattern=TRUE,original.names=TRUE)
}

\arguments{
  \item{form}{A matrix or dataframe including two or more
  subscores.}

  \item{person.id}{A vector that includes person ID values (Optional).}

  \item{interval}{The number of equal intervals from the
  mimimum score to the meximum score. Default is 10. Ignored when by.pattern=FALSE.}
  
  \item{by.pattern}{If TRUE, the function creates a profile plot with level and pattern values using ggplot2.
  Otherwise, the function creates a profile plot showing profile scores of persons using the base graphics in R. Default is TRUE.}
  
  \item{original.names}{Use the original column names in the data. Otherwise, columns are renamed as v1,v2,.... Default is TRUE} 
}

\value{
  The \code{profileplot} functions returns a score profile plot from either ggplot2 or the base graphics in R.}
}
\description{
  The \code{profileplot} function creates a profile plot
  for a matrix or dataframe with multiple scores or
  subscores using \code{\link[ggplot2]{ggplot2}} function
  in \code{ggplot2} package.
}
\examples{
\dontrun{
data(PS)
myplot <- profileplot(PS[,2:4],person.id=PS$Person,by.pattern=TRUE,original.names=TRUE)
myplot

data(leisure)
leisure1 <- ddply(leisure,~Group,summarise,Read.Dance=mean(Read.Dance),Dance.TV=mean(Dance.TV),TV.Ski=mean(TV.Ski))
leis.plot <- profileplot(leisure1[,2:4],person.id=leisure1$Group,interval=10,by.pattern=FALSE,original.names=TRUE)
leis.plot
}
}
\author{
  Okan Bulut \email{okanbulut84@gmail.com}
}
\seealso{
  \link[ggplot2]{ggplot2}, \link{PS}
}

