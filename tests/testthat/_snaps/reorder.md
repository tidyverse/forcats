# automatically removes missing values with a warning

    Code
      f2 <- fct_reorder(f1, x)
    Condition
      Warning:
      `fct_reorder()` removing 1 missing value.
      i Use `.na_rm = TRUE` to silence this message.
      i Use `.na_rm = FALSE` to preserve NAs.

# fct_reorder() complains if summary doesn't return single value

    Code
      fct_reorder("a", 1, function(x) c(1, 2))
    Condition
      Error in `fct_reorder()`:
      ! `.fun` must return a single value per group

# fct_reorder() validates its inputs

    Code
      fct_reorder(1)
    Condition
      Error in `fct_reorder()`:
      ! `.f` must be a factor or character vector, not a number.
    Code
      fct_reorder("x", 1, 1)
    Condition
      Error in `fct_reorder()`:
      ! Can't convert `.fun`, a double vector, to a function.
    Code
      fct_reorder("x", 1, .na_rm = 1)
    Condition
      Error in `fct_reorder()`:
      ! `.na_rm` must be `TRUE`, `FALSE`, or `NULL`, not the number 1.
    Code
      fct_reorder("x", 1, .desc = 1)
    Condition
      Error in `fct_reorder()`:
      ! `.desc` must be `TRUE` or `FALSE`, not the number 1.

# fct_reorder2() automatically removes missing values with a warning

    Code
      f2 <- fct_reorder2(f1, x, y)
    Condition
      Warning:
      `fct_reorder2()` removing 1 missing value.
      i Use `.na_rm = TRUE` to silence this message.
      i Use `.na_rm = FALSE` to preserve NAs.

# fct_reorder2() complains if summary doesn't return single value

    Code
      fct_reorder2("a", 1, 1, function(x, y) c(1, 2))
    Condition
      Error in `fct_reorder2()`:
      ! `.fun` must return a single value per group

# fct_infreq() validates its inputs

    Code
      fct_infreq(1)
    Condition
      Error in `fct_infreq()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_infreq(f, 1:4)
    Condition
      Error in `fct_infreq()`:
      ! `w` must be the same length as `f` (3), not length 4.
    Code
      fct_infreq(f, "x")
    Condition
      Error in `fct_infreq()`:
      ! `w` must be a numeric vector, not a string.
    Code
      fct_infreq(f, ordered = 1)
    Condition
      Error in `fct_infreq()`:
      ! `ordered` must be `TRUE`, `FALSE`, or `NA`, not the number 1.

# fct_inorder() validates its inputs

    Code
      fct_inorder(1)
    Condition
      Error in `fct_inorder()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_inorder(f, 1:4)
    Condition
      Error in `fct_inorder()`:
      ! `ordered` must be `TRUE`, `FALSE`, or `NA`, not an integer vector.
    Code
      fct_inorder(f, "x")
    Condition
      Error in `fct_inorder()`:
      ! `ordered` must be `TRUE`, `FALSE`, or `NA`, not the string "x".
    Code
      fct_inorder(f, ordered = 1)
    Condition
      Error in `fct_inorder()`:
      ! `ordered` must be `TRUE`, `FALSE`, or `NA`, not the number 1.

---

    Code
      fct_inseq(1)
    Condition
      Error in `fct_inseq()`:
      ! `f` must be a factor or character vector, not a number.
    Code
      fct_inseq("1", ordered = 1)
    Condition
      Error in `fct_inseq()`:
      ! `ordered` must be `TRUE`, `FALSE`, or `NA`, not the number 1.

# fct_inseq gives error for non-numeric levels

    Code
      fct_inseq("x")
    Condition
      Error in `fct_inseq()`:
      ! At least one existing level must be coercible to numeric.

