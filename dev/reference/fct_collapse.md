# Collapse factor levels into manually defined groups

Collapse factor levels into manually defined groups

## Usage

``` r
fct_collapse(.f, ..., other_level = NULL, group_other = "DEPRECATED")
```

## Arguments

- .f:

  A factor (or character vector).

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  A series of named character vectors. The levels in each vector will be
  replaced with the name.

- other_level:

  Value of level used for "other" values. Always placed at end of
  levels.

- group_other:

  Deprecated. Replace all levels not named in `...` with "Other"?

## Examples

``` r
fct_count(gss_cat$partyid)
#> # A tibble: 10 × 2
#>    f                      n
#>    <fct>              <int>
#>  1 No answer            154
#>  2 Don't know             1
#>  3 Other party          393
#>  4 Strong republican   2314
#>  5 Not str republican  3032
#>  6 Ind,near rep        1791
#>  7 Independent         4119
#>  8 Ind,near dem        2499
#>  9 Not str democrat    3690
#> 10 Strong democrat     3490

partyid2 <- fct_collapse(gss_cat$partyid,
  missing = c("No answer", "Don't know"),
  other = "Other party",
  rep = c("Strong republican", "Not str republican"),
  ind = c("Ind,near rep", "Independent", "Ind,near dem"),
  dem = c("Not str democrat", "Strong democrat")
)
fct_count(partyid2)
#> # A tibble: 5 × 2
#>   f           n
#>   <fct>   <int>
#> 1 missing   155
#> 2 other     393
#> 3 rep      5346
#> 4 ind      8409
#> 5 dem      7180
```
