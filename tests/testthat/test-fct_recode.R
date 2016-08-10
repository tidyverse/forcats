context("fct_recode")

test_that("warns about unknown levels", {
  f1 <- factor(c("a", "b"))

  expect_warning(f2 <- fct_recode(f1, d = "e"), "Unknown levels")
  expect_equal(levels(f2), levels(f1))
})

test_that("can collapse levels", {
  f1 <- factor(c("a1", "a2", "b1", "b2"))
  f2 <- factor(c("a", "a", "b", "b"))

  expect_equal(fct_recode(f1, a = "a1", a = "a2", b = "b1", b = "b2"), f2)
})
