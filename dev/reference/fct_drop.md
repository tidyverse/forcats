# Drop unused levels

Compared to
[`base::droplevels()`](https://rdrr.io/r/base/droplevels.html), does not
drop `NA` levels that have values.

## Usage

``` r
fct_drop(f, only = NULL)
```

## Arguments

- f:

  A factor (or character vector).

- only:

  A character vector restricting the set of levels to be dropped. If
  supplied, only levels that have no entries and appear in this vector
  will be removed.

## See also

[`fct_expand()`](https://forcats.tidyverse.org/dev/reference/fct_expand.md)
to add additional levels to a factor.

## Examples

``` r
f <- factor(c("a", "b"), levels = c("a", "b", "c"))
f
#> [1] a b
#> Levels: a b c
fct_drop(f)
#> [1] a b
#> Levels: a b

# Set only to restrict which levels to drop
fct_drop(f, only = "a")
#> [1] a b
#> Levels: a b c
fct_drop(f, only = "c")
#> [1] a b
#> Levels: a b
```
