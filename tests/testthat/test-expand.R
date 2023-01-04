test_that("can add levels at any location", {
  x <- c("a", "b", "c")
  expect_equal(fct_expand(x, "d"), fct(x, c("a", "b", "c", "d")))
  expect_equal(fct_expand(x, "d", after = 0), fct(x, c("d", "a", "b", "c")))
})

test_that("doesn't repeat existing levels", {
  x <- c("a", "b", "c")
  expect_equal(fct_expand(x, "a", "b"), fct(x))
})

test_that("dots must be unnamed", {
  f <- fct(c("a", "b", "c"))
  expect_snapshot(fct_expand(f, d = "d"), error = TRUE)
})
