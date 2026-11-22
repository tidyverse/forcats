# lvls_expand -------------------------------------------------------------

test_that("changes levels, not values", {
  f1 <- factor(c("a"))
  f2 <- factor(c("a"), levels = c("a", "b"))

  expect_equal(lvls_expand(f1, c("a", "b")), f2)
})

test_that("must include all existing levels", {
  f1 <- factor(c("a", "b"))

  expect_snapshot(error = TRUE, {
    lvls_expand(f1, c("a", "c"))
  })
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

test_that("`new_levels` must checks its inputs", {
  f1 <- factor(c("a", "b"))

  expect_snapshot(error = TRUE, {
    lvls_revalue(f1, 1:5)
    lvls_revalue(f1, c("a", "b", "c"))
  })
})

# lvls_reorder ------------------------------------------------------------

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

# refactor ------------------------------------------------------------

test_that("preserves attributes", {
  f1 <- factor(letters[1:3])
  attr(f1, "foo") <- "bar"

  f2 <- refactor(f1, letters[1:4])

  expect_equal(attr(f1, "foo"), attr(f2, "foo"))
})

test_that("preserves s3 subclasses", {
  f1 <- structure(1:3, levels = c("a", "b", "c"), class = c("foo", "factor"))
  f2 <- refactor(f1, letters[1:4])
  expect_equal(class(f1), class(f2))
})

test_that("preserves s3 subclasses when toggling ordered", {
  f1 <- structure(1:3, levels = c("a", "b", "c"), class = c("foo", "factor"))
  f2 <- refactor(f1, letters[1:4], ordered = TRUE)
  expect_equal(class(f2), c("foo", "ordered", "factor"))

  f3 <- refactor(f2, letters[1:3], ordered = FALSE)
  expect_equal(class(f3), c("foo", "factor"))
})
