context("as_factor")

test_that("equivalent to fct_inorder", {
  x <- c("a", "z", "g")
  expect_equal(as_factor(x), fct_inorder(x))
})

test_that("leaves factors as is", {
  f1 <- factor(letters)
  f2 <- as_factor(f1)

  expect_identical(f1, f2)
})

test_that("supports NA (#89)", {
  x <- c("a", "z", "g", NA)
  expect_equal(as_factor(x), fct_inorder(x))
})
