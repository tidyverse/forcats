# forcats 0.1.1.9000

* New `as_factor()` which behaves identically across platforms (#39).

* `fct_c()` can take either a list of factors or individual factors (#42).

* `lvls_reorder()`, `fct_inorder()`, and `fct_infreq()` gain an `ordered`
   argument, allowing you to override the existing "ordered" status (#54).

* `fct_recode()` is now checks that each new value is of length 1 (#56).

# forcats 0.1.1

* Minor fixes for R CMD check

* Add package docs
