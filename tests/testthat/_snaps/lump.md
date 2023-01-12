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

# can only supply one of n and prop

    Code
      fct_lump(f, n = 1, prop = 0.1)
    Condition
      Error in `fct_lump()`:
      ! Must supply only one of `n` and `prop`.

# checks inputs

    Code
      fct_lump_min(1:3)
    Condition
      Error in `fct_lump_min()`:
      ! `f` must be a factor or character vector, not an integer vector.
    Code
      fct_lump_min(factor(), min = "x")
    Condition
      Error in `fct_lump_min()`:
      ! `min` must be a number, not the string "x".

---

    Code
      fct_lump_n(1:3)
    Condition
      Error in `fct_lump_n()`:
      ! `f` must be a factor or character vector, not an integer vector.
    Code
      fct_lump_n(factor(), n = "x")
    Condition
      Error in `fct_lump_n()`:
      ! `n` must be a number, not the string "x".

---

    Code
      fct_lump_prop(1:3)
    Condition
      Error in `fct_lump_prop()`:
      ! `f` must be a factor or character vector, not an integer vector.
    Code
      fct_lump_prop(factor(), prop = "x")
    Condition
      Error in `fct_lump_prop()`:
      ! `prop` must be a number, not the string "x".

