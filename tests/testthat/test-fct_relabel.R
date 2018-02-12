context("fct_relabel")

test_that("identity", {
  f1 <- factor(c("a", "b"))

  expect_identical(fct_relabel(f1, identity), f1)
})

test_that("error if not function", {
  f1 <- factor("a")

  expect_error(fct_relabel(f1, 1), "function")
})

test_that("error if level not character", {
  f1 <- factor("a")

  expect_error(fct_relabel(f1, function(x) 1), "character")
})

test_that("error if level has different length", {
  f1 <- factor(letters)

  expect_error(fct_relabel(f1, function(x) x[-1]), "expected 26.*got 25")
})

test_that("total collapse", {
  f1 <- factor(letters)
  new_levels <- function(x) rep("1", length(x))

  expect_identical(fct_relabel(f1, new_levels), factor(new_levels(letters)))
})

test_that("additional arguments", {
  f1 <- factor(letters)

  expect_identical(fct_relabel(f1, paste0, "."), factor(paste0(letters, ".")))
})

test_that("formulas are coerced to functions", {
  f1 <- factor(letters)

  expect_identical(
    fct_relabel(f1, ~paste0(.x, ".")),
    factor(paste0(letters, "."))
  )
})
