# validates its inputs

    Code
      fct_drop(1)
    Condition
      Error in `fct_drop()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_drop("x", only = 1)
    Condition
      Error in `fct_drop()`:
      ! `only` must be a character vector or `NULL`, not the number 1.

