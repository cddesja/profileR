###Package: profileR

###Title: Profile Analysis of Multivariate Data in R

###Type: Package

**Development version**: v0.3 on GitHub [![Build Status](https://travis-ci.org/cddesja/profileR.svg?branch=master)](https://travis-ci.org/cddesja/profileR)

Description: Fit profile analytic models. This includes multivariate methods and data visualization tools 
    to implement profile analysis and cross-validation techniques described 
    in Davison & Davenport (2002) and Bulut (2013).

Released versions are installable from [CRAN](http://cran.r-project.org/package=profileR) and the developmental version can be installed by:

```R
library(devtools)
install_github(repo = "cddesja/profileR")
```

#### Changes since v0.2
- Added a wprifm, which performs a within-person random intercept factor model.
- EXPERIMENTAL: Added moderated profile analysis. This function is untested and best on unpublished methodology. 
- Changed cp to cpa to avoid confusion with cp in Linux and Mac environments.
- Changed pc to pcv.
