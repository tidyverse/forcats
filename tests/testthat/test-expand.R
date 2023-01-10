test_that("can add levels at any location", {
  x <- c("a", "b", "c")
  expect_equal(fct_expand(x, "d"), fct(x, c("a", "b", "c", "d")))
  expect_equal(fct_expand(x, "d", after = 0), fct(x, c("d", "a", "b", "c")))
})

test_that("doesn't repeat existing levels", {
  x <- c("a", "b", "c")
  expect_equal(fct_expand(x, "a", "b"), fct(x))
})

test_that("validates its inputs", {
  expect_snapshot(error = TRUE, {
    fct_expand("x", d = "d")
    fct_expand("x", after = "x")
  })
})
