# Lump uncommon factor levels together into "other"

A family for lumping together levels that meet some criteria.

- `fct_lump_min()`: lumps levels that appear fewer than `min` times.

- `fct_lump_prop()`: lumps levels that appear in fewer than (or equal
  to) `prop * n` times.

- `fct_lump_n()` lumps all levels except for the `n` most frequent (or
  least frequent if `n < 0`)

- `fct_lump_lowfreq()` lumps together the least frequent levels,
  ensuring that "other" is still the smallest level.

`fct_lump()` exists primarily for historical reasons, as it
automatically picks between these different methods depending on its
arguments. We no longer recommend that you use it.

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

- n:

  Positive `n` preserves the most common `n` values. Negative `n`
  preserves the least common `-n` values. It there are ties, you will
  get at least `abs(n)` values.

- prop:

  Positive `prop` lumps values which do not appear at least `prop` of
  the time. Negative `prop` lumps values that do not appear at most
  `-prop` of the time.

- w:

  An optional numeric vector giving weights for frequency of each value
  (not level) in f.

- other_level:

  Value of level used for "other" values. Always placed at end of
  levels.

- ties.method:

  A character string specifying how ties are treated. See
  [`rank()`](https://rdrr.io/r/base/rank.html) for details.

- min:

  Preserve levels that appear at least `min` number of times.

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

x <- factor(letters[rpois(100, 5)])
x
#>   [1] d f f e d d d c h f d g h f f d c b b f c h h e h h c f e f d b e
#>  [34] c b f e c h d b f e e f d c g f g d d e c a b d c g e f d f f g g
#>  [67] e c f b g g b g e g i e d g g d c d i d c b d c d d f f d e d h d
#> [100] d
#> Levels: a b c d e f g h i
table(x)
#> x
#>  a  b  c  d  e  f  g  h  i 
#>  1  9 13 24 13 18 12  8  2 
table(fct_lump_lowfreq(x))
#> 
#>     b     c     d     e     f     g     h Other 
#>     9    13    24    13    18    12     8     3 

# Use positive values to collapse the rarest
fct_lump_n(x, n = 3)
#>   [1] d     f     f     e     d     d     d     c     Other f     d    
#>  [12] Other Other f     f     d     c     Other Other f     c     Other
#>  [23] Other e     Other Other c     f     e     f     d     Other e    
#>  [34] c     Other f     e     c     Other d     Other f     e     e    
#>  [45] f     d     c     Other f     Other d     d     e     c     Other
#>  [56] Other d     c     Other e     f     d     f     f     Other Other
#>  [67] e     c     f     Other Other Other Other Other e     Other Other
#>  [78] e     d     Other Other d     c     d     Other d     c     Other
#>  [89] d     c     d     d     f     f     d     e     d     Other d    
#> [100] d    
#> Levels: c d e f Other
fct_lump_prop(x, prop = 0.1)
#>   [1] d     f     f     e     d     d     d     c     Other f     d    
#>  [12] g     Other f     f     d     c     Other Other f     c     Other
#>  [23] Other e     Other Other c     f     e     f     d     Other e    
#>  [34] c     Other f     e     c     Other d     Other f     e     e    
#>  [45] f     d     c     g     f     g     d     d     e     c     Other
#>  [56] Other d     c     g     e     f     d     f     f     g     g    
#>  [67] e     c     f     Other g     g     Other g     e     g     Other
#>  [78] e     d     g     g     d     c     d     Other d     c     Other
#>  [89] d     c     d     d     f     f     d     e     d     Other d    
#> [100] d    
#> Levels: c d e f g Other

# Use negative values to collapse the most common
fct_lump_n(x, n = -3)
#>   [1] Other Other Other Other Other Other Other Other h     Other Other
#>  [12] Other h     Other Other Other Other Other Other Other Other h    
#>  [23] h     Other h     h     Other Other Other Other Other Other Other
#>  [34] Other Other Other Other Other h     Other Other Other Other Other
#>  [45] Other Other Other Other Other Other Other Other Other Other a    
#>  [56] Other Other Other Other Other Other Other Other Other Other Other
#>  [67] Other Other Other Other Other Other Other Other Other Other i    
#>  [78] Other Other Other Other Other Other Other i     Other Other Other
#>  [89] Other Other Other Other Other Other Other Other Other h     Other
#> [100] Other
#> Levels: a h i Other
fct_lump_prop(x, prop = -0.1)
#>   [1] Other Other Other Other Other Other Other Other h     Other Other
#>  [12] Other h     Other Other Other Other b     b     Other Other h    
#>  [23] h     Other h     h     Other Other Other Other Other b     Other
#>  [34] Other b     Other Other Other h     Other b     Other Other Other
#>  [45] Other Other Other Other Other Other Other Other Other Other a    
#>  [56] b     Other Other Other Other Other Other Other Other Other Other
#>  [67] Other Other Other b     Other Other b     Other Other Other i    
#>  [78] Other Other Other Other Other Other Other i     Other Other b    
#>  [89] Other Other Other Other Other Other Other Other Other h     Other
#> [100] Other
#> Levels: a b h i Other

# Use weighted frequencies
w <- c(rep(2, 50), rep(1, 50))
fct_lump_n(x, n = 5, w = w)
#>   [1] d     f     f     e     d     d     d     c     h     f     d    
#>  [12] g     h     f     f     d     c     Other Other f     c     h    
#>  [23] h     e     h     h     c     f     e     f     d     Other e    
#>  [34] c     Other f     e     c     h     d     Other f     e     e    
#>  [45] f     d     c     g     f     g     d     d     e     c     Other
#>  [56] Other d     c     g     e     f     d     f     f     g     g    
#>  [67] e     c     f     Other g     g     Other g     e     g     Other
#>  [78] e     d     g     g     d     c     d     Other d     c     Other
#>  [89] d     c     d     d     f     f     d     e     d     h     d    
#> [100] d    
#> Levels: c d e f g h Other

# Use ties.method to control how tied factors are collapsed
fct_lump_n(x, n = 6)
#>   [1] d     f     f     e     d     d     d     c     Other f     d    
#>  [12] g     Other f     f     d     c     b     b     f     c     Other
#>  [23] Other e     Other Other c     f     e     f     d     b     e    
#>  [34] c     b     f     e     c     Other d     b     f     e     e    
#>  [45] f     d     c     g     f     g     d     d     e     c     Other
#>  [56] b     d     c     g     e     f     d     f     f     g     g    
#>  [67] e     c     f     b     g     g     b     g     e     g     Other
#>  [78] e     d     g     g     d     c     d     Other d     c     b    
#>  [89] d     c     d     d     f     f     d     e     d     Other d    
#> [100] d    
#> Levels: b c d e f g Other
fct_lump_n(x, n = 6, ties.method = "max")
#>   [1] d     f     f     e     d     d     d     c     Other f     d    
#>  [12] g     Other f     f     d     c     b     b     f     c     Other
#>  [23] Other e     Other Other c     f     e     f     d     b     e    
#>  [34] c     b     f     e     c     Other d     b     f     e     e    
#>  [45] f     d     c     g     f     g     d     d     e     c     Other
#>  [56] b     d     c     g     e     f     d     f     f     g     g    
#>  [67] e     c     f     b     g     g     b     g     e     g     Other
#>  [78] e     d     g     g     d     c     d     Other d     c     b    
#>  [89] d     c     d     d     f     f     d     e     d     Other d    
#> [100] d    
#> Levels: b c d e f g Other

# Use fct_lump_min() to lump together all levels with fewer than `n` values
table(fct_lump_min(x, min = 10))
#> 
#>     c     d     e     f     g Other 
#>    13    24    13    18    12    20 
table(fct_lump_min(x, min = 15))
#> 
#>     d     f Other 
#>    24    18    58 
```
