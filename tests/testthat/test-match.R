test_that("equivalent to %in% when levels present", {
  f <- factor(c("a", "b", "c", NA))
  expect_equal(fct_match(f, "a"), f %in% "a")
  expect_equal(fct_match(f, NA), f %in% NA)
})

test_that("error when levels are missing", {
  f <- factor(c("a", "b", "c"))
  expect_snapshot(fct_match(f, "d"), error = TRUE)
})

test_that("validates its inputs", {
  expect_snapshot(error = TRUE, {
    fct_match(1)
    fct_match("x", 1)
  })
})
