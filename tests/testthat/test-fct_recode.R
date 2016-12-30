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

test_that("can recode multiple levels to NA", {
  f1 <- factor(c("a1", "empty", "a2", "b", "missing"))
  f2 <- factor(c("a", NA, "a", "b", NA))

  expect_equal(fct_recode(f1, NULL = "missing", NULL = "empty", a = "a1", a = "a2"), f2)
})

test_that("can just remove levels", {
  f1 <- factor(c("a", "missing"))
  f2 <- factor(c("a", NA))

  expect_equal(fct_recode(f1, NULL = "missing"), f2)
})


# check_recode_levels -----------------------------------------------------

test_that("new levels must be character", {
  expect_error(check_recode_levels(a = 1), "Problems at positions: 1")
})

test_that("new levels must be length 1", {
  expect_error(check_recode_levels(a = c("a", "b")), "Problems at positions: 1")
})
