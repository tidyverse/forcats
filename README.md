# forcats 🐈🐈🐈🐈

[![Travis-CI Build Status](https://travis-ci.org/hadley/forcats.svg?branch=master)](https://travis-ci.org/hadley/forcats)
[![Coverage Status](https://img.shields.io/codecov/c/github/hadley/forcats/master.svg)](https://codecov.io/github/hadley/forcats?branch=master)

forcats provides tools for **cat**egorical variables (forcats is an anagram of factors).

## Installation

You can install forcats from github with:

```R
# install.packages("devtools")
devtools::install_github("hadley/forcats")
```

## Key functions:

Change order of levels:

* `fct_relevel()`: move specified level up front.
* `fct_inorder()`: order by first appearance of each level.
* `fct_reorder()`: order by summary of another value.
  (same as `stats::reorder()`)
* `fct_infreq()`:  order by frequency.
* `fct_shuffle()`: randomly shuffle order of levels.
* `fct_rev()`:     reverse order of levels.
* `fct_shift()`:   shift levels to the left/right.

Change value of levels:

* `fct_anon()`:     anonymise factor levels.
* `fct_lump()`:     lump rarest (or most common) levels into "other".
* `fct_recode()`:   manually recode levels.

Add new levels:

* `fct_expand()`:      add new levels to a factor.
* `fct_explicit_na()`: turn missing values into an explicit factor.

A few other helpers:

* `fct_c()`:      concatenate factors using union of levels.
* `fct_count()`:  count occurences of levels, optionally sorting by frequency.
* `fct_unify()`:  ensure list of factors share the same levels.
* `fct_unique()`: compute from levels of factor.
* `fct_drop()`:   drop levels without data (same as `base::droplevels()`).
* `lvls_union()`: finds union of levels from list of factors.
