# Convert between `NA` values and `NA` levels

There are two ways to represent missing values in factors: in the values
and in the levels. `NA`s in the values are most useful for data analysis
(since [`is.na()`](https://rdrr.io/r/base/NA.html) returns what you
expect), but because the `NA` is not explicitly recorded in the levels,
there's no way to control its position (it's almost always displayed
last or not at all). Putting the `NA`s in the levels allows you to
control its display, at the cost of losing accurate
[`is.na()`](https://rdrr.io/r/base/NA.html) reporting.

(It is possible to have a factor with missing values in both the values
and the levels but it requires some explicit gymnastics and we don't
recommend it.)

## Usage

``` r
fct_na_value_to_level(f, level = NA)

fct_na_level_to_value(f, extra_levels = NULL)
```

## Arguments

- f:

  A factor (or character vector).

- level:

  Optionally, instead of converting the `NA` values to an `NA` level,
  convert it to a level with this value.

- extra_levels:

  Optionally, a character vector giving additional levels that should
  also be converted to `NA` values.

## Examples

``` r
# Most factors store NAs in the values:
f1 <- fct(c("a", "b", NA, "c", "b", NA))
levels(f1)
#> [1] "a" "b" "c"
as.integer(f1)
#> [1]  1  2 NA  3  2 NA
is.na(f1)
#> [1] FALSE FALSE  TRUE FALSE FALSE  TRUE

# But it's also possible to store them in the levels
f2 <- fct_na_value_to_level(f1)
levels(f2)
#> [1] "a" "b" "c" NA 
as.integer(f2)
#> [1] 1 2 4 3 2 4
is.na(f2)
#> [1] FALSE FALSE FALSE FALSE FALSE FALSE

# If needed, you can convert back to NAs in the values:
f3 <- fct_na_level_to_value(f2)
levels(f3)
#> [1] "a" "b" "c"
as.integer(f3)
#> [1]  1  2 NA  3  2 NA
is.na(f3)
#> [1] FALSE FALSE  TRUE FALSE FALSE  TRUE
```
