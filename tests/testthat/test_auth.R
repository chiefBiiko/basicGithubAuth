# test auth.R

testthat::context('authentication')

testthat::test_that('no false positive', {
  
  # returns status code 
  testthat::expect_type(authenticate('chiefBiiko', 'xxxxx'),
                        'integer')
  
  # plus status message
  testthat::expect_type(attr(authenticate('chiefBiiko', 'xxxxx'), 'message'),
                        'character')
  
  # unauthorized
  testthat::expect_true(authenticate('chiefBiiko', 'xxxxx') >= 400L)

})