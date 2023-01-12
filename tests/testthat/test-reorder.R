# fct_reorder -------------------------------------------------------------

test_that("can reorder can control ordering", {
  f <- c("a", "a", "b", "b", "b")
  x <- c(3, 3, 2, 2, 1)

  f1 <- fct_reorder(f, x)
  expect_equal(levels(f1), c("b", "a"))

  f2 <- fct_reorder(f, x, .desc = TRUE)
  expect_equal(levels(f2), c("a", "b"))
})

test_that("automatically removes missing values with a warning", {
  f1 <- fct(c("a", "b", "c", "c"))
  x <- c(3, 2, 1, NA)

  expect_snapshot(f2 <- fct_reorder(f1, x))
  expect_equal(levels(f2), c("c", "b", "a"))

  expect_no_warning(fct_reorder(f1, x, .na_rm = TRUE))

  expect_no_warning(f3 <- fct_reorder(f1, x, .na_rm = FALSE))
  expect_equal(levels(f3), c("b", "a", "c"))
})

test_that("can control the placement of empty levels", {
  f1 <- fct(c("a", "b", "c"), letters[1:4])
  x <- c(1, 2, 3)

  f2 <- fct_reorder(f1, x, .default = -Inf)
  expect_equal(levels(f2), c("d", "a", "b", "c"))
})

test_that("can control the placement of levels with all missing data", {
  f1 <- fct(c("a", "b", "c"))
  x <- c(1, 2, NA)

  f2 <- fct_reorder(f1, x, .na_rm = TRUE, .default = -Inf)
  expect_equal(levels(f2), c("c", "a", "b"))
})

test_that("fct_reorder() complains if summary doesn't return single value", {
  expect_snapshot(error = TRUE, {
    fct_reorder("a", 1, function(x) c(1, 2))
  })
})

test_that("fct_reorder() validates its inputs", {
  expect_snapshot(error = TRUE, {
    fct_reorder(1)
    fct_reorder("x", 1, 1)
    fct_reorder("x", 1, .na_rm = 1)
    fct_reorder("x", 1, .desc = 1)
  })

})

# fct_reorder2 ------------------------------------------------------------

test_that("can reorder by 2d summary", {
  df <- tibble::tribble(
    ~g, ~x, ~y,
    "a", 1, 10,
    "a", 2, 5,
    "b", 1, 5,
    "b", 2, 10
  )

  f1 <- fct_reorder2(df$g, df$x, df$y)
  expect_equal(levels(f1), c("b", "a"))

  f2 <- fct_reorder(df$g, df$x, .desc = TRUE)
  expect_equal(levels(f2), c("a", "b"))
})

test_that("fct_reorder2() automatically removes missing values with a warning", {
  f1 <- fct(c("a", "b", "c", "c"))
  x <- c(1, 1, 1, 2)
  y <- c(1, 2, 3, NA)

  expect_snapshot(f2 <- fct_reorder2(f1, x, y))
  expect_equal(levels(f2), c("c", "b", "a"))

  expect_no_warning(fct_reorder2(f1, x, y, .na_rm = TRUE))

  # unlike fct_reorder() the default summary function can handle missing values
  expect_no_warning(f3 <- fct_reorder2(f1, x, y, .na_rm = FALSE))
  expect_equal(levels(f2), c("c", "b", "a"))
})

test_that("can control the placement of empty levels", {
  f1 <- fct(c("a", "b", "c"), letters[1:4])
  x <- c(1, 2, 3)

  f2 <- fct_reorder(f1, x, .default = -Inf)
  expect_equal(levels(f2), c("d", "a", "b", "c"))
})

test_that("missing groups appear at end by default", {
  df <- tibble::tribble(
    ~g, ~x, ~y,
    "a", NA, NA,
    "b", 1, 10,
  )

  f1 <- fct_reorder2(df$g, df$x, df$y, .na_rm = TRUE)
  expect_equal(levels(f1), c("b", "a"))

  f2 <- fct_reorder2(df$g, df$x, df$y, .default = Inf, .na_rm = TRUE)
  expect_equal(levels(f2), c("a", "b"))
})

test_that("fct_reorder2() complains if summary doesn't return single value", {
  expect_snapshot(error = TRUE, {
    fct_reorder2("a", 1, 1, function(x, y) c(1, 2))
  })
})

