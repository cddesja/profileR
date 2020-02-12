context("Check the CPA file")
library(profileR)
library(testthat)

test_that("is the object of type critpat?", {
    mod <- cpa(R ~ A + H + S + B, data = IPMMc)
    expect_(method(mod), "meow")
})
       

    




#testthat::test_that("errors", {
#    testthat::expect_error(
#          
#     "
#  )
  
#  testthat::expect_error(
#    report_p(2),
#    "p cannot be greater than 1"
#  )
})
