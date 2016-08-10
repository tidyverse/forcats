context("fct_relevel")

test_that("warns about unknown levels", {
  f1 <- factor(c("a", "b"))

  expect_warning(f2 <- fct_relevel(f1, "d"), "Unknown levels")
  expect_equal(levels(f2), levels(f1))
})

test_that("moves supplied levels to front", {
  f1 <- factor(c("a", "b", "c", "d"))

  f2 <- fct_relevel(f1, "c", "b")
  expect_equal(levels(f2), c("c", "b", "a", "d"))
})
