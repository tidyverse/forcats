test_that("can turn a NA value into a NA level", {
  x <- c("a", "b", NA)
  f <- fct(x)
  expect_equal(fct_na_value_to_level(f), fct(x, x))
})

test_that("can turn a NA value into a custom level", {
  x <- c("a", "b", NA)
  f <- fct(x)
  expect_equal(
    fct_na_value_to_level(f, "MISSING"),
    fct(c("a", "b", "MISSING"))
  )
})

test_that("can turn a NA level into an NA value", {
  x <- c("a", "b", NA)
  f <- fct(x, x)

  expect_equal(fct_na_level_to_value(f), fct(x))
})

test_that("can turn custom levels into an NA value", {
  x <- c("a", "b", NA)
  f <- fct(x, x)

  expect_equal(
    fct_na_level_to_value(f, extra_levels = "a"),
    fct(c(NA, "b", NA), "b")
  )
})

test_that("checks input types", {
  f <- fct("a")
  expect_snapshot(error = TRUE, {
    fct_na_value_to_level(1)
    fct_na_value_to_level(f, level = 1)
    fct_na_level_to_value(1)
    fct_na_level_to_value(f, extra_levels = 1)
  })
})
