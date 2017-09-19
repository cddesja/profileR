###Package: profileR

###Title: Profile Analysis of Multivariate Data in R

###Type: Package

**Development version**: v0.3-3 on GitHub [![Build Status](https://travis-ci.org/cddesja/profileR.svg?branch=master)](https://travis-ci.org/cddesja/profileR) [![codecov.io](http://codecov.io/github/cddesja/profileR/coverage.svg?branch=master)](http://codecov.io/github/cddesja/profileR?branch=master)

Description: Fit profile analytic models. This includes the multivariate methods and data visualization tools 
    to implement profile analysis and cross-validation techniques described 
    in Davison & Davenport (2002) and Bulut (2013).

Released versions are installable from [CRAN](http://cran.r-project.org/package=profileR) and the developmental version can be installed by:

```R
devtools::install_github(repo = "cddesja/profileR")
```

#### Changes since v0.3
- Added JSS unpublished, and under review, manuscript as a vignette.
- Added the spouse data in the package. 

#### Changes since v0.2
- Added wprifm, which performs a within-person random intercept factor model to obtain a score profile.
- EXPERIMENTAL: Added moderated profile analysis. This function is untested and based on unpublished methodology. 
- Changed cp to cpa to avoid confusion with cp in Linux and Mac environments.
- Changed pc to pcv.
