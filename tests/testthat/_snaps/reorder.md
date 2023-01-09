# complains if summary doesn't return single value

    Code
      fct_reorder("a", 1, fun1)
    Condition
      Error in `fct_reorder()`:
      ! `.fun` must return a single value per group
    Code
      fct_reorder("a", 1, fun2)
    Condition
      Error in `fct_reorder()`:
      ! `.fun` must return a single value per group
    Code
      fct_reorder2("a", 1, 2, fun1)
    Condition
      Error in `fct_reorder2()`:
      ! `.fun` must return a single value per group
    Code
      fct_reorder2("a", 1, 2, fun2)
    Condition
      Error in `fct_reorder2()`:
      ! `.fun` must return a single value per group

# automatically removes missing values with a warning

    Code
      f2 <- fct_reorder(f1, x)
    Condition
      Warning:
      `fct_reorder()` removing 1 missing value.
      i Use `.na_rm = TRUE` to silence this message

# fct_infreq() validates weight

    Code
      fct_infreq(f, 1:4)
    Condition
      Error in `fct_infreq()`:
      ! `w` must be the same length as `f` (3), not length 4.
    Code
      fct_infreq(f, "x")
    Condition
      Error in `fct_infreq()`:
      ! `w` must be a numeric vector, not a string.

