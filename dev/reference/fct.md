# Create a factor

`fct()` is a stricter version of
[`factor()`](https://rdrr.io/r/base/factor.html) that errors if your
specification of `levels` is inconsistent with the values in `x`.

## Usage

``` r
fct(x = character(), levels = NULL, na = character())
```

## Arguments

- x:

  A character vector. Values must occur in either `levels` or `na`.

- levels:

  A character vector of known levels. If not supplied, will be computed
  from the unique values of `x`, in the order in which they occur.

- na:

  A character vector of values that should become missing values.

## Value

A factor.

## Examples

``` r
# Use factors when you know the set of possible values a variable might take
x <- c("A", "O", "O", "AB", "A")
fct(x, levels = c("O", "A", "B", "AB"))
#> [1] A  O  O  AB A 
#> Levels: O A B AB

# If you don't specify the levels, fct will create from the data
# in the order that they're seen
fct(x)
#> [1] A  O  O  AB A 
#> Levels: A O AB


# Differences with base R -----------------------------------------------
# factor() silently generates NAs
x <- c("a", "b", "c")
factor(x, levels = c("a", "b"))
#> [1] a    b    <NA>
#> Levels: a b
# fct() errors
try(fct(x, levels = c("a", "b")))
#> Error in fct(x, levels = c("a", "b")) : 
#>   All values of `x` must appear in `levels` or `na`
#> ℹ Missing level: "c"
# Unless you explicitly supply NA:
fct(x, levels = c("a", "b"), na = "c")
#> [1] a    b    <NA>
#> Levels: a b

# factor() sorts default levels:
factor(c("y", "x"))
#> [1] y x
#> Levels: x y
# fct() uses in order of appearance:
fct(c("y", "x"))
#> [1] y x
#> Levels: y x
```
