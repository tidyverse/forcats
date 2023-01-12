# validates its inputs

    Code
      fct_shift(1)
    Condition
      Error in `fct_shift()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_shift("x", NA)
    Condition
      Error in `fct_shift()`:
      ! `n` must be a whole number, not `NA`.

