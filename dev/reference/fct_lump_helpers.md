# Lump uncommon factor levels together into "other"

A family of functions to lump together levels based on different
criteria:

- `fct_lump_min()`: lumps levels that appear fewer than `min` times.

- `fct_lump_prop()`: lumps levels that appear in fewer than (or equal
  to) `prop * n` times.

- `fct_lump_n()` lumps all levels except for the `n` most frequent (or
  least frequent if `n < 0`)

- `fct_lump_lowfreq()` lumps together the least frequent levels,
  ensuring that "other" is still the smallest level.

## Usage

``` r
fct_lump_min(f, min, w = NULL, other_level = "Other")

fct_lump_prop(f, prop, w = NULL, other_level = "Other")

fct_lump_n(
  f,
  n,
  w = NULL,
  other_level = "Other",
  ties.method = c("min", "average", "first", "last", "random", "max")
)

fct_lump_lowfreq(f, w = NULL, other_level = "Other")
```

## Arguments

- f:

  A factor (or character vector).

- min:

  Preserve levels that appear at least `min` number of times.

- w:

  An optional numeric vector giving weights for frequency of each value
  (not level) in `f`.

- other_level:

  Value of level used for "other" values. Always placed at end of
  levels.

- prop:

  Positive `prop` lumps values which do not appear at least `prop` of
  the time. Negative `prop` lumps values that do not appear at most
  `-prop` of the time.

- n:

  Positive `n` preserves the most common `n` values. Negative `n`
  preserves the least common `-n` values. If there are ties, you will
  get at least `abs(n)` values.

- ties.method:

  A character string specifying how ties are treated. See
  [`rank()`](https://rdrr.io/r/base/rank.html) for details.

## See also

[`fct_other()`](https://forcats.tidyverse.org/dev/reference/fct_other.md)
to convert specified levels to other.

## Examples

``` r
x <- factor(rep(LETTERS[1:9], times = c(40, 10, 5, 27, 1, 1, 1, 1, 1)))
x |> table()
#> x
#>  A  B  C  D  E  F  G  H  I 
#> 40 10  5 27  1  1  1  1  1 
x |>
  fct_lump_n(3) |>
  table()
#> 
#>     A     B     D Other 
#>    40    10    27    10 
x |>
  fct_lump_prop(0.10) |>
  table()
#> 
#>     A     B     D Other 
#>    40    10    27    10 
x |>
  fct_lump_min(5) |>
  table()
#> 
#>     A     B     C     D Other 
#>    40    10     5    27     5 
x |>
  fct_lump_lowfreq() |>
  table()
#> 
#>     A     D Other 
#>    40    27    20 
```
