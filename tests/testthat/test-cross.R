test_that("empty input returns empty factor", {
  expect_equal(fct_cross(), factor())
})

test_that("gives correct levels", {
  fruit <- as_factor(c("apple", "kiwi", "apple", "apple"))
  colour <- as_factor(c("green", "green", "red", "green"))
  f2 <- fct_cross(fruit, colour)

  expect_setequal(levels(f2), c("apple:green", "kiwi:green", "apple:red"))
})

test_that("recycle inputs", {
  expect_length(fct_cross("a", c("a", "b", "c"), "d"), 3)
  expect_error(
    fct_cross(c("a", "b", "c"), c("a", "b")),
    "recycle",
    class = "error"
  )
})

test_that("keeps empty levels when requested", {
  fruit <- as_factor(c("apple", "kiwi", "apple", "apple"))
  colour <- as_factor(c("green", "green", "red", "green"))
  f2 <- fct_cross(fruit, colour, keep_empty = TRUE)

  expect_setequal(
    levels(f2),
    c("apple:green", "kiwi:green", "apple:red", "kiwi:red")
  )
})

test_that("order of levels is preserved", {
  fruit <- as_factor(c("apple", "kiwi", "apple", "apple"))
  colour <- as_factor(c("green", "green", "red", "green"))

  fruit <- fct_relevel(fruit, c("kiwi", "apple"))
  colour <- fct_relevel(colour, c("red", "green"))

  f2 <- fct_cross(fruit, colour)

  expect_setequal(levels(f2), c("kiwi:green", "apple:red", "apple:green"))
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

test_that("can combine more than two factors", {
  fruit <- as_factor(c("apple", "kiwi", "apple", "apple"))
  colour <- as_factor(c("green", "green", "red", "green"))
  eaten <- c("yes", "no", "yes", "no")

  f2 <- fct_cross(fruit, colour, eaten)

  expect_setequal(
    levels(f2),
    c("apple:green:no", "apple:green:yes", "apple:red:yes", "kiwi:green:no")
  )
})

test_that("validates its inputs", {
  expect_snapshot(error = TRUE, {
    fct_cross(x = "x")
    fct_cross("x", sep = 1)
    fct_cross("x", keep_empty = 1)
  })
})

test_that("varies last values fastest", {
  f1 <- fct(c("a4", "a3", "a2", "a1"))
  f2 <- fct(c("b4", "b3", "b2", "b1"), levels = c("b4", "b3", "b2", "b1"))

  fcross <- fct_cross(f1, f2)
  expect_equal(levels(fcross), c("a4:b4", "a3:b3", "a2:b2", "a1:b1"))
})

test_that("explicit NA levels are treated as regular levels", {
  f1 <- factor(c("a", "b", NA), exclude = NULL)
  f2 <- factor(c("x", NA, "y"), exclude = NULL)
  out <- fct_cross(f1, f2)

  expect_setequal(levels(out), c("a:x", "b:NA", "NA:y"))
  expect_false(any(is.na(out)))
})

test_that("keep_empty with explicit NA levels generates all combinations", {
  f1 <- factor(c("a", NA), exclude = NULL)
  f2 <- factor(c("x", NA), exclude = NULL)
  out <- fct_cross(f1, f2, keep_empty = TRUE)

  expect_setequal(levels(out), c("a:x", "a:NA", "NA:x", "NA:NA"))
})

test_that("custom separator works", {
  f1 <- factor(c("a", "b"))
  f2 <- factor(c("x", "y"))

  out_dash <- fct_cross(f1, f2, sep = "-", keep_empty = TRUE)
  expect_setequal(levels(out_dash), c("a-x", "a-y", "b-x", "b-y"))

  out_empty <- fct_cross(f1, f2, sep = "", keep_empty = TRUE)
  expect_setequal(levels(out_empty), c("ax", "ay", "bx", "by"))
})

test_that("single-level factors work", {
  f1 <- factor(c("a", "a"))
  f2 <- factor(c("x", "x"))
  out <- fct_cross(f1, f2)

  expect_equal(levels(out), "a:x")
  expect_equal(as.character(out), c("a:x", "a:x"))
})

test_that("returns regular factor even with ordered input", {
  f1 <- ordered(c("low", "high"), levels = c("low", "high"))
  f2 <- factor(c("x", "y"))
  out <- fct_cross(f1, f2)

  expect_s3_class(out, "factor")
  expect_false(is.ordered(out))
  expect_setequal(levels(out), c("low:x", "high:y"))
})
