# Superseded helper for lumping factor levels

**\[superseded\]**

`fct_lump()` automatically chooses between
[`fct_lump_min()`](https://forcats.tidyverse.org/dev/reference/fct_lump_helpers.md),
[`fct_lump_prop()`](https://forcats.tidyverse.org/dev/reference/fct_lump_helpers.md),
[`fct_lump_n()`](https://forcats.tidyverse.org/dev/reference/fct_lump_helpers.md),
and
[`fct_lump_lowfreq()`](https://forcats.tidyverse.org/dev/reference/fct_lump_helpers.md)
based on its arguments. It is kept for backward compatibility, but is
superseded and no longer recommended for new code.

For new code, prefer the more explicit helpers:
[`fct_lump_min()`](https://forcats.tidyverse.org/dev/reference/fct_lump_helpers.md),
[`fct_lump_prop()`](https://forcats.tidyverse.org/dev/reference/fct_lump_helpers.md),
[`fct_lump_n()`](https://forcats.tidyverse.org/dev/reference/fct_lump_helpers.md),
and
[`fct_lump_lowfreq()`](https://forcats.tidyverse.org/dev/reference/fct_lump_helpers.md).

## Usage

``` r
fct_lump(
  f,
  n,
  prop,
  w = NULL,
  other_level = "Other",
  ties.method = c("min", "average", "first", "last", "random", "max")
)
```

## Arguments

- f:

  A factor (or character vector).

- n:

  Positive `n` preserves the most common `n` values. Negative `n`
  preserves the least common `-n` values. If there are ties, you will
  get at least `abs(n)` values.

- prop:

  Positive `prop` lumps values which do not appear at least `prop` of
  the time. Negative `prop` lumps values that do not appear at most
  `-prop` of the time.

- w:

  An optional numeric vector giving weights for frequency of each value
  (not level) in `f`.

- other_level:

  Value of level used for "other" values. Always placed at end of
  levels.

- ties.method:

  A character string specifying how ties are treated. See
  [`rank()`](https://rdrr.io/r/base/rank.html) for details.

## Examples

``` r
x <- factor(letters[rpois(100, 5)])
table(x)
#> x
#>  a  b  c  d  e  f  g  h  i 
#>  1  9 13 24 13 18 12  8  2 
table(fct_lump(x, n = 3))
#> 
#>     c     d     e     f Other 
#>    13    24    13    18    32 
```
