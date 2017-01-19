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
