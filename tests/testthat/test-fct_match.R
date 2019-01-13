context("test-fct_match.R")

test_that("correct matching as expected", {
  f <- factor(c("a", "b", "c d"), levels = c("a", "b", "c d", "e"))

  expect_equal(fct_match(f, c("a", "b")), c(TRUE, TRUE, FALSE))
  expect_error(fct_match(f, c("a", "x")), 'not present.*"x"')
  expect_equal(fct_match(f, c("a", "c d")), c(TRUE, FALSE, TRUE))
  expect_equal(fct_match(f, c("a", "e")), c(TRUE, FALSE, FALSE))
  expect_error(fct_match(f, c("a", "e"), allow_missing = FALSE), 'not present.*"e"')
  expect_equal(!fct_match(f, c("a", "b")), c(FALSE, FALSE, TRUE))
})

test_that("factor is actually a character vector", {
  fc <- as.character(factor(c("a", "b", "c d"), levels = c("a", "b", "c d", "e")))

  expect_equal(fct_match(fc, c("a", "b")), c(TRUE, TRUE, FALSE))
  expect_error(fct_match(fc, c("a", "x")), regexp = 'not present.*"x"')
  expect_equal(fct_match(fc, c("a", "c d")), c(TRUE, FALSE, TRUE))
  expect_error(fct_match(fc, c("a", "e")), 'not present.*"e"') ## differs from above
  expect_error(fct_match(fc, c("a", "e"), allow_missing = FALSE), 'not present.*"e"')
  expect_equal(!fct_match(fc, c("a", "b")), c(FALSE, FALSE, TRUE))
})
