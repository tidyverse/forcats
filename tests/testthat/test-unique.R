test_that("includes implicit missing values", {
  x <- factor(c(NA, "x"))
  expect_equal(fct_unique(x), fct(c("x", NA)))
})

test_that("preserve position of explicit NA levels", {
  x <- fct(c(NA, "x"), levels = c(NA, "x"))
  expect_equal(fct_unique(x), x)
})

test_that("preserve mix of implicit and explicit NA", {
  f <- structure(
    c(2, 1, NA, 1, 2, NA),
    levels = c("x", NA),
    class = "factor"
  )

  expect_equal(
    fct_unique(f),
    structure(c(1, 2, NA), levels = c("x", NA), class ="factor")
  )
})
