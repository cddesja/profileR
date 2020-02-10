
# profileR

**Development version**: v0.3-5 on GitHub [![Build Status](https://travis-ci.org/cddesja/profileR.svg?branch=master)](https://travis-ci.org/cddesja/profileR) [![codecov.io](http://codecov.io/github/cddesja/profileR/coverage.svg?branch=master)](http://codecov.io/github/cddesja/profileR?branch=master) 
[![](https://cranlogs.r-pkg.org/badges/profileR)](https://cran.r-project.org/package=profileR)

### Title: Profile Analysis of Multivariate Data in R

### Type: Package

***

### Overview

``profileR`` can be used for estimating profile analytic models. This includes the multivariate methods and data visualization tools to implement profile analysis and cross-validation techniques described in previous studies, including Davison and Davenport (2002), Bulut (2013), and Bulut, Davison, and Rodriguez (2017). Some of the principal functions in ``profileR`` include:

1. **Statistical methods:**
  
  - Profile analysis for one sample using Hotelling's T-squared statistic
  - Profile analysis by groups to assess parallelism, equality, and flatness
  - Profile analysis via multidimensional scaling (a.k.a., PAMS)
  - Criterion-related profile analysis
  - Pattern and level reliability for profiles
  
2. **Visualizations:**
  
  - Profile plots for a set of multivariate scores
  - Profile plots returned from profile analysis by groups (see ``pbg``)
  - Plots for showing pattern and levels effects in criterion-related profile analysis (see ``cpa``)
  

***

### Installing ``profileR``

Most recent version (and early versions) are installable from [CRAN](https://cran.r-project.org/package=profileR) by using:

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

To cite ``profileR``, you can use the following citations:

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

We are open to suggestions for improvements in ``profileR``. Therefore, we invite all users to post a question or to provide us with (either positive or negative) feedback on the functions available in ``profileR``. When filing an issue, the most important thing is to include a minimal reproducible example so that we can quickly verify the problem, and then figure out how to fix it. There are two things you may need to include to make your example reproducible: data and code. If you are using additional packages, we would need that information as well. 

In addition, we welcome users who would like to contribute to the ``profileR`` package by adding new functions or co-developing some functions with us. You can let us know which function(s) you want to develop or which of the existing function(s) you want to improve. Please note that ``profileR`` is released with a [Contributor Code of Conduct](https://github.com/cddesja/profileR/blob/master/CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.


To get further help regarding the functions available in ``profileR`` or inquries regarding contributions, please email us:

  - Okan Bulut (<okanbulut84@gmail.com>)
  - Chris Desjardins (<cddesjardins@gmail.com>)




