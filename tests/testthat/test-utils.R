test_that("check_factor() fails when needed", {
  expect_equal(check_factor("x"), factor("x"))
  expect_equal(check_factor(factor("x")), factor("x"))

  expect_snapshot(error = TRUE, {
    check_factor(NA)
  })
})

test_that("check_factor_list() checks its inputs", {
  expect_snapshot(error = TRUE, {
    check_factor_list(1)
    check_factor_list(list(1))
  })
})
