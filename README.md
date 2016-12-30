
<!-- README.md is generated from README.Rmd. Please edit that file -->
forcats <img src="logo.png" align="right" />
============================================

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/forcats)](https://cran.r-project.org/package=forcats) [![Travis-CI Build Status](https://travis-ci.org/tidyverse/forcats.svg?branch=master)](https://travis-ci.org/tidyverse/forcats) [![Coverage Status](https://img.shields.io/codecov/c/github/tidyverse/forcats/master.svg)](https://codecov.io/github/tidyverse/forcats?branch=master)

Overview
--------

R uses **factors** to handle categorical variables, variables that have a fixed and known set of possible values. Historically, factors were much easier to work with than character vectors, so many base R functions automatically convert character vectors to factors. (For more historical context, I recommend [*stringsAsFactors: An unauthorized biography*](http://simplystatistics.org/2015/07/24/stringsasfactors-an-unauthorized-biography/) by Roger Peng, and [*stringsAsFactors = &lt;sigh&gt;*](http://notstatschat.tumblr.com/post/124987394001/stringsasfactors-sigh) by Thomas Lumley.) These days, making factors automatically is no longer so helpful, so packages in the [tidyverse](http://tidyverse.org) never create them automatically.

However, factors are still useful when you have true categorical data, and when you want to override the ordering of character vectors to improve display. The goal of the **forcats** package is to provide a suite of useful tools that solve common problems with factors. If you're not familiar with strings, the best place to start is the [chapter on factors](http://r4ds.had.co.nz/factors.html) in R for Data Science.

Installation
------------

``` r
# The easiest way to get forcats is to install the whole tidyverse:
install.packages("tidyverse")

# Alternatively, install just forcats:
install.packages("forcats")

# Or the the development version from GitHub:
# install.packages("devtools")
devtools::install_github("tidyverse/forcats")
```

Getting started
---------------

forcats is not part of the core tidyverse, so you need to load it explicitly:

``` r
library(tidyverse)
library(forcats)
```

Factors are used to describe categorical variables with a fixed and known set of **levels**. You can create factors with the base `factor()` or [`readr::parse_factor()`](http://readr.tidyverse.org/reference/parse_factor.html):

``` r
x1 <- c("Dec", "Apr", "Jan", "Mar")
month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

factor(x1, month_levels)
#> [1] Dec Apr Jan Mar
#> Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec

parse_factor(x1, month_levels)
#> [1] Dec Apr Jan Mar
#> Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
```

The advantage of `parse_factor()` is that it will generate a warning if values of `x` are not valid levels:

``` r
x2 <- c("Dec", "Apr", "Jam", "Mar")

factor(x2, month_levels)
#> [1] Dec  Apr  <NA> Mar 
#> Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec

parse_factor(x2, month_levels)
#> Warning: 1 parsing failure.
#> row col           expected actual
#>   3  -- value in level set    Jam
#> [1] Dec  Apr  <NA> Mar 
#> attr(,"problems")
#> # A tibble: 1 × 4
#>     row   col           expected actual
#>   <int> <int>              <chr>  <chr>
#> 1     3    NA value in level set    Jam
#> Levels: Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec
```

Once you have the factor, forcats provides helpers for solving common problems.
