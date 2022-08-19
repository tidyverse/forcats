test_that("can create simple example", {
  expect_equal(
    fct(c("x", "y", "z")),
    factor(c("x", "y", "z"))
  )
})

test_that("orders by appearance", {
  expect_equal(
    fct(c("y", "x")),
    factor(c("y", "x"), levels = c("y", "x"))
  )
})

test_that("checks input types", {
  expect_snapshot(error = TRUE, {
    fct(1:3)
    fct("x", 1:3)
    fct("x", "y", na = 1)
  })
})

test_that("clear error if levels are incomplete", {
  expect_snapshot(error = TRUE,
    fct(c("x", "y", "z"), c("x", "y"))
  )
})

test_that("can covert values to implicit or explcit NA", {
  expect_equal(
    fct(c("x", "y", "z"), na = "z"),
    factor(c("x", "y", NA), levels = c("x", "y"))
  )
  expect_equal(
    fct(c("x", "y", "z"), c("x", "y"), na = "z"),
    factor(c("x", "y", NA), levels = c("x", "y"))
  )
  expect_equal(
    fct(c("x", "y", "z"), c("x", "y", NA), na = "z"),
    factor(c("x", "y", NA), levels = c("x", "y", NA), exclude = NULL)
  )
})
