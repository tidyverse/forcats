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

test_that("allows summary other than a single number", {
  fun1 <- function(x, y) c(1, 2)
  fun2 <- function(x, y) "a"

  # This works because a single value is always sorted.
  expect_equal(fct_reorder("a", 1, fun1), factor("a"))
  expect_equal(fct_reorder("a", 1, fun2), factor("a"))
  expect_equal(fct_reorder2("a", 1, 2, fun1), factor("a"))
  expect_equal(fct_reorder2("a", 1, 2, fun2), factor("a"))
  
  expect_error(fct_reorder(c("a", "b"), 1:2, fun1), "comparable")
  expect_error(fct_reorder2(c("a", "b"), 1:2, 1:2, fun1), "comparable")
  
  expect_equal(fct_reorder(c("a", "b"), 1:2, fun2), factor(c("a", "b")))
  expect_equal(fct_reorder2(c("a", "b"), 1:2, 1:2, fun2), factor(c("a", "b")))
  
  # Test more complex types
  expect_equal(
    fct_reorder(
      c("a", "b"),
      as.Date(0:1, origin="2019-01-01"),
      min
    ),
    factor(c("a", "b"))
  )
  expect_equal(
    fct_reorder(
      c("a", "b"),
      as.Date(1:0, origin="2019-01-01"),
      min
    ),
    factor(c("a", "b"), levels = c("b", "a"))
  )

  expect_equal(
    fct_reorder2(
      c("a", "b"),
      as.Date(0:1, origin="2019-01-01"),
      1:2,
      paste
    ),
    factor(c("a", "b"), levels = c("b", "a"))
  )
  expect_equal(
    fct_reorder2(
      c("a", "b"),
      as.Date(0:1, origin="2019-01-01"),
      1:2,
      paste,
      .desc = FALSE),
    factor(c("a", "b"), levels = c("a", "b"))
  )
})

test_that("fct_infreq respects missing values", {
  f <- factor(c("a", "b", "b", NA, NA, NA), exclude = FALSE)
  expect_equal(levels(fct_infreq(f)), c(NA, "b", "a"))
})
