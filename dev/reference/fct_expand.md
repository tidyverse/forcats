# Add additional levels to a factor

Add additional levels to a factor

## Usage

``` r
fct_expand(f, ..., after = Inf)
```

## Arguments

- f:

  A factor (or character vector).

- ...:

  Additional levels to add to the factor. Levels that already exist will
  be silently ignored.

- after:

  Where should the new values be placed?

## See also

[`fct_drop()`](https://forcats.tidyverse.org/dev/reference/fct_drop.md)
to drop unused factor levels.

## Examples

``` r
f <- factor(sample(letters[1:3], 20, replace = TRUE))
f
#>  [1] b b a b c b b a c a b c b c c c b c b a
#> Levels: a b c
fct_expand(f, "d", "e", "f")
#>  [1] b b a b c b b a c a b c b c c c b c b a
#> Levels: a b c d e f
fct_expand(f, letters[1:6])
#>  [1] b b a b c b b a c a b c b c c c b c b a
#> Levels: a b c d e f
fct_expand(f, "Z", after = 0)
#>  [1] b b a b c b b a c a b c b c c c b c b a
#> Levels: Z a b c
```
