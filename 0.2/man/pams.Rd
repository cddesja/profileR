\name{pams}
\alias{pams}
\title{Profile Analysis via Multidimensional Scaling}
\usage{
  pams(x,dim)
}
\arguments{
  \item{x}{A data matrix or data frame; rows represent individuals, columns represent scores;
  missing scores are not allowed.}
  \item{dim}{Number of dimensions to be extracted from the data.}
}
\value{
  \item{dimensional.configuration}{A matrix that provides prototypical profiles of dimensions extracted from the data}

  \item{weights.matrix}{A matrix that includes the subject correspondence weights for all dimensions, level parameters,
 and the subject fit measure which is the proportion of variance in the subject's actual profiles accounted for by 
 the prototypical profiles.}
}

\description{
  The \code{pams} function implements profile analysis via multidimensional scaling as described by Davison, Davenport, & Bielinski (1995) and Davenport, Ding, & Davison (1995). 
}

\details{
The \code{pams} function computes similarity/dissimilarity indices based on Euclidean distances between the scores provided in the data, and then extracts dimensional coordinates for each score using multidimensional scaling. A weight matrix, level parameters, and fit measures are computed for each subject in the data. 
}

\examples{
\dontrun{
data(PS)
result <- pams(PS[,2:4], dim=2)
result
}
}

\author{
  Okan Bulut \email{okanbulut84@gmail.com}
}
\references{
  Davison, M. L., Davenport, E. C., & Bielinski, J. (1995). PAMS: SPSS Template. 

  Davenport, E. C., Ding, S., & Davison, M. L. (1995). PAMS: SAS Template. 
}
\seealso{
  \code{\link{cp}}, \code{\link{pr}}
}

