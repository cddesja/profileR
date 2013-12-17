\name{pbg}
\alias{pbg}
\alias{summary.profg}

\title{Profile by group: Parallel, coincidential, and level profiles}

\usage{
  pbg(x, y, original.names=FALSE, profile.plot=FALSE, ...)
  
  \method{summary}{profg}(object, ...)
  
  \method{print}{profg}(x, ...)
}

\arguments{
  \item{x}{A matrix or data frame with multiple scores; rows represent individuals, columns represent subscores.
  Missing subscores have to be inserted as NA.}
  
  \item{y}{A vector or data frame that indicates a grouping variable. 
  It can be either numeric or character (e.g., male-female, high-low, 0-1).
  The grouping variable must have the same length of x. Missing values are not allowed in y.}

  \item{original.names}{Use original column names in x. If FALSE, variables are renamed 
  using v1, v2, ... for subscores and "group" for the grouping variable. Default is FALSE.}

  \item{profile.plot}{Print a profile plot of scores for two groups. Default is FALSE.}
  
  \item{object}{An object of class \code{"profg"}.}

  \item{...}{Additional arguments to be passed.}
    
}

\value{
  An object of class profg is returned, listing the following components: 
  \describe{
  \item{data.summary}{Means of observed variables by the grouping variable} 
  \item{corr.table}{A matrix of correlations among observed variables splitted by the grouping variable}
  \item{profile.test}{Results of F-tests for testing parallel, coincidential, and level profiles across two groups.}
}}

\description{
  The \code{pbg} function implements three hypothesis tests. These tests are whether the profiles
  are parallel, coincidental, and level across two groups defined by the grouping variable. If parallelism 
  is rejected, the other two tests are meaningless. In that case, flatness may be assessed within each  
  group, and various within- and between-group contrasts may be analyzed. 
}

\examples{
\dontrun{
#Read spouse data from Professor Richard Jonhson's website 
spouse <- read.table(file="http://www.stat.wisc.edu/~rich/JWMULT02dat/T6-14.DAT")
mod <- pbg(spouse[,1:4],spouse[,5],labels=FALSE,profile.plot=TRUE)
print(mod) #prints average scores in the profile across two groups
summary(mod) #prints the results of hypothesis tests
}
}

\author{
  Okan Bulut \email{okanbulut84@gmail.com}
}

\seealso{
  \code{\link{pr}}, \code{\link{profileplot}}
}

