context("fct_cross")

test_that("gives correct levels", {
  fruit <- as_factor(c("apple", "kiwi", "apple", "apple"))
  colour <- as_factor(c("green", "green", "red", "green"))
  f2 <- fct_cross(fruit, colour)

  expect_setequal(levels(f2), c("apple:green", "kiwi:green", "apple:red"))
})

test_that("keeps empty levels when requested", {
  fruit <- as_factor(c("apple", "kiwi", "apple", "apple"))
  colour <- as_factor(c("green", "green", "red", "green"))
  f2 <- fct_cross(fruit, colour, keep_empty = TRUE)

  expect_setequal(levels(f2), c("apple:green", "kiwi:green", "apple:red", "kiwi:red"))
})

test_that("gives NA output on NA input", {
  fruit <- as_factor(c("apple", "kiwi", "apple", "apple"))
  colour <- as_factor(c("green", "green", "red", "green"))
  fruit[1] <- NA
  f2 <- fct_cross(fruit, colour)

  expect_true(is.na(f2[1]))
})


test_that("gives NA output on NA input, when keeping empty levels", {
  fruit <- as_factor(c("apple", "kiwi", "apple", "apple"))
  colour <- as_factor(c("green", "green", "red", "green"))
  fruit[1] <- NA
  f2 <- fct_cross(fruit, colour, keep_empty = TRUE)

  expect_true(is.na(f2[1]))
})
