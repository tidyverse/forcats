# must supply exactly one of drop and keep

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

