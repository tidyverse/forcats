context("as_factor")

test_that("equivalent to fct_inorder", {
  x <- c("a", "z", "g")
  expect_equal(as_factor(x), fct_inorder(x))
})

test_that("supports NA (#89)", {
  x <- c("a", "z", "g", NA)
  expect_equal(as_factor(x), fct_inorder(x))
})
