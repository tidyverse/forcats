# Convert input to a factor

Compared to base R, when `x` is a character, this function creates
levels in the order in which they appear, which will be the same on
every platform. (Base R sorts in the current locale which can vary from
place to place.) When `x` is numeric, the ordering is based on the
numeric value and consistent with base R.

## Usage

``` r
as_factor(x, ...)

# S3 method for class 'factor'
as_factor(x, ...)

# S3 method for class 'character'
as_factor(x, ...)

# S3 method for class 'numeric'
as_factor(x, ...)

# S3 method for class 'logical'
as_factor(x, ...)
```

## Arguments

- x:

  Object to coerce to a factor.

- ...:

  Other arguments passed down to method.

## Details

This is a generic function.

## Examples

``` r
# Character object
x <- c("a", "z", "g")
as_factor(x)
#> [1] a z g
#> Levels: a z g
as.factor(x)
#> [1] a z g
#> Levels: a g z

# Character object containing numbers
y <- c("1.1", "11", "2.2", "22")
as_factor(y)
#> [1] 1.1 11  2.2 22 
#> Levels: 1.1 11 2.2 22
as.factor(y)
#> [1] 1.1 11  2.2 22 
#> Levels: 1.1 11 2.2 22

# Numeric object
z <- as.numeric(y)
as_factor(z)
#> [1] 1.1 11  2.2 22 
#> Levels: 1.1 2.2 11 22
as.factor(z)
#> [1] 1.1 11  2.2 22 
#> Levels: 1.1 2.2 11 22
```
