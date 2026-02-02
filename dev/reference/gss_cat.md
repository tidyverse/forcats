# A sample of categorical variables from the General Social survey

A sample of categorical variables from the General Social survey

## Usage

``` r
gss_cat
```

## Format

- year:

  year of survey, 2000–2014 (every other year)

- age:

  age. Maximum age truncated to 89.

- marital:

  marital status

- race:

  race

- rincome:

  reported income

- partyid:

  party affiliation

- relig:

  religion

- denom:

  denomination

- tvhours:

  hours per day watching tv

## Source

Downloaded from <https://gssdataexplorer.norc.org/>.

## Examples

``` r
gss_cat
#> # A tibble: 21,483 × 9
#>     year marital         age race  rincome  partyid relig denom tvhours
#>    <int> <fct>         <int> <fct> <fct>    <fct>   <fct> <fct>   <int>
#>  1  2000 Never married    26 White $8000 t… Ind,ne… Prot… Sout…      12
#>  2  2000 Divorced         48 White $8000 t… Not st… Prot… Bapt…      NA
#>  3  2000 Widowed          67 White Not app… Indepe… Prot… No d…       2
#>  4  2000 Never married    39 White Not app… Ind,ne… Orth… Not …       4
#>  5  2000 Divorced         25 White Not app… Not st… None  Not …       1
#>  6  2000 Married          25 White $20000 … Strong… Prot… Sout…      NA
#>  7  2000 Never married    36 White $25000 … Not st… Chri… Not …       3
#>  8  2000 Divorced         44 White $7000 t… Ind,ne… Prot… Luth…      NA
#>  9  2000 Married          44 White $25000 … Not st… Prot… Other       0
#> 10  2000 Married          47 White $25000 … Strong… Prot… Sout…       3
#> # ℹ 21,473 more rows

fct_count(gss_cat$relig)
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
fct_count(fct_lump(gss_cat$relig))
#> # A tibble: 2 × 2
#>   f              n
#>   <fct>      <int>
#> 1 Protestant 10846
#> 2 Other      10637
```
