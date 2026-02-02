# Reverse order of factor levels

This is sometimes useful when plotting a factor.

## Usage

``` r
fct_rev(f)
```

## Arguments

- f:

  A factor (or character vector).

## Examples

``` r
f <- factor(c("a", "b", "c"))
fct_rev(f)
#> [1] a b c
#> Levels: c b a
```
