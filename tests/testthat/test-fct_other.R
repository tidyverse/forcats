context("fct_other")

test_that("keeps levels in keep", {
  x1 <- factor(c("a", "b"))
  x2 <- fct_other(x1, keep = "a")

  expect_equal(levels(x2), c("a", "Other"))
})

test_that("drops levels in drop", {
  x1 <- factor(c("a", "b"))
  x2 <- fct_other(x1, drop = "a")

  # other always placed at end
  expect_equal(levels(x2), c("b", "Other"))
})

test_that("must supply exactly one of drop and keep", {
  f <- factor(c("a", "b"))

  expect_error(fct_other(f), "supply one of")
  expect_error(fct_other(f, keep = "a", drop = "a"), "supply one of")
})
