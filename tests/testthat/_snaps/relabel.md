# gives useful errors

    Code
      fct_relabel(f1, 1)
    Condition
      Error in `fct_relabel()`:
      ! Can't convert `.fun`, a number, to a function.
    Code
      fct_relabel(f1, function(x) 1)
    Condition
      Error in `lvls_revalue()`:
      ! `new_levels` must be a character vector
    Code
      fct_relabel(f1, function(x) x[-1])
    Condition
      Error in `lvls_revalue()`:
      ! `new_levels` must be the same length (0) as `levels(f)` (1).

