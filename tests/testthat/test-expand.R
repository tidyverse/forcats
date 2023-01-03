test_that("dots must be unnamed", {
  f <- fct(c("a", "b", "c"))
  expect_snapshot(fct_expand(f, d = "d"), error = TRUE)
})
