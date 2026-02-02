# Count entries in a factor

Count entries in a factor

## Usage

``` r
fct_count(f, sort = FALSE, prop = FALSE)
```

## Arguments

- f:

  A factor (or character vector).

- sort:

  If `TRUE`, sort the result so that the most common values float to the
  top.

- prop:

  If `TRUE`, compute the fraction of marginal table.

## Value

A tibble with columns `f`, `n` and `p`, if prop is `TRUE`.

## Examples

``` r
f <- factor(sample(letters)[rpois(1000, 10)])
table(f)
#> f
#>   b   c   e   f   h   j   k   l   m   n   o   q   r   s   t   u   v 
#>  11  64 122   2 117  14  25  93  43  51 102   1 107   6  51 132   5 
#>   x   z 
#>   1  53 
fct_count(f)
#> # A tibble: 19 × 2
#>    f         n
#>    <fct> <int>
#>  1 b        11
#>  2 c        64
#>  3 e       122
#>  4 f         2
#>  5 h       117
#>  6 j        14
#>  7 k        25
#>  8 l        93
#>  9 m        43
#> 10 n        51
#> 11 o       102
#> 12 q         1
#> 13 r       107
#> 14 s         6
#> 15 t        51
#> 16 u       132
#> 17 v         5
#> 18 x         1
#> 19 z        53
fct_count(f, sort = TRUE)
#> # A tibble: 19 × 2
#>    f         n
#>    <fct> <int>
#>  1 u       132
#>  2 e       122
#>  3 h       117
#>  4 r       107
#>  5 o       102
#>  6 l        93
#>  7 c        64
#>  8 z        53
#>  9 n        51
#> 10 t        51
#> 11 m        43
#> 12 k        25
#> 13 j        14
#> 14 b        11
#> 15 s         6
#> 16 v         5
#> 17 f         2
#> 18 q         1
#> 19 x         1
fct_count(f, sort = TRUE, prop = TRUE)
#> # A tibble: 19 × 3
#>    f         n     p
#>    <fct> <int> <dbl>
#>  1 u       132 0.132
#>  2 e       122 0.122
#>  3 h       117 0.117
#>  4 r       107 0.107
#>  5 o       102 0.102
#>  6 l        93 0.093
#>  7 c        64 0.064
#>  8 z        53 0.053
#>  9 n        51 0.051
#> 10 t        51 0.051
#> 11 m        43 0.043
#> 12 k        25 0.025
#> 13 j        14 0.014
#> 14 b        11 0.011
#> 15 s         6 0.006
#> 16 v         5 0.005
#> 17 f         2 0.002
#> 18 q         1 0.001
#> 19 x         1 0.001
```
