# validates its inputs

    Code
      fct_anon(1)
    Condition
      Error in `fct_anon()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_anon("x", 1)
    Condition
      Error in `fct_anon()`:
      ! `prefix` must be a single string, not the number 1.

