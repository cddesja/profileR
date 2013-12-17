\name{summary.profg}
\alias{summary.profg}

\title{Print F-test results from profile.by.group}

\description{
  Methods for extracting information from model objects of class \code{"profg"}. Presently, only the summary function is implemented.
}

\usage{
  \S3method{summary}{profg}(object, ...) 
}
\arguments{
  \item{object}{an object of class \code{"profg"} as returned by
    \code{\link{pbg}}.}
    
    \item{...}{additional arguments to be passed} 
}


\details{
  The \code{summary} returns three hypothesis tests of the profile analysis. 
  These hypothesis are parallelness, flatness, and being coincidental of the 
  profiles of two groups. 
}

\examples{
\dontrun{
#Read spouse data from Professor Richard Jonhson's website 
spouse <- read.table(file="http://www.stat.wisc.edu/~rich/JWMULT02dat/T6-14.DAT")
mod <- pbg(spouse[,1:4],spouse[,5],labels=FALSE,profile.plot=TRUE)
mod$data.summary #prints average scores in the profile across two groups
summary(mod) #prints the results of hypothesis tests
}
}

\author{
  Okan Bulut
  \email{okanbulut84@gmail.com}
}

\seealso{
  \code{\link{pbg}}
}
\keyword{methods}

