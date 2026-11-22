test_that("0 count for empty levels", {
  f <- factor(levels = c("a", "b"))
  expect_equal(fct_count(f)$n, c(0, 0))

  f <- factor("a", levels = c("a", "b", "c"))
  expect_equal(fct_count(f)$n, c(1, 0, 0))
})

test_that("counts NA values and levels", {
  f1 <- factor(c("a", "a", NA))
  expect_equal(
    fct_count(f1),
    tibble::tibble(
      f = fct(c("a", NA)),
      n = c(2, 1)
    )
  )

  f2 <- factor(c("a", "a", NA), exclude = NULL)
  expect_equal(
    fct_count(f2),
    tibble::tibble(
      f = fct(c("a", NA), c("a", NA)),
      n = c(2, 1)
    )
  )
})

test_that("returns marginal table", {
  f <- factor(c("a", "a", "b"))
  out <- fct_count(f, prop = TRUE)

  expect_equal(out$n, c(2, 1))
  expect_equal(out$p, c(2, 1) / 3)
})

test_that("sort = TRUE brings most frequent values to top", {
  f <- factor(c("a", "b", "b"))
  out <- fct_count(f, sort = TRUE)

  expect_equal(out$f, factor(c("b", "a"), levels = c("a", "b")))
})

test_that("validates its inputs", {
  expect_snapshot(error = TRUE, {
    fct_count(1)
    fct_count("x", sort = 1)
    fct_count("x", prop = 1)
  })
})
