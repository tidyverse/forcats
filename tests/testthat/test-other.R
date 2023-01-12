test_that("keeps levels in keep", {
  x1 <- factor(c("a", "b"))
  x2 <- fct_other(x1, keep = "a")

  expect_equal(levels(x2), c("a", "Other"))
})

test_that("drops levels in drop", {
  x1 <- factor(c("a", "b"))
  x2 <- fct_other(x1, drop = "a")

  # other always placed at end
  expect_equal(levels(x2), c("b", "Other"))
})

test_that("works without warning if no levels replaced", {
  x <- factor("a")
  expect_no_warning(fct_other(x, keep = "a"))
  expect_no_warning(fct_other(x, drop = "b"))
})

test_that("can use NA as other level", {
  f <- fct(c("a", "b"))
  expect_equal(
    fct_other(f, keep = "a", other_level = NA),
    fct(c("a", NA), levels = c("a", NA))
  )

  expect_equal(
    levels(lvls_other(f, c(TRUE, FALSE), other_level = NA)),
    c("a", NA)
  )
})

test_that("validates its inputs", {
  f <- factor(c("a", "b"))

  expect_snapshot(error = TRUE, {
    fct_other(1)
    fct_other(f)
    fct_other(f, keep = "a", drop = "a")
    fct_other(f, keep = 1)
    fct_other(f, keep = "a", other_level = 1)
  })
})