test_that("first2/last2 return expected values", {
  expect_equal(first2(4:1, 1:4), 4)
  expect_equal(last2(4:1, 1:4), 1)
})

test_that("last2 ignores points where either value is missing", {
  expect_equal(last2(1:4, c(1:3, NA)), 3)
  expect_equal(last2(c(1:3, NA), 1:4), 3)
})

test_that("last2 returns NA if no non-missing pairs", {
  expect_equal(last2(c(NA, 1), c(1, NA)), NA_real_)
  expect_equal(last2(c(NA, 1), c("x", NA)), NA_character_)
})

# fct_infreq --------------------------------------------------------------

test_that("fct_infreq() preserves explicit NA", {
  x <- c("a", "b", "b", NA, NA, NA)
  f <- factor(x, exclude = FALSE)
  expect_equal(fct_infreq(f), fct(x, c(NA, "b", "a")))
})

test_that("fct_infreq() ignores implict NA", {
  x <- c("a", "b", "b", NA, NA, NA)
  f <- factor(x)
  expect_equal(fct_infreq(f), fct(x, c("b", "a")))
})

test_that("fct_infreq() respects weights", {
  x <- c("a", "b", "b", "c")
  f <- factor(x)
  w <- c(1, 1, 3, 3)
  expect_equal(fct_infreq(f, w), fct(x, c("b", "c", "a")))
})

test_that("fct_infreq() validates its inputs", {
  f <- fct(c("a", "b", "c"))

  expect_snapshot(error = TRUE, {
    fct_infreq(1)
    fct_infreq(f, 1:4)
    fct_infreq(f, "x")
    fct_infreq(f, ordered = 1)
  })
})

test_that("fct_infreq() preserves empty levels", {
  # at end
  x <- c("b", "b", "a")
  f <- fct(x, letters[1:3])
  expect_equal(fct_infreq(f), fct(x, c("b", "a", "c")))

  # at beginning
  x <- c("b", "b", "c")
  f <- fct(x, letters[1:3])
  expect_equal(fct_infreq(f), fct(x, c("b", "c", "a")))
})

# fct_inorder -------------------------------------------------------------

test_that("fct_inorder() preserves explicit NA", {
  x <- c(NA, "a", "b", "b", NA, NA)
  f <- factor(x, exclude = FALSE)
  expect_equal(fct_inorder(f), fct(x, c(NA, "a", "b")))
})

test_that("fct_inorder() ignores implict NA", {
  x <- c(NA, "a", "b", "b", NA, NA)
  f <- factor(x)
  expect_equal(fct_inorder(f), fct(x, c("a", "b")))
})

test_that("fct_inorder() preserves empty levels", {
  # at beginning
  x <- c("b", "b", "a")
  f <- fct(x, letters[1:3])
  expect_equal(fct_inorder(f), fct(x, c("b", "a", "c")))

  # at end
  x <- c("b", "b", "c")
  f <- fct(x, letters[1:3])
  expect_equal(fct_inorder(f), fct(x, c("b", "c", "a")))
})

test_that("fct_inorder() validates its inputs", {
  f <- fct(c("a", "b", "c"))

  expect_snapshot(error = TRUE, {
    fct_inorder(1)
    fct_inorder(f, 1:4)
    fct_inorder(f, "x")
    fct_inorder(f, ordered = 1)
  })
})

# fct_inseq ---------------------------------------------------------------

test_that("fct_inseq sorts in numeric order", {
  x <- c("1", "2", "3")
  expect_equal(
    fct_inseq(factor(x, levels = c("3", "1", "2"))),
    factor(x, levels = c("1", "2", "3"))
  )

  # non-numeric go to end
  x <- c("1", "2", "3", "a")
  expect_equal(
    fct_inseq(factor(x, levels = c("a", "3", "1", "2"))),
    factor(x, levels = c("1", "2", "3", "a"))
  )
})

test_that("fct_inseq gives error for non-numeric levels", {
  expect_snapshot(error = TRUE, {
    fct_inseq("x")
  })
})

test_that("fct_inorder() validates its inputs", {
  expect_snapshot(error = TRUE, {
    fct_inseq(1)
    fct_inseq("1", ordered = 1)
  })
})

