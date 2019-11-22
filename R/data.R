#' Baccalaureate and Beyond Longitudinal Study 2000
#'
#' Simulated data based on the Baccalaureate and Beyond Longitudinal Study 2000/2001 based on the values presented in Tables 1 and 2 in Davison & Davenport (unpublished).
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 1080 rows and 4 variables:
#' \describe{
#'   \item{stem}{Are you a STEM major? 1: yes; 0: no}
#'   \item{major}{College major}
#'   \item{gpa}{GPA}
#'   \item{satq}{SAT quantitative}
#'   \item{satv}{SAT verbal}
#' }
#' @source \url{https://nces.ed.gov/pubsearch/pubsinfo.asp?pubid=2003174}
"bacc2001"

#' Fabricated cognitive, personality, and vocational interest inventory
#'
#' The data come from a fabricated cognitive, personality, and vocational interested inventory. This data set can be used to demonstrate regression and structural equation modeling.
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 250 rows and 33 variables:
#' \describe{
#'  \item{gender}{1 is female and 2 is male}
#'  \item{educ}{Years of education}
#'  \item{age}{Age, in years}
#'  \item{vocab}{Vocabulary test}
#'  \item{reading}{Reading comprehension}
#'  \item{sentcomp}{Sentence completion}
#'  \item{mathmtcs}{Mathematics}
#'  \item{geometry}{Geometry}
#'  \item{analyrea}{Analytical reasoning}
#'  \item{socdom}{Social dominance}
#'  \item{sociabty}{Sociability}
#'  \item{stress}{Stress reaction}
#'  \item{worry}{Worry scale}
#'  \item{impulsve}{Impulsivity}
#'  \item{thrillsk}{Thrill-seeking}
#'  \item{carpentr}{Carpentry}
#'  \item{forestr}{Forest ranger}
#'  \item{morticin}{Mortician}
#'  \item{policemn}{Police}
#'  \item{fireman}{Fireman}
#'  \item{salesrep}{Sales representative}
#'  \item{teacher}{Teacher}
#'  \item{busexec}{Business executive}
#'  \item{stockbrk}{Stock broker}
#'  \item{artist}{Artist}
#'  \item{socworkr}{Social worker}
#'  \item{truckdvr}{Truck driver}
#'  \item{doctor}{Doctor}
#'  \item{clergymn}{Clergyman}
#'  \item{lawyer}{Lawyer}
#'  \item{actor}{Actor}
#'  \item{archtct}{Architect}
#'  \item{landscpr}{Landscaper}
#' }
#' @source \url{http://psych.colorado.edu/~carey/Courses/PSYC7291/ClassDataSets.htm}
"interest"

#' Hypothetical Executive Functioning Assessment
#'
#' The executive function assessement consists of 10 items measured on 30 student participants. The data were randomly generated to demonstrate various psychometric models (e.g., CTT, a one-facet G-study)
#'
#' @docType data
#' @keywords dataset
#' @format A data frame in long-format with 30 participants' responses to 10 items.
#'  \describe{
#' \item{Participants}{The participant ID.}
#' \item{Items}{The item ID.}
#' \item{Score}{A participant's score on a particular item.}
#' }
"efData"

#' Hypothetical writing prompt example
#'
#' This is a hypothetical data set to demonstrate a two facet cross design for generalizability theory. The design is an S X W X R design, a student by writing prompt by rater design. See chapter 3 of "Using R for Educational and Psychological Measurement" for more details.
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 100 rows and 4 variables:
#' \describe{
#'   \item{student}{The student identifier}
#'   \item{prompt}{The writing prompt identifier. There were five prompts}
#'   \item{rater}{The rater identifier. There were two raters.}
#'   \item{score}{Student score on the writing prompt. Ranged from 4 - 100, with a maximum score of 100.}
#' }
#' @source Desjardins, C. D. & Bulut, O. (2017). Using R for Educational and Psychological Measurement.
#' @examples
#' library(lme4)
#' two.facet <- lmer(scores ~ (1 | students) + (1  | prompts) + (1 | raters) + (1 | students:prompts) +  (1 | students:raters) + (1 | prompts:raters), data = writing)
#' gstudy(two.facet)
"writing"

#' Second hypothetical writing prompt example
#'
#' This is a hypothetical data set to demonstrate a partially nested two-facet design for generalizability theory. In this design, the raters are nested within students, W X (S:R). See chapter 3 of "Using R for Educational and Psychological Measurement" for more details.
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 100 rows and 4 variables:
#' \describe{
#'   \item{student}{The student identifier}
#'   \item{prompt}{The writing prompt identifier. There were five prompts}
#'   \item{rater}{The rater identifier. There were two raters.}
#'   \item{score}{Student score on the writing prompt. Ranged from 4 - 100, with a maximum score of 100.}
#' }
#' @source Desjardins, C. D. & Bulut, O. (2017). Using R for Educational and Psychological Measurement.
#' @examples
#' library(lme4)
#' nested.design <- lmer(scores ~ (1 | students/raters) + (1 | prompts) + (1 | students:prompts), data = writing2)
#' gstudy(nested.design)
"writing2"