---
title: 'profileR: An R package for profile analysis'
tags:
  - R
  - profile analysis
  - psychometrics
  - measurement
  - multivariate statistics
authors:
  - name: Christopher David Desjardins
    orcid: 0000-0002-8234-9665
    affiliation: 1
  - name: Okan Bulut
    orcid: 0000-0001-5853-1267
    affiliation: 2
affiliations:
 - name: St. Michael's College
   index: 1
 - name: University of Alberta
   index: 2
date: 5 November 2019
bibliography: paper.bib

# Optional fields if submitting to a AAS journal too, see this blog post:
# https://blog.joss.theoj.org/2018/12/a-new-collaboration-with-aas-publishing
# aas-doi: 10.3847/xxxxx <- update this with the DOI from AAS once you know it.
#aas-journal: Astrophysical Journal <- The name of the AAS journal.
---

# Summary

Assessments, a series of items used to measure one or more constructs, are administered in a variety of contexts. Schools administer high-stakes standardized assessments for accountability purposes and to measure student aptitude; a young adult exhibiting compensatory and binge eating behaviors may complete a brief assessment to ascertain the likelihood of an underlying eating disorder; and human resources may recommend whether to hire an applicant based on a personality assessment. A student's, a young adult's, and applicant's scores on these assessments make up their profile. 

A suite of techniques known as profile analysis exists to identify, quantify, and interpret the extent to which individuals or groups exhibit distinct profile in terms of level, pattern, variability, and scale. Profiles can be analyzed using as repeated measures MANOVA, using multidimensional scaling and factor analysis, cluster analysis, or with supervised or unsupervised classification techniques. However, applying these disparate techniques in R can be challenging for novices and practitioners with limited statistical trainings as these techniques are either unavailable, require interfacing with a myriad of packages, or require understanding the relationship between a technique and a more general statistical framework. The R package ``profileR`` was design to address this need. 


The R package ``profileR``, currently in version 0.3-5 on the comprehensive R archive network (CRAN), implements profile reliability [@bulut2013between], criterion-related profile analysis [@davison2002identifying], profile analysis via multidimensional scaling [@pams], moderated profile analysis, profile analysis by group, and a within-person factor model to derive score profiles [@davison2009factor] as well as a variety of graphical methods to visualize profiles. The API for ``profileR`` was designed to provide a unified and user-friendly R interface for these methods. It uses the S3 class and many generics have been written to work with ``profileR`` objects.

``profileR`` was designed with researchers and practitioners in education, psychology and medicine in mind that are R novices. It has been used in counseling outcome research [@schmidt2018] and to study learning behavior in mice. It featured in a handbook on measurement and psychometrics in R [@desjardins2018], been used workshops and graduate level courses, is psychometric CRAN task view, and is downloaded, on average, 752 per month. Our focus on R novice and usability, should help to expand the reach of profile analysis into new scientific areas.

# Mathematics

Single dollars ($) are required for inline mathematics e.g. $f(x) = e^{\pi/x}$

Double dollars make self-standing equations:

$$\Theta(x) = \left\{\begin{array}{l}
0\textrm{ if } x < 0\cr
1\textrm{ else}
\end{array}\right.$$


# Citations

Citations to entries in paper.bib should be in
[rMarkdown](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html)
format.

For a quick reference, the following citation commands can be used:
- `@author:2001`  ->  "Author et al. (2001)"
- `[@author:2001]` -> "(Author et al., 2001)"
- `[@author1:2001; @author2:2001]` -> "(Author1 et al., 2001; Author2 et al., 2002)"

# Figures

Figures can be included like this: ![Example figure.](figure.png)

# Acknowledgements

We acknowledge contributions from Brigitta Sipocz, Syrtis Major, and Semyeong
Oh, and support from Kathryn Johnston during the genesis of this project.

# References