test_that("includes missing values", {
  x <- factor(c(NA, "x"))
  expect_equal(fct_unique(x), fct(c("x", NA)))
})

test_that("preserves position of implicit NAs", {
  x <- fct(c(NA, "x"), levels = c(NA, "x"))
  expect_equal(fct_unique(x), x)
})
