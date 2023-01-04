test_that("warns about unknown levels", {
  f1 <- factor(c("a", "b"))

  expect_snapshot(f2 <- fct_relevel(f1, "d"))
  expect_equal(levels(f2), levels(f1))
})

test_that("moves supplied levels to front", {
  f1 <- factor(c("a", "b", "c", "d"))

  f2 <- fct_relevel(f1, "c", "b")
  expect_equal(levels(f2), c("c", "b", "a", "d"))
})

test_that("can moves supplied levels to end", {
  f1 <- factor(c("a", "b", "c", "d"))

  f2 <- fct_relevel(f1, "a", "b", after = 2)
  f3 <- fct_relevel(f1, "a", "b", after = Inf)
  expect_equal(levels(f2), c("c", "d", "a", "b"))
  expect_equal(levels(f3), c("c", "d", "a", "b"))
})

test_that("can relevel with function ", {
  f1 <- fct_rev(factor(c("a", "b")))
  f2a <- fct_relevel(f1, rev)
  f2b <- fct_relevel(f1, ~ rev(.))

  expect_equal(levels(f2a), c("a", "b"))
  expect_equal(levels(f2b), c("a", "b"))
})

test_that("function must return character vector", {
  f <- factor(c("a", "b"))
  expect_error(fct_relevel(f, ~1), "character vector")
})

test_that("dots must be unnamed", {
  f <- fct(c("a", "b", "c"))
  expect_snapshot(fct_relevel(f, a = "b"), error = TRUE)
})
