\name{profile.by.group}
\alias{profile.by.group}

\title{Testing equality of parallel, coincidential, and level profiles across two groups}

\usage{
  profile.by.group(x, y, labels=TRUE, profile.plot=FALSE, ...)
}

\arguments{
  \item{x}{A matrix or data frame with multiple scores; rows
  represent individuals, columns represent subscores.
  Missing subscores have to be inserted as NA.}
  
  \item{y}{A vector or data frame that indicates a grouping variable. 
  It can be either numeric or character (e.g., male-female, high-low, 0-1).
  The grouping variable must not have any missing values.}

  \item{labels}{Use the original variable names in the data. Default is FALSE.
  Unless it is TRUE, variables are renamed using v1, v2, ... for subscores and "group" for the
  grouping variable.}

  \item{profile.plot}{Print score profiles of two groups as a returning object.
  Default is FALSE.}

  \item{...}{additional arguments to be passed.}
    
}

\value{
  An object of class profg is returned, listing the summary of observed variables 
  (i.e., subscores) by the grouping variable, and the results of F-tests for testing equality of
  parallel, coincidential, and level profiles across two groups. 
}

\description{
  The \code{profile.by.group} function implements three hypothesis tests. It tests the equality of 
  parallel, coincidential, and level profiles across two groups defined by the grouping variable.  
}

\examples{
\dontrun{
#Read spouse data from Professor Jonhson's website 
spouse <- read.table(file="http://www.stat.wisc.edu/~rich/JWMULT02dat/T6-14.DAT")
mod <- profile.by.group(spouse[,1:4],spouse[,5],labels=FALSE,profile.plot=TRUE)
mod$data.summary #prints average scores in the profile across two groups
summary(mod) #prints hypothesis tests
}
}

\author{
  Okan Bulut \email{okanbulut84@gmail.com}
}

\seealso{
  \code{\link{summary.profg}}
}

