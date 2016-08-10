context("fct_collapse")

test_that("positive values keeps most commmon", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")

  expect_equal(levels(fct_collapse(f, n = 1)), c("a", "Other"))
  expect_equal(levels(fct_collapse(f, n = 2)), c("a", "b", "Other"))

  expect_equal(levels(fct_collapse(f, prop = 0.25)), c("a", "Other"))
  expect_equal(levels(fct_collapse(f, prop = 0.15)), c("a", "b", "Other"))
})

test_that("ties are respected", {
  f <- c("a", "a", "a", "b", "b", "b", "c")
  expect_equal(levels(fct_collapse(f, 1)), c("a", "b", "Other"))
})

test_that("negative values drop most common" ,{
  f <- c("a", "a", "a", "a", "b", "b", "b", "b", "c", "d")
  expect_equal(levels(fct_collapse(f, n = -1)), c("Other", "c", "d"))
  expect_equal(levels(fct_collapse(f, prop = -0.2)), c("Other", "c", "d"))
})
