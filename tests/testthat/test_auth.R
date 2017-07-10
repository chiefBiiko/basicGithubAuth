# test auth.R

testthat::context('authentication')

testthat::test_that('no false positive', {
  
  # returns status code 
  testthat::expect_type(authenticate('chiefBiiko', 'xxxxx'),
                        'integer')
  
  # unauthorized
  testthat::expect_true(authenticate('chiefBiiko', 'xxxxx') >= 400L)

})