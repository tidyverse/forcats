# Combine levels from two or more factors to create a new factor

Computes a factor whose levels are all the combinations of the levels of
the input factors.

## Usage

``` r
fct_cross(..., sep = ":", keep_empty = FALSE)
```

## Arguments

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  Additional factors or character vectors.

- sep:

  A character string to separate the levels

- keep_empty:

  If TRUE, keep combinations with no observations as levels

## Value

The new factor

## Examples

``` r
fruit <- factor(c("apple", "kiwi", "apple", "apple"))
colour <- factor(c("green", "green", "red", "green"))
eaten <- c("yes", "no", "yes", "no")
fct_cross(fruit, colour)
#> [1] apple:green kiwi:green  apple:red   apple:green
#> Levels: apple:green apple:red kiwi:green
fct_cross(fruit, colour, eaten)
#> [1] apple:green:yes kiwi:green:no   apple:red:yes   apple:green:no 
#> 4 Levels: apple:green:no apple:green:yes ... kiwi:green:no
fct_cross(fruit, colour, keep_empty = TRUE)
#> [1] apple:green kiwi:green  apple:red   apple:green
#> Levels: apple:green apple:red kiwi:green kiwi:red
```
