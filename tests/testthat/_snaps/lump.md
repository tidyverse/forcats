# bad weights generates friendly error messages

    Code
      fct_lump(letters, w = letters)
    Condition
      Error in `fct_lump_lowfreq()`:
      ! `w` must be a numeric vector, not a string.
    Code
      fct_lump(letters, w = 1:10)
    Condition
      Error in `fct_lump_lowfreq()`:
      ! `w` must be the same length as `f` (26), not length 10.
    Code
      fct_lump(letters, w = c(-1, rep(1, 24), -1))
    Condition
      Error in `fct_lump_lowfreq()`:
      ! All `w` must be non-negative and non-missing.
      2 problems at positions 1 and 26.

