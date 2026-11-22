# error when levels are missing

    Code
      fct_match(f, "d")
    Condition
      Error in `fct_match()`:
      ! All `lvls` must be present in `f`.
      i Missing levels: "d"

# validates its inputs

    Code
      fct_match(1)
    Condition
      Error in `fct_match()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_match("x", 1)
    Condition
      Error in `fct_match()`:
      ! `lvls` must be a character vector, not the number 1.

