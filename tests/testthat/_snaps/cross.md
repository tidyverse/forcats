# validates its inputs

    Code
      fct_cross(x = "x")
    Condition
      Error in `fct_cross()`:
      ! Arguments in `...` must be passed by position, not name.
      x Problematic argument:
      * x = "x"
    Code
      fct_cross("x", sep = 1)
    Condition
      Error in `fct_cross()`:
      ! `sep` must be a single string, not the number 1.
    Code
      fct_cross("x", keep_empty = 1)
    Condition
      Error in `fct_cross()`:
      ! `keep_empty` must be `TRUE` or `FALSE`, not the number 1.

