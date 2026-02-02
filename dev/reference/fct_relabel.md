# Relabel factor levels with a function, collapsing as necessary

Relabel factor levels with a function, collapsing as necessary

## Usage

``` r
fct_relabel(.f, .fun, ...)
```

## Arguments

- .f:

  A factor (or character vector).

- .fun:

  A function to be applied to each level. Must accept one character
  argument and return a character vector of the same length as its
  input.

  You can also use lambda notation, `\(x)`. `\(x) paste(x, "y")` is
  equivalent to `function(x) paste(x, "y")` or
  `function(.) paste(., "y")`.

- ...:

  Additional arguments to `fun`.

## Examples

``` r
gss_cat$partyid |> fct_count()
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
gss_cat$partyid |>
  fct_relabel(\(x) gsub(",", ", ", x)) |>
  fct_count()
#> # A tibble: 10 × 2
#>    f                      n
#>    <fct>              <int>
#>  1 No answer            154
#>  2 Don't know             1
#>  3 Other party          393
#>  4 Strong republican   2314
#>  5 Not str republican  3032
#>  6 Ind, near rep       1791
#>  7 Independent         4119
#>  8 Ind, near dem       2499
#>  9 Not str democrat    3690
#> 10 Strong democrat     3490

convert_income <- function(x) {
  regex <- "^(?:Lt |)[$]([0-9]+).*$"
  is_range <- grepl(regex, x)
  num_income <- as.numeric(gsub(regex, "\\1", x[is_range]))
  num_income <- trunc(num_income / 5000) * 5000
  x[is_range] <- paste0("Gt $", num_income)
  x
}
fct_count(gss_cat$rincome)
#> # A tibble: 16 × 2
#>    f                  n
#>    <fct>          <int>
#>  1 No answer        183
#>  2 Don't know       267
#>  3 Refused          975
#>  4 $25000 or more  7363
#>  5 $20000 - 24999  1283
#>  6 $15000 - 19999  1048
#>  7 $10000 - 14999  1168
#>  8 $8000 to 9999    340
#>  9 $7000 to 7999    188
#> 10 $6000 to 6999    215
#> 11 $5000 to 5999    227
#> 12 $4000 to 4999    226
#> 13 $3000 to 3999    276
#> 14 $1000 to 2999    395
#> 15 Lt $1000         286
#> 16 Not applicable  7043
convert_income(levels(gss_cat$rincome))
#>  [1] "No answer"      "Don't know"     "Refused"       
#>  [4] "Gt $25000"      "Gt $20000"      "Gt $15000"     
#>  [7] "Gt $10000"      "Gt $5000"       "Gt $5000"      
#> [10] "Gt $5000"       "Gt $5000"       "Gt $0"         
#> [13] "Gt $0"          "Gt $0"          "Gt $0"         
#> [16] "Not applicable"
rincome2 <- fct_relabel(gss_cat$rincome, convert_income)
fct_count(rincome2)
#> # A tibble: 10 × 2
#>    f                  n
#>    <fct>          <int>
#>  1 No answer        183
#>  2 Don't know       267
#>  3 Refused          975
#>  4 Gt $25000       7363
#>  5 Gt $20000       1283
#>  6 Gt $15000       1048
#>  7 Gt $10000       1168
#>  8 Gt $5000         970
#>  9 Gt $0           1183
#> 10 Not applicable  7043
```
