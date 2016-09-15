# forcats

[CRAN_Status_Badge](http://www.r-pkg.org/badges/version/forcats)](https://cran.r-project.org/package=forcats)
[![Travis-CI Build Status](https://travis-ci.org/hadley/forcats.svg?branch=master)](https://travis-ci.org/hadley/forcats)
[![Coverage Status](https://img.shields.io/codecov/c/github/hadley/forcats/master.svg)](https://codecov.io/github/hadley/forcats?branch=master)

forcats provides tools for **cat**egorical variables (forcats is an anagram of factors).

## Installation

You can install the released version of forcats from CRAN with:

```R
install.packages("forcats")
```

Or the development version from github with:

```R
# install.packages("devtools")
devtools::install_github("hadley/forcats")
```

## Key functions:

Change order of levels:

* [`fct_relevel()`](https://hadley.github.io/forcats/fct_relevel.html): 
  move specified level up front.

* [`fct_inorder()`](https://hadley.github.io/forcats/fct_inorder.html): 
  order by first appearance of each level.

* [`fct_reorder()`](https://hadley.github.io/forcats/fct_reorder.html): 
  order by summary of another value (same as `stats::reorder()`).

* [`fct_infreq()`](https://hadley.github.io/forcats/fct_inorder.html):  
  order by frequency.

* [`fct_shuffle()`](https://hadley.github.io/forcats/fct_shuffle.html): 
  randomly shuffle order of levels.

* [`fct_rev()`](https://hadley.github.io/forcats/fct_rev.html):
  reverse order of levels.

* [`fct_shift()`](https://hadley.github.io/forcats/fct_shift.html):
  shift levels to the left/right.

Change value of levels:

* [`fct_anon()`](https://hadley.github.io/forcats/fct_anon.html):
  anonymise factor levels.

* [`fct_lump()`](https://hadley.github.io/forcats/fct_lump.html): 
  lump rarest (or most common) levels into "other".

* [`fct_recode()`](https://hadley.github.io/forcats/fct_recode.html):
  manually recode levels.

Add new levels:

* [`fct_expand()`](https://hadley.github.io/forcats/fct_expand.html):
  add new levels to a factor.

* [`fct_explicit_na()`](https://hadley.github.io/forcats/fct_explicit_na.html): 
  turn missing values into an explicit factor.

A few other helpers:

* [`fct_c()`](https://hadley.github.io/forcats/fct_c.html):
  concatenate factors using union of levels.

* [`fct_count()`](https://hadley.github.io/forcats/fct_count.html):  
  count occurences of levels, optionally sorting by frequency.

* [`fct_unify()`](https://hadley.github.io/forcats/fct_unify.html):  
  ensure list of factors share the same levels.

* [`fct_unique()`](https://hadley.github.io/forcats/fct_unique.html): 
  compute from levels of factor.

* [`fct_drop()`](https://hadley.github.io/forcats/fct_drop.html):
  drop levels without data (same as `base::droplevels()`).

* [`lvls_union()`](https://hadley.github.io/forcats/lvls_union.html): 
  finds union of levels from list of factors.
