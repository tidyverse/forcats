# validates its inputs

    Code
      fct_count(1)
    Condition
      Error in `fct_count()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_count("x", sort = 1)
    Condition
      Error in `fct_count()`:
      ! `sort` must be `TRUE` or `FALSE`, not the number 1.
    Code
      fct_count("x", prop = 1)
    Condition
      Error in `fct_count()`:
      ! `prop` must be `TRUE` or `FALSE`, not the number 1.

