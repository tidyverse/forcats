test_that("ordered attribute removed", {
  f1 <- factor(c("a", NA), levels = c("a", "b"), ordered = TRUE)
  f2 <- fct_remove_ordered(f1)

  expect_identical(f2, factor(c("a", NA), levels = c("a", "b"), ordered = FALSE))
})

test_that("ordered attribute added", {
  f1 <- factor(c("a", NA), levels = c("a", "b"), ordered = FALSE)
  f2 <- fct_make_ordered(f1)

  expect_identical(f2, factor(c("a", NA), levels = c("a", "b"), ordered = TRUE))
})

