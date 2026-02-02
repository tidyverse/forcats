# Anonymise factor levels

Replaces factor levels with arbitrary numeric identifiers. Neither the
values nor the order of the levels are preserved.

## Usage

``` r
fct_anon(f, prefix = "")
```

## Arguments

- f:

  A factor.

- prefix:

  A character prefix to insert in front of the random labels.

## Examples

``` r
gss_cat$relig |> fct_count()
#> # A tibble: 16 × 2
#>    f                           n
#>    <fct>                   <int>
#>  1 No answer                  93
#>  2 Don't know                 15
#>  3 Inter-nondenominational   109
#>  4 Native american            23
#>  5 Christian                 689
#>  6 Orthodox-christian         95
#>  7 Moslem/islam              104
#>  8 Other eastern              32
#>  9 Hinduism                   71
#> 10 Buddhism                  147
#> 11 Other                     224
#> 12 None                     3523
#> 13 Jewish                    388
#> 14 Catholic                 5124
#> 15 Protestant              10846
#> 16 Not applicable              0
gss_cat$relig |>
  fct_anon() |>
  fct_count()
#> # A tibble: 16 × 2
#>    f         n
#>    <fct> <int>
#>  1 01    10846
#>  2 02      224
#>  3 03     3523
#>  4 04      109
#>  5 05       95
#>  6 06       23
#>  7 07       71
#>  8 08       32
#>  9 09      689
#> 10 10      147
#> 11 11      104
#> 12 12     5124
#> 13 13      388
#> 14 14        0
#> 15 15       93
#> 16 16       15
gss_cat$relig |>
  fct_anon("X") |>
  fct_count()
#> # A tibble: 16 × 2
#>    f         n
#>    <fct> <int>
#>  1 X01    3523
#>  2 X02     109
#>  3 X03     104
#>  4 X04     689
#>  5 X05     224
#>  6 X06      23
#>  7 X07    5124
#>  8 X08       0
#>  9 X09      32
#> 10 X10     147
#> 11 X11     388
#> 12 X12      93
#> 13 X13      15
#> 14 X14      95
#> 15 X15      71
#> 16 X16   10846
```
