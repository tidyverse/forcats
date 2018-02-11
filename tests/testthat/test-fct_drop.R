context("fct_drop")

test_that("doesn't add NA level", {
  f1 <- factor(c("a", NA), levels = c("a", "b"))
  f2 <- fct_drop(f1)

  expect_equal(levels(f2), "a")
})

test_that("can optionally restrict levels to drop", {
  f1 <- factor("a", levels = c("a", "b", "c"))

  expect_equal(levels(fct_drop(f1, only = "b")), c("a", "c"))
  expect_equal(levels(fct_drop(f1, only = "a")), c("a", "b", "c"))
})

test_that("preserves ordered class and attributes", {
  f1 <- ordered(letters[1:2], letters[1:3])
  attr(f1, "x") <- "test"

  f2 <- fct_drop(f1)
  expect_s3_class(f2, "ordered")
  expect_equal(attr(f2, "x"), attr(f1, "x"))
})
