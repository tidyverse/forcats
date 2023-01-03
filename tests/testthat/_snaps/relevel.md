# warns about unknown levels

    Code
      f2 <- fct_relevel(f1, "d")
    Condition
      Warning:
      1 unknown level in `f`: d

# dots must be unnamed

    Code
      fct_relevel(f, a = "b")
    Condition
      Error in `fct_relevel()`:
      ! Arguments in `...` must be passed by position, not name.
      x Problematic argument:
      * a = "b"

