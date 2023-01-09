# checks input types

    Code
      fct_na_value_to_level(1)
    Condition
      Error in `fct_na_value_to_level()`:
      ! `f` must be a factor or character vector, not a numeric vector
    Code
      fct_na_value_to_level(f, level = 1)
    Condition
      Error in `fct_na_value_to_level()`:
      ! `level` must be a string or `NA`, not a number.
    Code
      fct_na_level_to_value(1)
    Condition
      Error in `fct_na_level_to_value()`:
      ! `f` must be a factor or character vector, not a numeric vector
    Code
      fct_na_level_to_value(f, extra_levels = 1)
    Condition
      Error in `fct_na_level_to_value()`:
      ! `extra_levels` must be a string or `NULL`, not a number.

