context("test-shuffle.R")

test_that("reproducibility shuffles", {
  set.seed(1014)

  f1 <- factor(c("a", "b"))
  f2 <- fct_shuffle(f1)

  expect_equal(levels(f2), c("a", "b"))
})
