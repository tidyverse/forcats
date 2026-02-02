# Unify the levels in a list of factors

Unify the levels in a list of factors

## Usage

``` r
fct_unify(fs, levels = lvls_union(fs))
```

## Arguments

- fs:

  A list of factors

- levels:

  Set of levels to apply to every factor. Default to union of all factor
  levels

## Examples

``` r
fs <- list(factor("a"), factor("b"), factor(c("a", "b")))
fct_unify(fs)
#> [[1]]
#> [1] a
#> Levels: a b
#> 
#> [[2]]
#> [1] b
#> Levels: a b
#> 
#> [[3]]
#> [1] a b
#> Levels: a b
#> 
```
