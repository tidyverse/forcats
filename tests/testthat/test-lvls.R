context("lvls")

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

test_that("can collapse values", {
  f1 <- factor(c("a", "b"))
  f2 <- factor(c("a", "a"))

  expect_equal(lvls_revalue(f1, c("a", "a")), f2)
})

test_that("preserves missing values", {
  f1 <- factor(c("a", NA), exclude = NULL)
  f2 <- lvls_revalue(f1, levels(f1))
  expect_equal(levels(f2), levels(f1))
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
