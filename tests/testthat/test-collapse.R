context("test-collapse.R")

test_that("can collapse multiple values", {
  f1 <- factor(letters[1:3])
  f2 <- fct_collapse(f1, x = c("a", "b"), y = "c")

  expect_equal(f2, factor(c("x", "x", "y")))
})

test_that("empty dots yields unchanged factor", {
  f1 <- factor(letters[1:3])
  f2 <- fct_collapse(f1)

  expect_identical(f1, f2)
})


test_that("can collapse missing levels", {
  f1 <- factor(c("x", NA), exclude = NULL)
  f2 <- fct_collapse(f1, y = NA_character_)

  expect_equal(f2, factor(c("x", "y")))
})

test_that("can collapse un-named levels to Other", {
  f1 <- factor(letters[1:3])
  f2 <- fct_collapse(f1, xy = c("a", "b"), group_other = TRUE)

  expect_equal(f2, factor(c("xy", "xy", "Other"), levels = c("xy", "Other")))
})

test_that("does not automatically collapse unnamed levels to Other", {
  f1 <- factor(letters[1:3])
  f2 <- fct_collapse(f1, xy = c("a", "b"))

  expect_equal(f2, factor(c("xy", "xy", "c"), levels = c("xy", "c")))
})
