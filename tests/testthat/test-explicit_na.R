test_that("factor unchanged if no missing levels", {
  withr::local_options(lifecycle_verbosity = "quiet")

  f1 <- factor(letters[1:3])
  f2 <- fct_explicit_na(f1)

  expect_identical(f1, f2)
})

test_that("converts implicit NA", {
  withr::local_options(lifecycle_verbosity = "quiet")

  f1 <- factor(c("a", NA))
  f2 <- fct_explicit_na(f1)

  expect_equal(f2, fct_inorder(c("a", "(Missing)")))
})

test_that("converts explicit NA", {
  withr::local_options(lifecycle_verbosity = "quiet")

  f1 <- factor(c("a", NA), exclude = NULL)
  f2 <- fct_explicit_na(f1)

  expect_equal(f2, fct_inorder(c("a", "(Missing)")))
})

test_that("fct_explicit_na is deprecated", {
  expect_snapshot({
    . <- fct_explicit_na(factor())
  })
})
