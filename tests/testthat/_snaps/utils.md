# check_factor() fails when needed

    Code
      check_factor(NA)
    Condition
      Error:
      ! `NA` must be a factor or character vector, not `NA`.

# check_factor_list() checks its inputs

    Code
      check_factor_list(1)
    Condition
      Error:
      ! `1` must be a list, not a number.
    Code
      check_factor_list(list(1))
    Condition
      Error:
      ! All elements of `list(1)` must be factors.

