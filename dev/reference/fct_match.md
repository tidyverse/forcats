# Test for presence of levels in a factor

Do any of `lvls` occur in `f`? Compared to
[`%in%`](https://rdrr.io/r/base/match.html), this function validates
`lvls` to ensure that they're actually present in `f`. In other words,
`x %in% "not present"` will return `FALSE`, but
`fct_match(x, "not present")` will throw an error.

## Usage

``` r
fct_match(f, lvls)
```

## Arguments

- f:

  A factor (or character vector).

- lvls:

  A character vector specifying levels to look for.

## Value

A logical vector

## Examples

``` r
table(fct_match(gss_cat$marital, c("Married", "Divorced")))
#> 
#> FALSE  TRUE 
#>  7983 13500 

# Compare to %in%, misspelled levels throw an error
table(gss_cat$marital %in% c("Maried", "Davorced"))
#> 
#> FALSE 
#> 21483 
if (FALSE) { # \dontrun{
table(fct_match(gss_cat$marital, c("Maried", "Davorced")))
} # }
```
