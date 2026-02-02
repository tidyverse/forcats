# Low-level functions for manipulating levels

`lvls_reorder` leaves values as they are, but changes the order.
`lvls_revalue` changes the values of existing levels; there must be one
new level for each old level. `lvls_expand` expands the set of levels;
the new levels must include the old levels.

## Usage

``` r
lvls_reorder(f, idx, ordered = NA)

lvls_revalue(f, new_levels)

lvls_expand(f, new_levels)
```

## Arguments

- f:

  A factor (or character vector).

- idx:

  A integer index, with one integer for each existing level.

- ordered:

  A logical which determines the "ordered" status of the output factor.
  `NA` preserves the existing status of the factor.

- new_levels:

  A character vector of new levels.

## Details

These functions are less helpful than the higher-level `fct_` functions,
but are safer than the very low-level manipulation of levels directly,
because they are more specific, and hence can more carefully check their
arguments.

## Examples

``` r
f <- factor(c("a", "b", "c"))
lvls_reorder(f, 3:1)
#> [1] a b c
#> Levels: c b a
lvls_revalue(f, c("apple", "banana", "carrot"))
#> [1] apple  banana carrot
#> Levels: apple banana carrot
lvls_expand(f, c("a", "b", "c", "d"))
#> [1] a b c
#> Levels: a b c d
```
