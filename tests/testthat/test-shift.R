context("test-shift.R")

test_that("can shift in either direction", {
  f1 <- factor(c("a", "b", "c"))

  f2_l <- fct_shift(f1, 1)
  expect_equal(levels(f2_l), c("b", "c", "a"))

  f2_r <- fct_shift(f1, -1)
  expect_equal(levels(f2_r), c("c", "a", "b"))
})

test_that("0 shift leaves unchanged", {
  f1 <- factor(c("a", "b", "c"))
  f2 <- fct_shift(f1, 0)

  expect_identical(f1, f2)
})
