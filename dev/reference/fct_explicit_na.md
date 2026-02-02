# Make missing values explicit

**\[deprecated\]**

This function is deprecated because the terminology is confusing; please
use
[`fct_na_value_to_level()`](https://forcats.tidyverse.org/dev/reference/fct_na_value_to_level.md)
instead.

This gives missing values an explicit factor level, ensuring that they
appear in summaries and on plots.

## Usage

``` r
fct_explicit_na(f, na_level = "(Missing)")
```

## Arguments

- f:

  A factor (or character vector).

- na_level:

  Level to use for missing values: this is what `NA`s will be changed
  to.

## Examples

``` r
f1 <- factor(c("a", "a", NA, NA, "a", "b", NA, "c", "a", "c", "b"))
fct_count(f1)
#> # A tibble: 4 × 2
#>   f         n
#>   <fct> <int>
#> 1 a         4
#> 2 b         2
#> 3 c         2
#> 4 NA        3
table(f1)
#> f1
#> a b c 
#> 4 2 2 
sum(is.na(f1))
#> [1] 3

# previously
f2 <- fct_explicit_na(f1)
#> Warning: `fct_explicit_na()` was deprecated in forcats 1.0.0.
#> ℹ Please use `fct_na_value_to_level()` instead.
# now
f2 <- fct_na_value_to_level(f1)

fct_count(f2)
#> # A tibble: 4 × 2
#>   f         n
#>   <fct> <int>
#> 1 a         4
#> 2 b         2
#> 3 c         2
#> 4 NA        3
table(f2)
#> f2
#>    a    b    c <NA> 
#>    4    2    2    3 
sum(is.na(f2))
#> [1] 0
```
