test_that("can turn a NA value into a NA level", {
  x <- c("a", "b", NA)
  f <- fct(x)
  expect_equal(fct_na_value_to_level(f), fct(x, x))
})

test_that("can turn a NA level into an NA value", {
  x <- c("a", "b", NA)
  f <- fct(x, x)

  expect_equal(fct_na_level_to_value(f), fct(x))
})
