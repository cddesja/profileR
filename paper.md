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

A profile is a vector containing a person’s or group's scores from an assessment. An assessment, defined here as a series of items used to measure one or more constructs, are administered in a variety of contexts. Schools administer high-stakes standardized assessments for accountability purposes and to measure student aptitude and progress; a young adult exhibiting compensatory and binge eating behaviors may complete a brief assessment to ascertain the likelihood of an underlying eating disorder; and human resources may recommend whether to hire an applicant based on a personality assessment. A student's, a young adult's, and an applicant's scores on these assessments make up their profile. 

![Figure 1](figure1.png) shows the score profiles of six random participants on an assessment of the five personality constructs - agreebleness (A), conscientiousness (C), Extraversion (E), Neuroticism (N), and Opennness (O). Figure 1 shows that participant 975 had the highest average score across the constructs (23.6), while 710 has the lowest average score (16.4), that individuals 273 and 710 and 392 and 975 share similar, potentially qualitatively important, patterns, and that participant 273's profile had the greatest variance (36.2), while participant 392's had the least (5.5). These features the level, pattern, and variability in a profile often hold important clinicial meaning and statitistically assessing differences in these features is of importance to clincians, educators, and researchers.   

A suite of techniques, collectively known as profile analysis, can be used to analyze and classifiy profiles. These techniques come from a variety of statistical frameworks including repeated measures MANOVA, multidimensional scaling and factor analysis, cluster analysis, or with supervised or unsupervised classification techniques. Applying these disparate techniques in R can be challenging for novices and practitioners with limited statistical training as these techniques are either unavailable, require interfacing with a myriad of packages, or require understanding the relationship between a technique and a more general statistical modeling framework. The R package ``profileR`` was designed to address this need. 

The R package ``profileR``, currently in version 0.3-5 on the comprehensive R archive network (CRAN), implements profile reliability [@bulut2013between], criterion-related profile analysis [@davison_identifying_2002], profile analysis via multidimensional scaling [@pams], moderated profile analysis, profile analysis by group, and a within-person factor model to derive score profiles [@davison2009factor] as well as a variety of graphical methods to visualize profiles. The API for ``profileR`` was designed to provide a unified, consistent, and user-friendly R interface for these methods (see ![Figure 2](profileR.png). It uses the S3 class and many generics have been written to work with ``profileR`` objects. Any future extensions to ``profileR`` will adhere to the existing API. 

``profileR`` was designed with researchers and practitioners in education, psychology, and medicine in mind with limited statistical knowledge and R experience. It has been used in counseling outcome research [@schmidt2018] and to study learning behavior in mice. It was featured in a handbook on measurement and psychometrics in R [@desjardins2018handbook], has been used in workshops and graduate level courses, is a part of the psychometric CRAN task view, and is downloaded, on average, 752 per month. Our focus on R novice and usability, should help to expand the reach of profile analysis into new scientific field.


# References