context("lvls")

# lvls_reorder ------------------------------------------------------------

test_that("changes levels, not values", {
  f1 <- factor(c("a", "b"))
  f2 <- factor(c("a", "b"), levels = c("b", "a"))

  expect_equal(lvls_reorder(f1, 2:1), f2)
})

test_that("must have one integer per level", {
  f <- factor(c("a", "b", "c"))

  expect_error(lvls_reorder(f, c(1, 2)), "one integer for each level")
  expect_error(lvls_reorder(f, c(1, 2, 2)), "one integer for each level")
  expect_error(lvls_reorder(f, c(1, 2.5)), "one integer for each level")
})

# lvls_expand -------------------------------------------------------------

test_that("changes levels, not values", {
  f1 <- factor(c("a"))
  f2 <- factor(c("a"), levels = c("a", "b"))

  expect_equal(lvls_expand(f1, c("a", "b")), f2)
})

test_that("must include all existing levels", {
  f1 <- factor(c("a", "b"))

  expect_error(lvls_expand(f1, c("a", "c")), "include all existing levels")
})

# lvls_revalue ------------------------------------------------------------

test_that("changes values and levels", {
  f1 <- factor(c("a", "b"))
  f2 <- factor(c("b", "a"), levels = c("b", "a"))

  expect_equal(lvls_revalue(f1, c("b", "a")), f2)
})

test_that("`new_levels` must be a character", {
  f1 <- factor(c("a", "b"))
  expect_error(lvls_revalue(f1, 1:5), "character vector")
})

test_that("`new_levels` must be same length as existing levels", {
  f1 <- factor(c("a", "b"))

  expect_error(lvls_revalue(f1, c("a")), "same length")
  expect_error(lvls_revalue(f1, c("a", "b", "c")), "same length")
})
