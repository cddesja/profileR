#' @name profileR-package
#' @aliases profileR-package
#' @docType package
#' @title Profile Analysis and Its Applications
#' @description profileR provides a set of tools that implement the profile analysis
#' and cross-validation techniques described in Davison & Davenport (2002) and Bulut (2013).
#' @author 
#' Okan Bulut \email{okanbulut84@@gmail.com} 
#' 
#' Christopher David Desjardins \email{cddesjardins@@gmail.com}				
#' @import MASS ggplot2 plyr
#' @importFrom graphics plot
#' @importFrom reshape melt
#' @keywords package
#' @references 
#' Bulut, O. (2013). \emph{Between-person and within-person subscore reliability: Comparison of unidimensional and multidimensional IRT models}. (Doctoral dissertation). University of Minnesota. University of Minnesota, Minneapolis, MN. (AAT 3589000).
#' 
#' Davison, M., & Davenport, E. (2002). Identifying criterion-related patterns of predictor scores using multiple regression. \emph{Psychological Methods, 7}(4), 468-484.
#' 
#' Davison, M. L., Kim, S-K., & Close, C. W. (2009). Factor analytic modeling of within person variation in score profiles. 
#' \emph{Multivariate Behavioral Research, 44}, 668-87.
#'  
NULL



#' @name EEGS
#' @title Entrance Examination for Graduate Studies
#' @aliases EEGS
#' @docType data
#' @description The \code{EEGS} is a subset of the Entrance Examination for Graduate Studies in Turkey.
#' There are three subscores in EEGS: Quantitative 1, Quantitative 2, and Verbal.
#' In order to show the utility of subscore reliability method in this package,
#' each subtest was separated into two parallel form.
#' 
#' @format
#' 
#'  \describe{ 
#'    \item{Form1_Q1}{First form of Quantitative 1}
#'    \item{Form2_Q1}{Second form of Quantitative 1}
#'    \item{Form1_Q2}{First form of Quantitative 2}
#'    \item{Form2_Q2}{Second form of Quantitative 2}
#'    \item{Form1_V}{First form of Verbal}
#'    \item{Form2_V}{Second form of Verbal}
#'  }
#'  
#' @usage data(EEGS)     
#' @keywords datasets
NULL



#' @name PS
#' @docType data
#' @title A Hypothetical Personality Scale from Davison, Kim, & Close (2009)
#' @description The \code{PS} shows score profiles of six respondents to a hypothetical personality scale.
#' It includes three types of profile patterns: Linearly increasing, inverted V, and
#' linearly decreasing.
#' 
#' @format
#' 
#' 	\describe{
#' 		\item{Person}{Person ID}
#' 		\item{NEU}{Neurotic scale score}
#' 		\item{PSY}{Psychotic scale score}
#' 		\item{CD}{}{Character disorder scale score}
#' 	}
#' 
#' @usage data(PS)
#' @source 
#' Davison, M. L., Kim, S-K., & Close, C. W. (2009). Factor analytic modeling of within person variation in score profiles. 
#' \emph{Multivariate Behavioral Research, 44}, 668-87.
#' 
#' @references
#' Davison, M. L., Kim, S-K., & Close, C. W. (2009). Factor analytic modeling of within person variation in score profiles. 
#' \emph{Multivariate Behavioral Research, 44}, 668-87.
#' 
#' @keywords datasets
NULL


#' @name IPMMc
#' @title Inventory of Personality and Mood Manifestation
#' @aliases IPMMc
#' @docType data
#' @description The \code{IPMMc} data frame has 6 rows and 5 columns. See Davison & Davenport (2002) for more information.
#' @format
#' This data frame contains the following columns:
#' \describe{
#'  \item{A}{Anxiety}
#'  \item{H}{Hypochondriasis}
#'  \item{S}{Schizophrenia}
#'  \item{B}{Bipolar Disorder}
#'  \item{R}{The Neurotic versus Psychotic Criterion Variable, where Neurotic (= 1) or Psychotic (= 0)}
#'  }
#'  
#' @usage data(IPMMc)
#'  
#' @source Davison, M., & Davenport, E. (2002). Identifying criterion-related patterns of predictor scores using multiple regression. 
#' \emph{Psychological Methods, 7}(4), 468-484.
#'  
#' @references Davison, M., & Davenport, E. (2002). Identifying criterion-related patterns of predictor scores using multiple regression. 
#' \emph{Psychological Methods, 7}(4), 468-484.
#' 
#' @keywords datasets
NULL


#' @name leisure
#' @title Leisure Activity Rankings
#' @aliases leisure
#' @docType data
#' @description The \code{leisure} dataset includes leisure activity rankings for three different groups: 
#' politicians, administrators, and belly-dancers. Rankings are provided in three categories: Reading-TV, Dance-TV, 
#' and TV-Ski. See Tabachnik & Fidell (1996) for more details.
#' @usage data(leisure)
#' @source Tabachnick, B. G., & Fidell, L. S. (1996). \emph{Using multivariate statistics} (3rd ed.). New York: Harper Collins.     
#' @keywords datasets
#' @examples
#' \dontrun{
#' data(leisure)
#' }
NULL

