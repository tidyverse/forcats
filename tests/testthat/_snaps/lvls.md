# must include all existing levels

    Code
      lvls_expand(f1, c("a", "c"))
    Condition
      Error in `lvls_expand()`:
      ! `new_levels` must include all levels in `f`.
      i Missing 1 level: b

# `new_levels` must checks its inputs

    Code
      lvls_revalue(f1, 1:5)
    Condition
      Error in `lvls_revalue()`:
      ! `new_levels` must be a character vector
    Code
      lvls_revalue(f1, c("a", "b", "c"))
    Condition
      Error in `lvls_revalue()`:
      ! `new_levels` must be the same length (3) as `levels(f)` (2).

