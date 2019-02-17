context("test-reorder.R")

test_that("can reorder by 2d summary", {
  df <- tibble::tribble(
    ~g,  ~x,
    "a", 3,
    "a", 3,
    "b", 2,
    "b", 2,
    "b", 1
  )

  f1 <- fct_reorder(df$g, df$x)
  expect_equal(levels(f1), c("b", "a"))

  f2 <- fct_reorder(df$g, df$x, .desc = TRUE)
  expect_equal(levels(f2), c("a", "b"))
})

test_that("can reorder by 2d summary", {
  df <- tibble::tribble(
    ~g, ~x, ~y,
    "a", 1, 10,
    "a", 2, 5,
    "b", 1, 5,
    "b", 2, 10
  )

  f1 <- fct_reorder2(df$g, df$x, df$y)
  expect_equal(levels(f1), c("b", "a"))

  f2 <- fct_reorder(df$g, df$x, .desc = TRUE)
  expect_equal(levels(f2), c("a", "b"))
})

test_that("complains if summary doesn't return single value", {
  fun1 <- function(x, y) c(1, 2)
  fun2 <- function(x, y) integer()

  expect_error(fct_reorder("a", 1, fun1), "single value per group")
  expect_error(fct_reorder("a", 1, fun2), "single value per group")
  expect_error(fct_reorder2("a", 1, 2, fun1), "single value per group")
  expect_error(fct_reorder2("a", 1, 2, fun2), "single value per group")
})

test_that("fct_infreq respects missing values", {
  f <- factor(c("a", "b", "b", NA, NA, NA), exclude = FALSE)
  expect_equal(levels(fct_infreq(f)), c(NA, "b", "a"))
})

test_that("fct_inseq sorts in numeric order", {
  f <- factor(c("3", "1", "1", "2"))
  expect_equal(levels(fct_inseq(f)), c("1", "2", "3"))
})

test_that("fct_inseq gives error for non-numeric levels", {
  f <- factor(c("c", "a", "a", "b"))
  expect_error(levels(fct_inseq(f)), "level must be coercible to numeric")
})
