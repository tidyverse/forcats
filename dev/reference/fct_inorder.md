# Reorder factor levels by first appearance, frequency, or numeric order

This family of functions changes only the order of the levels.

- `fct_inorder()`: by the order in which they first appear.

- `fct_infreq()`: by number of observations with each level (largest
  first)

- `fct_inseq()`: by numeric value of level.

## Usage

``` r
fct_inorder(f, ordered = NA)

fct_infreq(f, w = NULL, ordered = NA)

fct_inseq(f, ordered = NA)
```

## Arguments

- f:

  A factor

- ordered:

  A logical which determines the "ordered" status of the output factor.
  `NA` preserves the existing status of the factor.

- w:

  An optional numeric vector giving weights for frequency of each value
  (not level) in `f`.

## Examples

``` r
f <- factor(c("b", "b", "a", "c", "c", "c"))
f
#> [1] b b a c c c
#> Levels: a b c
fct_inorder(f)
#> [1] b b a c c c
#> Levels: b a c
fct_infreq(f)
#> [1] b b a c c c
#> Levels: c b a

f <- factor(1:3, levels = c("3", "2", "1"))
f
#> [1] 1 2 3
#> Levels: 3 2 1
fct_inseq(f)
#> [1] 1 2 3
#> Levels: 1 2 3
```
