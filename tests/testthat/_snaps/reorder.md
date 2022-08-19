# complains if summary doesn't return single value

    Code
      fct_reorder("a", 1, fun1)
    Condition
      Error in `fct_reorder()`:
      ! `.fun` must return a single value per group
    Code
      fct_reorder("a", 1, fun2)
    Condition
      Error in `fct_reorder()`:
      ! `.fun` must return a single value per group
    Code
      fct_reorder2("a", 1, 2, fun1)
    Condition
      Error in `fct_reorder2()`:
      ! `.fun` must return a single value per group
    Code
      fct_reorder2("a", 1, 2, fun2)
    Condition
      Error in `fct_reorder2()`:
      ! `.fun` must return a single value per group

