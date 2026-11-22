# validates its inputs

    Code
      fct_other(1)
    Condition
      Error in `fct_other()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_other(f)
    Condition
      Error in `fct_other()`:
      ! One of `keep` or `drop` must be supplied.
    Code
      fct_other(f, keep = "a", drop = "a")
    Condition
      Error in `fct_other()`:
      ! Exactly one of `keep` or `drop` must be supplied.
    Code
      fct_other(f, keep = 1)
    Condition
      Error in `fct_other()`:
      ! `keep` must be a character vector, not the number 1.
    Code
      fct_other(f, keep = "a", other_level = 1)
    Condition
      Error in `fct_other()`:
      ! `other_level` must be a single string or `NA`, not the number 1.

