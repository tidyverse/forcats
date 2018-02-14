context("test-count.R")

test_that("0 count for empty levels", {
  f <- factor(levels = c("a", "b"))
  out <- fct_count(f)

  expect_equal(out$n, c(0, 0))
})


test_that("counts NA even when not in levels", {
  f <- factor(c("a", "a", NA))
  out <- fct_count(f)

  expect_equal(out$n, c(2, 1))
})

test_that("sort = TRUE brings most frequent values to top", {
  f <- factor(c("a", "b", "b"))
  out <- fct_count(f, sort = TRUE)

  expect_equal(out$f, factor(c("b", "a"), levels = c("a", "b")))
})
