test_that("includes implicit missing values", {
  x <- factor(c(NA, "x"))
  expect_equal(fct_unique(x), fct(c("x", NA)))
})

test_that("preserve position of explicit NA levels", {
  x <- fct(c(NA, "x"), levels = c(NA, "x"))
  expect_equal(fct_unique(x), x)
})

test_that("preserve mix of implicit and explicit NA (#328)", {
  # Possible to create with factor(exclude = NULL) + is.na(), but directly
  # specifying makes it a little easier to see what's happening.
  f <- structure(
    c(2L, 1L, NA, 1L, 2L, NA),
    levels = c("x", NA),
    class = "factor"
  )

  expect_equal(
    fct_unique(f),
    structure(c(1L, 2L, NA), levels = c("x", NA), class = "factor")
  )
})
