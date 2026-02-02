# Manually replace levels with "other"

Manually replace levels with "other"

## Usage

``` r
fct_other(f, keep, drop, other_level = "Other")
```

## Arguments

- f:

  A factor (or character vector).

- keep, drop:

  Pick one of `keep` and `drop`:

  - `keep` will preserve listed levels, replacing all others with
    `other_level`.

  - `drop` will replace listed levels with `other_level`, keeping all as
    is.

- other_level:

  Value of level used for "other" values. Always placed at end of
  levels.

## See also

[`fct_lump()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
to automatically convert the rarest (or most common) levels to "other".

## Examples

``` r
x <- factor(rep(LETTERS[1:9], times = c(40, 10, 5, 27, 1, 1, 1, 1, 1)))

fct_other(x, keep = c("A", "B"))
#>  [1] A     A     A     A     A     A     A     A     A     A     A    
#> [12] A     A     A     A     A     A     A     A     A     A     A    
#> [23] A     A     A     A     A     A     A     A     A     A     A    
#> [34] A     A     A     A     A     A     A     B     B     B     B    
#> [45] B     B     B     B     B     B     Other Other Other Other Other
#> [56] Other Other Other Other Other Other Other Other Other Other Other
#> [67] Other Other Other Other Other Other Other Other Other Other Other
#> [78] Other Other Other Other Other Other Other Other Other Other
#> Levels: A B Other
fct_other(x, drop = c("A", "B"))
#>  [1] Other Other Other Other Other Other Other Other Other Other Other
#> [12] Other Other Other Other Other Other Other Other Other Other Other
#> [23] Other Other Other Other Other Other Other Other Other Other Other
#> [34] Other Other Other Other Other Other Other Other Other Other Other
#> [45] Other Other Other Other Other Other C     C     C     C     C    
#> [56] D     D     D     D     D     D     D     D     D     D     D    
#> [67] D     D     D     D     D     D     D     D     D     D     D    
#> [78] D     D     D     D     D     E     F     G     H     I    
#> Levels: C D E F G H I Other
```
