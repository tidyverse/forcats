test_that("reverses levels", {
  f1 <- factor(c("a", "b", "a"))
  f2 <- fct_rev(f1)

  expect_equal(levels(f2), c("b", "a"))
})

test_that("preserves NA values in data", {
  f1 <- factor(c("a", "b", NA, "c"))
  f2 <- fct_rev(f1)

  expect_equal(levels(f2), c("c", "b", "a"))
  expect_equal(which(is.na(f2)), 3L)
})

test_that("empty factor returns empty factor", {
  f1 <- factor(character())
  f2 <- fct_rev(f1)

  expect_equal(levels(f2), character())
  expect_length(f2, 0)
})

test_that("single level is unchanged", {
  f1 <- factor(c("a", "a"))
  f2 <- fct_rev(f1)

  expect_equal(levels(f2), "a")
})

test_that("preserves unused levels", {
  f1 <- factor("a", levels = c("a", "b", "c"))
  f2 <- fct_rev(f1)

  expect_equal(levels(f2), c("c", "b", "a"))
  expect_equal(as.character(f2), "a")
})

test_that("preserves ordered class", {
  f1 <- ordered(c("a", "b", "c"), levels = c("a", "b", "c"))
  f2 <- fct_rev(f1)

  expect_s3_class(f2, "ordered")
  expect_equal(levels(f2), c("c", "b", "a"))
})
