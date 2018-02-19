# forcats 0.3.0

## API changes

* `fct_c()` now requires explicit splicing with `!!!` if you have a
  list of factors that you want to combine. This is consistent with an emerging
  standards for handling `...` throughout the tidyverse.

* `fct_reorder()` and `fct_reorder2()` have renamed `fun` to `.fun` to
  avoid spurious matching of named arguments.

## New features

* All functions that take `...` use "tidy" dots: this means that you use can
  `!!!` to splice in a list of values, and trailing empty arguments are 
  automatically removed. Additionally, all other arguments gain a `.` prefix
  in order to avoid unhelpful matching of named arguments (#110).

* `fct_lump()` gains `w` argument (#70, @wilkox) to weight value
  frequencies before lumping them together (#68).

## Improvements to NA handling

* `as_factor()` and `fct_inorder()` accept NA levels (#98).

* `fct_explicit_na()` also replaces NAs encoded in levels.

* `fct_lump()` correctly acccounts for `NA` values in input (#41)

* `lvls_revalue()` preserves NA levels.

## Minor improvements and bug fixes

* Test coverage increased from 80% to 99%.

* `fct_drop()` now preserves attributes (#83).

* `fct_expand()` and `lvls_expand()` now also take character vectors (#99).

* `fct_relabel()` now accepts objects coercible to functions 
  by `rlang::as_function` (#91, @alistaire47)

# forcats 0.2.0

## New functions

* `as_factor()` which works like `as.factor()` but orders levels by
  appearance to avoid differences between locales (#39).

* `fct_other()` makes it easier to convert selected levels to "other" (#40)

* `fct_relabel()` allows programmatic relabeling of levels (#50, @krlmlr).

## Minor improvements and bug fixes

* `fct_c()` can take either a list of factors or individual factors (#42).

* `fct_drop()` gains `only` argument to restrict which levels are dropped (#69)
  and no longer adds `NA` level if not present (#52).

* `fct_recode()` is now checks that each new value is of length 1 (#56).

* `fct_relevel()` gains `after` argument so you can also move levels
  to the end (or any other position you like) (#29).

* `lvls_reorder()`, `fct_inorder()`, and `fct_infreq()` gain an `ordered`
   argument, allowing you to override the existing "ordered" status (#54).

# forcats 0.1.1

* Minor fixes for R CMD check

* Add package docs
