# Find all levels in a list of factors

Find all levels in a list of factors

## Usage

``` r
lvls_union(fs)
```

## Arguments

- fs:

  A list of factors.

## Examples

``` r
fs <- list(factor("a"), factor("b"), factor(c("a", "b")))
lvls_union(fs)
#> [1] "a" "b"
```
