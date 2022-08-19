# bad weights generates friendly error messages

    Code
      fct_lump(letters, w = letters)
    Condition
      Error in `fct_lump()`:
      ! `w` must be a numeric vector
    Code
      fct_lump(letters, w = 1:10)
    Condition
      Error in `fct_lump()`:
      ! `w` must be the same length as `f` (26), not length 10
    Code
      fct_lump(letters, w = c(-1, rep(1, 24), -1))
    Condition
      Error in `fct_lump()`:
      ! All `w` must be non-negative and non-missing.
      2 problems at positions 1 and 26

