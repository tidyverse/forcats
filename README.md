
<!-- README.md is generated from README.Rmd. Please edit that file -->
forcats <img src='man/figures/logo.png' align="right" height="139" />
=====================================================================

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/forcats)](https://cran.r-project.org/package=forcats) [![Travis build status](https://travis-ci.org/tidyverse/forcats.svg?branch=master)](https://travis-ci.org/tidyverse/forcats) [![Codecov test coverage](https://codecov.io/gh/tidyverse/forcats/branch/master/graph/badge.svg)](https://codecov.io/gh/tidyverse/forcats?branch=master) <!-- badges: end -->

Overview
--------

R uses **factors** to handle categorical variables, variables that have a fixed and known set of possible values. Factors are also helpful for reordering character vectors to improve display. The goal of the **forcats** package is to provide a suite of tools that solve common problems with factors. Some examples include: - `fct_reorder()`: Reordering a factor by another variable. - `fct_infreq()`: Reordering a factor by the frequency of values. - `fct_lump()`: Collapsing the least frequent values of a factor into "other". - `fct_relevel()`: Manually changing the order of a factor.

You can learn more about each of these in vignette("forcats").

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

forcats is part of the core tidyverse, so you can load it with `library(tidyverse)` or `library(forcats)`.

``` r
library(forcats)
```

Resources
---------

For a history of factors, I recommend [*stringsAsFactors: An unauthorized biography*](http://simplystatistics.org/2015/07/24/stringsasfactors-an-unauthorized-biography/) by Roger Peng, and [*stringsAsFactors = &lt;sigh&gt;*](http://notstatschat.tumblr.com/post/124987394001/stringsasfactors-sigh) by Thomas Lumley. If you want to learn more about other approaches to working with factors and categorical data, I recommend [*Wrangling categorical data in R*](https://peerj.com/preprints/3163/), by Amelia McNamara and Nicholas Horton.) The R for Data Science book also has a [chapter on factors](http://r4ds.had.co.nz/factors.html).

Getting help
------------

If you encounter a clear bug, please file a minimal reproducible example on [github](https://github.com/tidyverse/forcats/issues). For questions and other discussion, please use [community.rstudio.com](https://community.rstudio.com/).

Code of Conduct
---------------

Please note that the 'forcats' project is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
