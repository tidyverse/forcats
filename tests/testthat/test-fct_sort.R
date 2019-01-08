context("fct_sort")

test_that("error if not a factor or character", {
  f1 <- 1:3
  expect_error(fct_sort(f1, sort))
})

# .fun is a function
test_that(".fun should be a function", {
  f1 <- factor(letters[1:3])
  expect_error(fct_sort(f1, "Not a function"))
})

# .fun(levels(.f)) should be the same length as levels(.f)
# .fun(levels(.f)) should contain the same values as levels(.f)
test_that("level-set returned by fct_sort should match the input levels", {
  f1 <- factor(letters[1:3])
  expect_error(
    fct_sort(f1, function(x) x[1:2]),
    info = "Levels should be the same length"
  )
  expect_error(
    fct_sort(f1, toupper),
    info = "Contents of level-sets should be unchanged by fct_sort"
  )
})

# .fun = identity ==> result should equal .f
test_that("identity-sort should return an unchanged factor", {
  f1 <- factor(letters[1:3])
  expect_equal(fct_sort(f1, identity), f1)
})

# .fun = rev ==> result should equal fct_rev(.f)
test_that("reverse-sort should match fct_rev", {
  f1 <- factor(letters[1:3])
  expect_equal(fct_sort(f1, rev), fct_rev(f1))
})


# .fun with args (sort decreasing=TRUE)
test_that("sort-function with additional arguments", {
  f1 <- letters[1:3]
  expect_equal(
    fct_sort(f1, sort, decreasing = TRUE),
    factor(f1, levels = rev(f1))
  )
})

# example sort:
# parse_number <- function(x) as.numeric(gsub(".*?([[:digit:]]+).*", "\\1", x))
# sort_numeric <- function(x) x[order(parse_number(x))]
# fct_sort(c("chr2", "chr1", "chr10"), .fun = sort)
# fct_sort(c("chr2", "chr1", "chr10"), .fun = sort_numeric)
test_that("mixed-sort: typical use case", {
  f1 <- c("chr2", "chr1", "chr10")
  expect_equal(
    fct_sort(f1, sort),
    factor(f1, levels = c("chr1", "chr10", "chr2")),
    info = "naive alphanumeric sort: 1 < 10 < 2"
  )

  parse_number <- function(x){
    as.numeric(gsub(".*?([[:digit:]]+).*", "\\1", x))
  }
  sort_numeric <- function(x){
    x[order(parse_number(x))]
  }
  expect_equal(
    fct_sort(f1, sort_numeric),
    factor(f1, levels = c("chr1", "chr2", "chr10")),
    info = "numeric sorting of strings: 1 < 2 < 10"
  )
})
