context("fct_c")

test_that("uses tidy_dots", {
  fs <- list(factor("a"), factor("b"))
  fab <- factor(c("a", "b"))

  expect_equal(fct_c(!!!fs), fab)
  expect_equal(fct_c(fs[[1]], fs[[2]]), fab)
})

test_that("all inputs must be factors", {
  expect_error(fct_c("a"), "must be factors")
})

test_that("empty input yields empty factor", {
  expect_equal(fct_c(), factor())
})
