context("test-rev.R")

test_that("reverses levels", {
  f1 <- factor(c("a", "b", "a"))
  f2 <- fct_rev(f1)

  expect_equal(levels(f2), c("b", "a"))
})
