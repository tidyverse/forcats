# group_other is deprecated

    Code
      f2 <- fct_collapse(f1, x1 = c("a", "d"), x2 = "c", group_other = TRUE)
    Condition
      Warning:
      The `group_other` argument of `fct_collapse()` is deprecated as of forcats 0.5.0.
      i Please use the `other_level` argument instead.

# valdiates inputs

    Code
      fct_collapse(1)
    Condition
      Error in `fct_collapse()`:
      ! `.f` must be a factor or character vector, not a number.
    Code
      fct_collapse("x", other_level = 1)
    Condition
      Error in `fct_collapse()`:
      ! `other_level` must be a single string, `NA`, or `NULL`, not the number 1.

