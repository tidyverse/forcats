# Concatenate factors, combining levels

This is a useful way of patching together factors from multiple sources
that really should have the same levels but don't.

## Usage

``` r
fct_c(...)
```

## Arguments

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Individual factors. Uses tidy dots, so you can splice in a list of
  factors with `!!!`.

## Examples

``` r
fa <- factor("a")
fb <- factor("b")
fab <- factor(c("a", "b"))

c(fa, fb, fab)
#> [1] a b a b
#> Levels: a b
fct_c(fa, fb, fab)
#> [1] a b a b
#> Levels: a b

# You can also pass a list of factors with !!!
fs <- list(fa, fb, fab)
fct_c(!!!fs)
#> [1] a b a b
#> Levels: a b
```
