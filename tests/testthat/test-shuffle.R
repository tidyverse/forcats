test_that("reproducibility shuffles", {
  set.seed(1014)

  f1 <- factor(c("a", "b"))
  f2 <- fct_shuffle(f1)

  expect_equal(levels(f2), c("a", "b"))
})

test_that("NA values are preserved", {
  set.seed(42)

  f <- factor(c("a", NA, "b", NA))
  out <- fct_shuffle(f)

  expect_equal(sum(is.na(out)), 2)
  expect_equal(sort(as.character(out[!is.na(out)])), c("a", "b"))
})

test_that("empty factor returns empty factor", {
  f <- factor(levels = c("a", "b"))
  out <- fct_shuffle(f)

  expect_length(out, 0)
  expect_equal(levels(out), c("a", "b"))
})

test_that("single level factor is unchanged", {
  set.seed(123)

  f <- factor(c("a", "a", "a"))
  out <- fct_shuffle(f)

  expect_identical(f, out)
})

test_that("unused levels are preserved", {
  set.seed(42)

  f <- factor("a", levels = c("a", "b", "c"))
  out <- fct_shuffle(f)

  expect_equal(sort(levels(out)), c("a", "b", "c"))
  expect_length(out, 1)
})

test_that("ordered class is preserved", {
  set.seed(42)

  f <- ordered(c("a", "b", "c"))
  out <- fct_shuffle(f)

  expect_s3_class(out, "ordered")
  expect_setequal(levels(out), c("a", "b", "c"))
})
