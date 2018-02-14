context("test-anon.R")

test_that("new levels are padded numerics", {
  f1 <- factor(letters[1:10])
  f2 <- fct_anon(f1)

  expect_equal(levels(f2), sprintf("%02d", 1:10))
})

test_that("prefix added to start of level", {
  f1 <- factor("x")
  f2 <- fct_anon(f1, prefix = "X")

  expect_equal(levels(f2), "X1")
})
