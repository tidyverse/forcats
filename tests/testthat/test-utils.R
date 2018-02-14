context("test-utils.R")

test_that("check_factor() fails when needed", {
  expect_error(check_factor(1), "factor")
})

test_that("check_factor_list() fails when needed", {
  expect_error(check_factor_list(1), "list")
  expect_error(check_factor_list(list(1)), "factor")
})
