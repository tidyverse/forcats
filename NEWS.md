# forcats 0.1.1.9000

* New `fct_relabel()` allows relabeling factor levels programmatically (#50, @krlmlr).

* `fct_drop()` gains `only` argument to restrict which levels are dropped (#69)
  and no longer adds `NA` level if not present (#52).

* `fct_relevel()` gains `after` argument so you can also move levels
  to the end (or any other position you like) (#29).

* New `as_factor()` which behaves identically across platforms (#39).

* `fct_c()` can take either a list of factors or individual factors (#42).

* `lvls_reorder()`, `fct_inorder()`, and `fct_infreq()` gain an `ordered`
   argument, allowing you to override the existing "ordered" status (#54).

* `fct_recode()` is now checks that each new value is of length 1 (#56).

# forcats 0.1.1

* Minor fixes for R CMD check

* Add package docs
