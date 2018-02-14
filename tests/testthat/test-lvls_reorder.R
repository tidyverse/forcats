context("lvls_reorder")

test_that("changes levels, not values", {
  f1 <- factor(c("a", "b"))
  f2 <- factor(c("a", "b"), levels = c("b", "a"))

  expect_equal(lvls_reorder(f1, 2:1), f2)
})

test_that("idx must be numeric", {
  f <- factor(c("a", "b"))
  expect_error(lvls_reorder(f, "a"), "must be numeric")
})

test_that("must have one integer per level", {
  f <- factor(c("a", "b", "c"))

  expect_error(lvls_reorder(f, c(1, 2)), "one integer for each level")
  expect_error(lvls_reorder(f, c(1, 2, 2)), "one integer for each level")
  expect_error(lvls_reorder(f, c(1, 2.5)), "one integer for each level")
})

test_that("can change ordered status of output", {
  f1 <- factor(letters[1:3])
  f2 <- ordered(f1)

  expect_equal(is.ordered(lvls_reorder(f1, 1:3)), FALSE)
  expect_equal(is.ordered(lvls_reorder(f1, 1:3, ordered = FALSE)), FALSE)
  expect_equal(is.ordered(lvls_reorder(f1, 1:3, ordered = TRUE)), TRUE)

  expect_equal(is.ordered(lvls_reorder(f2, 1:3)), TRUE)
  expect_equal(is.ordered(lvls_reorder(f2, 1:3, ordered = FALSE)), FALSE)
  expect_equal(is.ordered(lvls_reorder(f2, 1:3, ordered = TRUE)), TRUE)
})
