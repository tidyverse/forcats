# Randomly permute factor levels

Randomly permute factor levels

## Usage

``` r
fct_shuffle(f)
```

## Arguments

- f:

  A factor (or character vector).

## Examples

``` r
f <- factor(c("a", "b", "c"))
fct_shuffle(f)
#> [1] a b c
#> Levels: c a b
fct_shuffle(f)
#> [1] a b c
#> Levels: c b a
```
