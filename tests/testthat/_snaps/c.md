# validates inputs

    Code
      fct_c(1)
    Condition
      Error in `fct_c()`:
      ! All elements of `...` must be factors.
    Code
      fct_unify(list(1))
    Condition
      Error in `fct_unify()`:
      ! All elements of `fs` must be factors.
    Code
      fct_unify(list(factor()), levels = 1)
    Condition
      Error in `fct_unify()`:
      ! `levels` must be a character vector, not the number 1.

