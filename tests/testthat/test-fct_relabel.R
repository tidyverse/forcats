context("fct_relabel")

test_that("identity", {
  f1 <- factor(c("a", "b"))

  expect_identical(fct_relabel(f1, identity), f1)
})

test_that("error if level not character", {
  f1 <- factor(letters)

  expect_error(fct_relabel(f1, function(x) 1), "character")
})

test_that("total collapse", {
  f1 <- factor(letters)

  expect_identical(fct_relabel(f1, function(x) "1"), factor(rep("1", length(f1))))
})
