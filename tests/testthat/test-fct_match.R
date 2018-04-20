context("test-fct_match.R")

test_that("correct matching as expected", {
  f <- factor(c("a", "b", "c d"), levels = c("a", "b", "c d", "e"))

  expect_equal(fct_match(f, "a", "b"), c(TRUE, TRUE, FALSE))
  expect_error(fct_match(f, "a", "x"), regexp = 'not present.*"x"')
  expect_equal(fct_match(f, "a", "c d"), c(TRUE, FALSE, TRUE))
  expect_equal(fct_match(f, "a", "e"), c(TRUE, FALSE, FALSE))
  expect_error(fct_match(f, "a", "e", allow_missing = FALSE), 'not present.*"e"')
  expect_equal(fct_match(f, "a", "b", inverse = TRUE), c(FALSE, FALSE, TRUE))
  expect_equal(fct_exclude(f, "a", "b"), c(FALSE, FALSE, TRUE))
})

test_that("factor is actually a character vector", {
  fc <- as.character(factor(c("a", "b", "c d"), levels = c("a", "b", "c d", "e")))

  expect_equal(fct_match(fc, "a", "b"), c(TRUE, TRUE, FALSE))
  expect_error(fct_match(fc, "a", "x"), regexp = 'not present.*"x"')
  expect_equal(fct_match(fc, "a", "c d"), c(TRUE, FALSE, TRUE))
  expect_error(fct_match(fc, "a", "e"), regexp = 'not present.*"e"') ## differs from above
  expect_error(fct_match(fc, "a", "e", allow_missing = FALSE), 'not present.*"e"')
  expect_equal(fct_match(fc, "a", "b", inverse = TRUE), c(FALSE, FALSE, TRUE))
  expect_equal(fct_exclude(fc, "a", "b"), c(FALSE, FALSE, TRUE))
})
