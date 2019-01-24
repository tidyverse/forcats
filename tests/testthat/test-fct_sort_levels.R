context("fct_sort_levels")

test_that("error if not a factor or character", {
  f1 <- 1:3
  expect_error(fct_sort_levels(f1, sort))
})

# .fun is a function
test_that(".fun should be a function", {
  f1 <- factor(letters[1:3])
  expect_error(fct_sort_levels(f1, "Not a function"))
})

# .fun(levels(.f)) should be the same length as levels(.f)
# .fun(levels(.f)) should contain the same values as levels(.f)
# .fun(levels(.f)) should be a vector
test_that(
  "Level-set returned by fct_sort_levels should match the input levels", {
  f1 <- factor(letters[1:3])
  expect_error(
    fct_sort_levels(f1, function(x) x[1:2]),
    info = "levels should be the same length"
  )
  expect_error(
    fct_sort_levels(f1, toupper),
    info = "contents of level-sets should be unchanged by `fct_sort_levels`"
  )

  expect_error(
    fct_sort_levels(f1, matrix),
    info = "level-sets returned by `fct_sort_levels` should be a vector"
  )
})

# .fun = identity ==> result should equal .f
test_that("identity-sort should return an unchanged factor", {
  f1 <- factor(letters[1:3])
  expect_equal(fct_sort_levels(f1, identity), f1)
})

# .fun = rev ==> result should equal fct_rev(.f)
test_that("reverse-sort should match fct_rev", {
  f1 <- factor(letters[1:3])
  expect_equal(fct_sort_levels(f1, rev), fct_rev(f1))
})


# .fun with args (sort decreasing=TRUE)
test_that("sort-function with additional arguments", {
  f1 <- letters[1:3]
  expect_equal(
    fct_sort_levels(f1, sort, decreasing = TRUE),
    factor(f1, levels = rev(f1))
  )
})

# alphanumeric sorting
test_that("mixed-sort: typical use case", {
  f1 <- c("chr2", "chr1", "chr10")
  expect_equal(
    fct_sort_levels(f1, sort),
    factor(f1, levels = c("chr1", "chr10", "chr2")),
    info = "naive alphanumeric sort: 1 < 10 < 2"
  )

  parse_number <- function(x) {
    as.numeric(gsub(".*?([[:digit:]]+).*", "\\1", x))
  }
  sort_numeric <- function(x) {
    x[order(parse_number(x))]
  }
  expect_equal(
    fct_sort_levels(f1, sort_numeric),
    factor(f1, levels = c("chr1", "chr2", "chr10")),
    info = "numeric sorting of strings: 1 < 2 < 10"
  )
})
