context("fct_lump")

test_that("positive values keeps most commmon", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")

  expect_equal(levels(fct_lump(f, n = 1)), c("a", "Other"))
  expect_equal(levels(fct_lump(f, n = 2)), c("a", "b", "Other"))

  expect_equal(levels(fct_lump(f, prop = 0.25)), c("a", "Other"))
  expect_equal(levels(fct_lump(f, prop = 0.15)), c("a", "b", "Other"))
})

test_that("ties are respected", {
  f <- c("a", "a", "a", "b", "b", "b", "c")
  expect_equal(levels(fct_lump(f, 1)), c("a", "b", "Other"))
})

test_that("negative values drop most common" ,{
  f <- c("a", "a", "a", "a", "b", "b", "b", "b", "c", "d")
  expect_equal(levels(fct_lump(f, n = -1)), c("c", "d", "Other"))
  expect_equal(levels(fct_lump(f, prop = -0.2)), c("c", "d", "Other"))
})

test_that("return original factor when all element satisfy n / p condition", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")

  expect_equal(levels(fct_lump(f, n = 4)), c("a", "b", "c", "d", "e", "f", "g"))
  expect_equal(levels(fct_lump(f, n = 10)), c("a", "b", "c", "d", "e", "f", "g"))
  expect_equal(levels(fct_lump(f, n = -10)), c("a", "b", "c", "d", "e", "f", "g"))

  expect_equal(levels(fct_lump(f, prop = 0.01)), c("a", "b", "c", "d", "e", "f", "g"))
  expect_equal(levels(fct_lump(f, prop = -1)), c("a", "b", "c", "d", "e", "f", "g"))
})

test_that("different behaviour when apply tie function", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")

  expect_equal(levels(fct_lump(f, n = 4, ties.method = "min")),
               c("a", "b", "c", "d", "e", "f", "g"))
  expect_equal(levels(fct_lump(f, n = 4, ties.method = "max")),
               c("a", "b", "Other" ))

  # Rank of c, d, e, f, g is (3+4+5+6+7)/5 = 5
  expect_equal(levels(fct_lump(f, n = 4, ties.method = "average")),
               c("a", "b", "Other" ))
  expect_equal(levels(fct_lump(f, n = 5, ties.method = "average")),
               c("a", "b", "c", "d", "e", "f", "g"))

  expect_equal(levels(fct_lump(f, n = 4, ties.method = "first")),
               c("a", "b", "c", "d", "Other"))

  if (getRversion() >= "3.3.0") {
    expect_equal(levels(fct_lump(f, n = 4, ties.method = "last")),
                 c("a", "b", "f", "g", "Other"))
  }
})

# Default -----------------------------------------------------------------

test_that("lumps smallest", {
  expect_equal(lump_test(c(1, 2, 3, 6)), "Xbcd")
  expect_equal(lump_test(c(1, 2, 3, 7)), "XXXd")

  expect_equal(lump_test(c(1, 2, 3, 7, 13)), "XXXde")
  expect_equal(lump_test(c(1, 2, 3, 7, 14)), "XXXXe")
})

test_that("doesn't lump if none small enough", {
  expect_equal(lump_test(c(2, 2, 4)), "abc")
})

test_that("order doesn't matter", {
  expect_equal(lump_test(c(2, 2, 5)), "XXc")
  expect_equal(lump_test(c(2, 5, 2)), "XbX")
  expect_equal(lump_test(c(5, 2, 2)), "aXX")
})
