# common behaviour ---------------------------------------------------------

test_that("can use other_level = NA", {
  f <- fct(c("a", "a", "a", "a", "b"))
  expect_equal(levels(fct_lump_lowfreq(f, other_level = NA)), c("a", NA))
  expect_equal(levels(fct_lump_n(f, n = 1, other_level = NA)), c("a", NA))
  expect_equal(
    levels(fct_lump_prop(f, prop = .2, other_level = NA)),
    c("a", NA)
  )
  expect_equal(levels(fct_lump_min(f, 2, other_level = NA)), c("a", NA))
})

test_that("bad weights generates friendly error messages", {
  expect_snapshot(error = TRUE, {
    fct_lump(letters, w = letters)
    fct_lump(letters, w = 1:10)
    fct_lump(letters, w = c(-1, rep(1, 24), -1))
  })
})

# fct_lump() ----------------------------------------------------------------

test_that("can only supply one of n and prop", {
  f <- c("a", "b", "c")
  expect_snapshot(fct_lump(f, n = 1, prop = 0.1), error = TRUE)
})

# fct_lump_min ------------------------------------------------------------

test_that("fct_lump_min works when not weighted", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")

  expect_equal(levels(fct_lump_min(f, min = 3)), c("a", "Other"))
  expect_equal(levels(fct_lump_min(f, min = 2)), c("a", "b", "Other"))
})

test_that("fct_lump_min works when weighted", {
  f <- c("a", "b", "c", "d", "e")
  w <- c(0.2, 2, 6, 4, 1)

  expect_equal(levels(fct_lump_min(f, min = 6, w = w)), c("c", "Other"))
  expect_equal(
    levels(fct_lump_min(f, min = 1.5, w = w)),
    c("b", "c", "d", "Other")
  )
})

test_that("checks inputs", {
  expect_snapshot(error = TRUE, {
    fct_lump_min(1:3)
    fct_lump_min(factor(), min = "x")
  })
})

# fct_lump_n() ------------------------------------------------------------

test_that("can keep/drop with positive/negative values", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")
  expect_equal(levels(fct_lump_n(f, n = 1)), c("a", "Other"))
  expect_equal(levels(fct_lump_n(f, n = 2)), c("a", "b", "Other"))

  f <- c("a", "a", "a", "a", "b", "b", "b", "b", "c", "d")
  expect_equal(levels(fct_lump_n(f, n = -1)), c("c", "d", "Other"))
})

test_that("ties are respected and can be controled", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")
  expect_equal(levels(fct_lump_n(f, 2)), c("a", "b", "Other"))

  expect_equal(
    levels(fct_lump_n(f, n = 4, ties.method = "min")),
    c("a", "b", "c", "d", "e", "f", "g")
  )
  expect_equal(
    levels(fct_lump_n(f, n = 4, ties.method = "max")),
    c("a", "b", "Other")
  )
})

test_that("idempotent if all element satisfies condition", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")
  expect_equal(
    levels(fct_lump_n(f, n = 10)),
    c("a", "b", "c", "d", "e", "f", "g")
  )
  expect_equal(
    levels(fct_lump_n(f, n = -10)),
    c("a", "b", "c", "d", "e", "f", "g")
  )
})

test_that("can supply weights", {
  f <- c("a", "b", "c", "d", "e")
  w <- c(0.2, 2, 6, 4, 1)

  expect_equal(levels(fct_lump_n(f, n = 2, w = w)), c("c", "d", "Other"))
  expect_equal(levels(fct_lump_n(f, n = 3, w = w)), c("b", "c", "d", "Other"))
})

test_that("checks inputs", {
  expect_snapshot(error = TRUE, {
    fct_lump_n(1:3)
    fct_lump_n(factor(), n = "x")
  })
})

# fct_lump_prop -----------------------------------------------------------

test_that("positive/negative prop keeps/drops most commmon", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")
  expect_equal(levels(fct_lump_prop(f, prop = 0.25)), c("a", "Other"))
  expect_equal(levels(fct_lump_prop(f, prop = 0.15)), c("a", "b", "Other"))

  f <- c("a", "a", "a", "a", "b", "b", "b", "b", "c", "d")
  expect_equal(levels(fct_lump(f, n = -1)), c("c", "d", "Other"))
  expect_equal(levels(fct_lump(f, prop = -0.2)), c("c", "d", "Other"))
})

test_that("can use weights", {
  f <- c("a", "b", "c", "d", "e")
  w <- c(0.2, 2, 6, 4, 1)

  expect_equal(
    levels(fct_lump_prop(f, prop = 0.3, w = w)),
    c("c", "d", "Other")
  )
  expect_equal(
    levels(fct_lump_prop(f, prop = 0.2, w = w)),
    c("c", "d", "Other")
  )
})

test_that("can use weights with empty levels", {
  f <- factor(c("a", "a", "b", "c"), levels = c("a", "b", "c", "d"))

  expect_equal(
    fct_lump_prop(f, prop = 0.25, w = rep(1, 4)),
    fct(c("a", "a", "Other", "Other"))
  )
})

test_that("NAs included in total", {
  f <- factor(c("a", "a", "b", "c", rep(NA, 7)))

  o1 <- fct_lump_prop(f, prop = 0.10)
  expect_equal(levels(o1), c("a", "Other"))

  o2 <- fct_lump_prop(f, w = rep(1, 11), prop = 0.10)
  expect_equal(levels(o2), c("a", "Other"))
})

test_that("idempotent if element satisfy n condition", {
  f <- c("a", "a", "a", "b", "b", "c", "d", "e", "f", "g")

  expect_equal(
    levels(fct_lump_prop(f, prop = 0.01)),
    c("a", "b", "c", "d", "e", "f", "g")
  )
  expect_equal(
    levels(fct_lump_prop(f, prop = -1)),
    c("a", "b", "c", "d", "e", "f", "g")
  )
})

test_that("checks inputs", {
  expect_snapshot(error = TRUE, {
    fct_lump_prop(1:3)
    fct_lump_prop(factor(), prop = "x")
  })
})

# fct_lump_lowfreq() -----------------------------------------------------------

test_that("only have one small other level", {
  f <- c("a", "a", "a", "a", "b", "b", "b", "c", "c", "d")
  expect_equal(levels(fct_lump(f)), c("a", "b", "c", "Other"))
})

test_that("lumps smallest", {
  lump_test <- function(x) {
    paste(ifelse(in_smallest(x), "X", letters[seq_along(x)]), collapse = "")
  }

  # smallest
  expect_equal(lump_test(c(1, 2, 3, 6)), "Xbcd")
  expect_equal(lump_test(c(1, 2, 3, 7)), "XXXd")

  expect_equal(lump_test(c(1, 2, 3, 7, 13)), "XXXde")
  expect_equal(lump_test(c(1, 2, 3, 7, 14)), "XXXXe")

  # doesn't lump if none small enough
  expect_equal(lump_test(c(2, 2, 4)), "abc")

  # order doesn't matter
  expect_equal(lump_test(c(2, 2, 5)), "XXc")
  expect_equal(lump_test(c(2, 5, 2)), "XbX")
  expect_equal(lump_test(c(5, 2, 2)), "aXX")
})
