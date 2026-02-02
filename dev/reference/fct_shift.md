# Shift factor levels to left or right, wrapping around at end

This is useful when the levels of an ordered factor are actually
cyclical, with different conventions on the starting point.

## Usage

``` r
fct_shift(f, n = 1L)
```

## Arguments

- f:

  A factor.

- n:

  Positive values shift to the left; negative values shift to the right.

## Examples

``` r
x <- factor(
  c("Mon", "Tue", "Wed"),
  levels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
  ordered = TRUE
)
x
#> [1] Mon Tue Wed
#> Levels: Sun < Mon < Tue < Wed < Thu < Fri < Sat
fct_shift(x)
#> [1] Mon Tue Wed
#> Levels: Mon < Tue < Wed < Thu < Fri < Sat < Sun
fct_shift(x, 2)
#> [1] Mon Tue Wed
#> Levels: Tue < Wed < Thu < Fri < Sat < Sun < Mon
fct_shift(x, -1)
#> [1] Mon Tue Wed
#> Levels: Sat < Sun < Mon < Tue < Wed < Thu < Fri
```
