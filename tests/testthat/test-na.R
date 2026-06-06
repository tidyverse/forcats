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

test_that("does not add level when no NAs present (#347)", {
  f <- fct(c("a", "b", "c"))

  # With custom level
  expect_identical(fct_na_value_to_level(f, "x"), f)

  # With default level
  expect_identical(fct_na_value_to_level(f), f)
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
