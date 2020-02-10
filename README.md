
---
output: github_document
---

# profileR

**Development version**: v0.3-5 on GitHub [![Build Status](https://travis-ci.org/cddesja/profileR.svg?branch=master)](https://travis-ci.org/cddesja/profileR) [![codecov.io](http://codecov.io/github/cddesja/profileR/coverage.svg?branch=master)](http://codecov.io/github/cddesja/profileR?branch=master) 
[![](https://cranlogs.r-pkg.org/badges/profileR)](https://cran.r-project.org/package=profileR)

### Title: Profile Analysis of Multivariate Data in R

### Type: Package

### Overview

``profileR`` can be used for estimating profile analytic models. This includes the multivariate methods and data visualization tools to implement profile analysis and cross-validation techniques described in previous studies, including Davison & Davenport (2002), Bulut (2013), and Bulut, Davison, and Rodriguez (2017).

***

### Installation

Released versions are installable from [CRAN](https://cran.r-project.org/package=profileR) by using:

```R
install.packages("profileR")
```

and the developmental version on Github can be installed by using:

```R
devtools::install_github(repo = "cddesja/profileR")
```

***

### Using and Citing ``profileR``

To learn how to conduct profile analysis using ``profileR``, you can see our paper available on [PsyArxiv](https://psyarxiv.com/sgy8m). This paper walks through some of the principal methods available in ``profileR``. In the paper, a brief theory behind each method is presented, followed by a working example demonstrating how to use these methods in ``profileR``. 

To cite ``profile``, you can use the following citations:

> Bulut, O., & Desjardins, C. D. (2020). *Profile analysis of multivariate data: A brief introduction to the profileR package*. Retrieved from [psyarxiv.com/sgy8m](https://psyarxiv.com/sgy8m). doi: 10.31234/osf.io/sgy8m

> Bulut, O., & Desjardins, C. D. (2018). *profileR: Profile analysis of multivariate data in R* [Computer software]. Available from <http://CRAN.R-project.org/package=profileR>.

***

### Updates in ``profileR``

##### Changes since v0.3
- Added gtheory functions
- Added the spouse data in the package. 
- Added ef and writing data.

##### Changes since v0.2
- Added wprifm, which performs a within-person random intercept factor model to obtain a score profile.
- EXPERIMENTAL: Added moderated profile analysis. This function is untested and based on unpublished methodology. 
- Changed cp to cpa to avoid confusion with cp in Linux and Mac environments.
- Changed pc to pcv.

***

### Contributing and Contact Information

We are open to suggestions for improvements in ``profileR``. Therefore, we invite all users to post a question or to provide us with (either positive or negative) feedback on the functions available in ``profileR``. In addition, we welcome users who would like to contribute to the ``profileR`` package by adding new functions or co-developing some functions with us. 

Please note that ``profileR`` is released with a [Contributor Code of Conduct](). By contributing to this project, you agree to abide by its terms.


To get further help regarding the functions available in ``profileR``, please email us:

  - Okan Bulut (<okanbulut84@gmail.com>)
  - Chris Desjardins (<cddesjardins@gmail.com>)




