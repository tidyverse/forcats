context("fct_reorder")

test_that("reorders levels by group summary", {
  df <- tibble::frame_data(
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

test_that("complains if summary doesn't return single number", {
  fun1 <- function(x, y) c(1, 2)
  fun2 <- function(x, y) "a"

  expect_error(fct_reorder("a", 1, fun1), "single number per group")
  expect_error(fct_reorder("a", 1, fun2), "single number per group")
  expect_error(fct_reorder2("a", 1, 2, fun1), "single number per group")
  expect_error(fct_reorder2("a", 1, 2, fun2), "single number per group")
})
