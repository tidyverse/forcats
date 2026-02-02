# Unique values of a factor, as a factor

`fct_unique()` extracts the complete set of possible values from the
levels of the factor, rather than looking at the actual values, like
[`unique()`](https://rdrr.io/r/base/unique.html).

`fct_unique()` only uses the values of `f` in one way: it looks for
implicit missing values so that they can be included in the result.

## Usage

``` r
fct_unique(f)
```

## Arguments

- f:

  A factor.

## Value

A factor.

## Examples

``` r
f <- fct(letters[rpois(100, 10)])
unique(f)     # in order of appearance
#>  [1] i e m l j k h g q n s o f p
#> Levels: i e m l j k h g q n s o f p
fct_unique(f) # in order of levels
#>  [1] i e m l j k h g q n s o f p
#> Levels: i e m l j k h g q n s o f p

f <- fct(letters[rpois(100, 2)], letters[1:20])
unique(f)     # levels that appear in data
#> [1] b a d c e f
#> Levels: a b c d e f g h i j k l m n o p q r s t
fct_unique(f) # all possible levels
#>  [1] a b c d e f g h i j k l m n o p q r s t
#> Levels: a b c d e f g h i j k l m n o p q r s t
```
