# validates its inputs

    Code
      fct_expand("x", d = "d")
    Condition
      Error in `fct_expand()`:
      ! Arguments in `...` must be passed by position, not name.
      x Problematic argument:
      * d = "d"
    Code
      fct_expand("x", after = "x")
    Condition
      Error in `fct_expand()`:
      ! `after` must be a number, not the string "x".

