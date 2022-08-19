# new levels must be character

    Code
      fct_recode(f, "a")
    Condition
      Error in `fct_recode()`:
      ! Each element of `...` must be a named string.
      i Problems with 1 argument: 1
    Code
      fct_recode(f, x = 1, y = c("a", "b"))
    Condition
      Error in `fct_recode()`:
      ! Each element of `...` must be a named string.
      i Problems with 2 arguments: x and y

