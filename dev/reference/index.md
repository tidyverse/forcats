# Package index

## Change order of levels

Keep the values of the levels the same, but change their order. These
are particularly useful for models, tables, and visualisations.

- [`fct_relevel()`](https://forcats.tidyverse.org/dev/reference/fct_relevel.md)
  : Reorder factor levels by hand
- [`fct_inorder()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  [`fct_infreq()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  [`fct_inseq()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  : Reorder factor levels by first appearance, frequency, or numeric
  order
- [`fct_reorder()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  [`fct_reorder2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  [`last2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  [`first2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  : Reorder factor levels by sorting along another variable
- [`fct_shuffle()`](https://forcats.tidyverse.org/dev/reference/fct_shuffle.md)
  : Randomly permute factor levels
- [`fct_rev()`](https://forcats.tidyverse.org/dev/reference/fct_rev.md)
  : Reverse order of factor levels
- [`fct_shift()`](https://forcats.tidyverse.org/dev/reference/fct_shift.md)
  : Shift factor levels to left or right, wrapping around at end

## Change value of levels

Change factor levels, while preserving order (as much as possible).

- [`fct_anon()`](https://forcats.tidyverse.org/dev/reference/fct_anon.md)
  : Anonymise factor levels
- [`fct_collapse()`](https://forcats.tidyverse.org/dev/reference/fct_collapse.md)
  : Collapse factor levels into manually defined groups
- [`fct_lump()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  [`fct_lump_min()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  [`fct_lump_prop()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  [`fct_lump_n()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  [`fct_lump_lowfreq()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  : Lump uncommon factor levels together into "other"
- [`fct_other()`](https://forcats.tidyverse.org/dev/reference/fct_other.md)
  : Manually replace levels with "other"
- [`fct_recode()`](https://forcats.tidyverse.org/dev/reference/fct_recode.md)
  : Change factor levels by hand
- [`fct_relabel()`](https://forcats.tidyverse.org/dev/reference/fct_relabel.md)
  : Relabel factor levels with a function, collapsing as necessary

## Add/remove levels

Leave existing data as is, but add or remove levels.

- [`fct_expand()`](https://forcats.tidyverse.org/dev/reference/fct_expand.md)
  : Add additional levels to a factor

- [`fct_drop()`](https://forcats.tidyverse.org/dev/reference/fct_drop.md)
  : Drop unused levels

- [`fct_na_value_to_level()`](https://forcats.tidyverse.org/dev/reference/fct_na_value_to_level.md)
  [`fct_na_level_to_value()`](https://forcats.tidyverse.org/dev/reference/fct_na_value_to_level.md)
  :

  Convert between `NA` values and `NA` levels

- [`fct_unify()`](https://forcats.tidyverse.org/dev/reference/fct_unify.md)
  : Unify the levels in a list of factors

## Combine multiple factors

- [`fct_c()`](https://forcats.tidyverse.org/dev/reference/fct_c.md) :
  Concatenate factors, combining levels
- [`fct_cross()`](https://forcats.tidyverse.org/dev/reference/fct_cross.md)
  : Combine levels from two or more factors to create a new factor

## Other helpers

- [`fct()`](https://forcats.tidyverse.org/dev/reference/fct.md) : Create
  a factor
- [`as_factor()`](https://forcats.tidyverse.org/dev/reference/as_factor.md)
  : Convert input to a factor
- [`fct_count()`](https://forcats.tidyverse.org/dev/reference/fct_count.md)
  : Count entries in a factor
- [`fct_match()`](https://forcats.tidyverse.org/dev/reference/fct_match.md)
  : Test for presence of levels in a factor
- [`fct_unique()`](https://forcats.tidyverse.org/dev/reference/fct_unique.md)
  : Unique values of a factor, as a factor
- [`lvls_reorder()`](https://forcats.tidyverse.org/dev/reference/lvls.md)
  [`lvls_revalue()`](https://forcats.tidyverse.org/dev/reference/lvls.md)
  [`lvls_expand()`](https://forcats.tidyverse.org/dev/reference/lvls.md)
  : Low-level functions for manipulating levels
- [`lvls_union()`](https://forcats.tidyverse.org/dev/reference/lvls_union.md)
  : Find all levels in a list of factors

## Data

- [`gss_cat`](https://forcats.tidyverse.org/dev/reference/gss_cat.md) :
  A sample of categorical variables from the General Social survey
