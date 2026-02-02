# Change factor levels by hand

Change factor levels by hand

## Usage

``` r
fct_recode(.f, ...)
```

## Arguments

- .f:

  A factor (or character vector).

- ...:

  \<[`dynamic-dots`](https://rlang.r-lib.org/reference/dyn-dots.html)\>
  A sequence of named character vectors where the name gives the new
  level, and the value gives the old level. Levels not otherwise
  mentioned will be left as is. Levels can be removed by naming them
  `NULL`.

## Examples

``` r
x <- factor(c("apple", "bear", "banana", "dear"))
fct_recode(x, fruit = "apple", fruit = "banana")
#> [1] fruit bear  fruit dear 
#> Levels: fruit bear dear

# If you make a mistake you'll get a warning
fct_recode(x, fruit = "apple", fruit = "bananana")
#> Warning: Unknown levels in `f`: bananana
#> [1] fruit  bear   banana dear  
#> Levels: fruit banana bear dear

# If you name the level NULL it will be removed
fct_recode(x, NULL = "apple", fruit = "banana")
#> [1] <NA>  bear  fruit dear 
#> Levels: fruit bear dear

# Wrap the left hand side in quotes if it contains special variables
fct_recode(x, "an apple" = "apple", "a bear" = "bear")
#> [1] an apple a bear   banana   dear    
#> Levels: an apple banana a bear dear

# When passing a named vector to rename levels use !!! to splice
x <- factor(c("apple", "bear", "banana", "dear"))
levels <- c(fruit = "apple", fruit = "banana")
fct_recode(x, !!!levels)
#> [1] fruit bear  fruit dear 
#> Levels: fruit bear dear
```
