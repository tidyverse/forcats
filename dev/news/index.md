# Changelog

## forcats (development version)

## forcats 1.0.1

CRAN release: 2025-09-25

- [`fct_cross()`](https://forcats.tidyverse.org/dev/reference/fct_cross.md)
  now varies the levels in the last factor fastest
  ([@Adam-AKong](https://github.com/Adam-AKong),
  [\#373](https://github.com/tidyverse/forcats/issues/373)).
- Functions that create a new factor
  (e.g. [`lvls_expand()`](https://forcats.tidyverse.org/dev/reference/lvls.md),
  [`lvls_reorder()`](https://forcats.tidyverse.org/dev/reference/lvls.md),
  [`fct_lump_n()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md),
  [`fct_drop()`](https://forcats.tidyverse.org/dev/reference/fct_drop.md))
  now preserves the class of the original object in addition to the
  attributes ([\#83](https://github.com/tidyverse/forcats/issues/83)).
- forcats now requires R 4.1.

## forcats 1.0.0

CRAN release: 2023-01-29

### New features

- New
  [`fct_na_value_to_level()`](https://forcats.tidyverse.org/dev/reference/fct_na_value_to_level.md)
  and
  [`fct_na_level_to_value()`](https://forcats.tidyverse.org/dev/reference/fct_na_value_to_level.md)
  to convert NA values to NA levels and vice versa
  ([\#337](https://github.com/tidyverse/forcats/issues/337)).

### Minor improvement and bug fixes

- All functions now validate their inputs, giving more useful errors if
  you accidentally misspecify an input.

- [`fct_collapse()`](https://forcats.tidyverse.org/dev/reference/fct_collapse.md)
  can now use `other_level = NA`
  ([\#291](https://github.com/tidyverse/forcats/issues/291)).

- [`fct_count()`](https://forcats.tidyverse.org/dev/reference/fct_count.md)
  works with factors that contain `NA`s in levels.

- [`fct_explicit_na()`](https://forcats.tidyverse.org/dev/reference/fct_explicit_na.md)
  is deprecated in favour of
  [`fct_na_value_to_level()`](https://forcats.tidyverse.org/dev/reference/fct_na_value_to_level.md).

- [`fct_expand()`](https://forcats.tidyverse.org/dev/reference/fct_expand.md)
  gains an `after` argument so that you can choose where the new levels
  are placed ([\#138](https://github.com/tidyverse/forcats/issues/138)).

- [`fct_infreq()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  gains the ability to weight by another variable using the `w` argument
  ([\#261](https://github.com/tidyverse/forcats/issues/261)).

- [`fct_inorder()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  now works when not all levels appear in the data
  ([\#262](https://github.com/tidyverse/forcats/issues/262)).

- [`fct_lump_prop()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  and friends now work correctly if you supply weights and have empty
  levels ([\#292](https://github.com/tidyverse/forcats/issues/292)).

- [`fct_lump_n()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  and
  [`fct_lump_prop()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  will now create an “Other” level even if it only consists of a single
  level. This makes them consistent with the other `fct_lump_*`
  functions ([\#274](https://github.com/tidyverse/forcats/issues/274)).

- [`fct_other()`](https://forcats.tidyverse.org/dev/reference/fct_other.md)
  no longer generates a warning if no levels are replaced with other
  ([\#265](https://github.com/tidyverse/forcats/issues/265)).

- [`fct_relevel()`](https://forcats.tidyverse.org/dev/reference/fct_relevel.md),
  [`fct_cross()`](https://forcats.tidyverse.org/dev/reference/fct_cross.md),
  and
  [`fct_expand()`](https://forcats.tidyverse.org/dev/reference/fct_expand.md)
  now error if you name the arguments in `...` since those names are
  ignored and your code probably doesn’t do what you think it does
  ([\#319](https://github.com/tidyverse/forcats/issues/319)).

- [`fct_reorder()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  and
  [`fct_reorder2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  now remove `NA` values in `.x` with a warning (like
  [`ggplot2::geom_point()`](https://ggplot2.tidyverse.org/reference/geom_point.html)
  and friends). You can suppress the warning by setting `.na_rm = TRUE`
  ([\#315](https://github.com/tidyverse/forcats/issues/315)).

- [`fct_reorder()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  and
  [`fct_reorder2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  gain a new `.default` argument that controls the placement of empty
  levels (including levels that might become empty after removing
  missing values in `.x`)
  ([\#266](https://github.com/tidyverse/forcats/issues/266)).

- [`fct_unique()`](https://forcats.tidyverse.org/dev/reference/fct_unique.md)
  now captures implicit missing values if present
  ([\#293](https://github.com/tidyverse/forcats/issues/293)).

## forcats 0.5.2

CRAN release: 2022-08-19

- New [`fct()`](https://forcats.tidyverse.org/dev/reference/fct.md)
  which works like [`factor()`](https://rdrr.io/r/base/factor.html) but
  errors if values of `x` are not included in the levels specification
  ([\#299](https://github.com/tidyverse/forcats/issues/299))

- [`first2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  and
  [`last2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  now ignore missing values in both `x` and `y`
  ([\#303](https://github.com/tidyverse/forcats/issues/303)).

- Error messages are more informative.

## forcats 0.5.1

CRAN release: 2021-01-27

- Re-license as MIT
  ([\#277](https://github.com/tidyverse/forcats/issues/277)).

- [`fct_lump_n()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  no longer uses a partial argument name
  ([@malcolmbarrett](https://github.com/malcolmbarrett),
  [\#276](https://github.com/tidyverse/forcats/issues/276)).

## forcats 0.5.0

CRAN release: 2020-03-01

- [`as_factor()`](https://forcats.tidyverse.org/dev/reference/as_factor.md)
  gains a logical method that always returns a factor with levels
  “FALSE” and “TRUE”
  ([\#185](https://github.com/tidyverse/forcats/issues/185)).

- [`fct_c()`](https://forcats.tidyverse.org/dev/reference/fct_c.md),
  [`fct_collapse()`](https://forcats.tidyverse.org/dev/reference/fct_collapse.md)
  and
  [`fct_recode()`](https://forcats.tidyverse.org/dev/reference/fct_recode.md)
  are now explicitly documented as using [dynamic
  dots](https://rlang.r-lib.org/reference/dyn-dots.html)
  ([@labouz](https://github.com/labouz),
  [\#234](https://github.com/tidyverse/forcats/issues/234)).

- [`fct_collapse()`](https://forcats.tidyverse.org/dev/reference/fct_collapse.md)
  now accepts a `other_level` argument, to allow a user-specified
  `Other` level ([@gtm19](https://github.com/gtm19),
  [\#194](https://github.com/tidyverse/forcats/issues/194)). It now
  correctly collapses factors when `other_level` is not `NULL`
  ([\#172](https://github.com/tidyverse/forcats/issues/172)), and makes
  `"Other"` the last level
  ([\#202](https://github.com/tidyverse/forcats/issues/202))
  ([@gtm19](https://github.com/gtm19),
  [\#172](https://github.com/tidyverse/forcats/issues/172) &
  [\#202](https://github.com/tidyverse/forcats/issues/202))

- [`fct_count()`](https://forcats.tidyverse.org/dev/reference/fct_count.md)
  no longer converts implicit NAs into explicit NAs
  ([\#151](https://github.com/tidyverse/forcats/issues/151)).

- [`fct_inseq()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  behaves more robustly when factor levels aren’t all numbers
  ([\#221](https://github.com/tidyverse/forcats/issues/221)).

- [`fct_lump()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  has been split up into three new functions:
  [`fct_lump_prop()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md),
  [`fct_lump_n()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md),
  and
  [`fct_lump_lowfreq()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md).
  ([@jonocarroll](https://github.com/jonocarroll),
  [\#167](https://github.com/tidyverse/forcats/issues/167),
  [\#142](https://github.com/tidyverse/forcats/issues/142)). All
  `fct_lump_()` functions check their inputs more carefully
  ([@robinson_es](https://github.com/robinson_es),
  [\#169](https://github.com/tidyverse/forcats/issues/169))

- [`fct_reorder2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  gains a helper function
  [`first2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md),
  that sorts `.y` by the first value of `.x`
  ([@jtr13](https://github.com/jtr13)).

## forcats 0.4.0

CRAN release: 2019-02-17

### New features

- [`fct_collapse()`](https://forcats.tidyverse.org/dev/reference/fct_collapse.md)
  gains a `group_other` argument to allow you to group all un-named
  levels into `"Other"`.
  ([\#100](https://github.com/tidyverse/forcats/issues/100),
  [@AmeliaMN](https://github.com/AmeliaMN))

- [`fct_cross()`](https://forcats.tidyverse.org/dev/reference/fct_cross.md)
  creates a new factor containing the combined levels from two or more
  input factors, similar to
  [`base::interaction`](https://rdrr.io/r/base/interaction.html)
  ([@tslumley](https://github.com/tslumley),
  [\#136](https://github.com/tidyverse/forcats/issues/136))

- [`fct_inseq()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  reorders labels in numeric order, if possible
  ([\#145](https://github.com/tidyverse/forcats/issues/145),
  [@kbodwin](https://github.com/kbodwin)).

- [`fct_lump_min()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  preserves levels that appear at least `min` times (can also be used
  with the `w` weighted argument)
  ([@robinsones](https://github.com/robinsones),
  [\#142](https://github.com/tidyverse/forcats/issues/142)).

- [`fct_match()`](https://forcats.tidyverse.org/dev/reference/fct_match.md)
  performs validated matching, providing a safer alternative to
  `f %in% c("x", "y")` which silently returns `FALSE` if `"x"` or `"y"`
  are not levels of `f` (e.g. because of a typo)
  ([\#126](https://github.com/tidyverse/forcats/issues/126),
  [@jonocarroll](https://github.com/jonocarroll)).

- [`fct_relevel()`](https://forcats.tidyverse.org/dev/reference/fct_relevel.md)
  can now level factors using a function that is passed the current
  levels ([\#117](https://github.com/tidyverse/forcats/issues/117)).

- [`as_factor()`](https://forcats.tidyverse.org/dev/reference/as_factor.md)
  now has a numeric method. By default, orders factors in numeric order,
  unlike the other methods which default to order of appearance.
  ([\#145](https://github.com/tidyverse/forcats/issues/145),
  [@kbodwin](https://github.com/kbodwin))

### Minor bug fixes and improvements

- [`fct_count()`](https://forcats.tidyverse.org/dev/reference/fct_count.md)
  gains a parameter to also compute the proportion
  ([@zhiiiyang](https://github.com/zhiiiyang),
  [\#146](https://github.com/tidyverse/forcats/issues/146)).

- [`fct_lump()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  now does not change the label if no lumping occurs
  ([@zhiiiyang](https://github.com/zhiiiyang),
  [\#130](https://github.com/tidyverse/forcats/issues/130)).

- [`fct_relabel()`](https://forcats.tidyverse.org/dev/reference/fct_relabel.md)
  now accepts character input.

- [`fct_reorder()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  and
  [`fct_reorder2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  no longer require that the summary function return a numeric vector of
  length 1; instead it can return any orderable vector of length 1
  ([\#147](https://github.com/tidyverse/forcats/issues/147)).

- [`fct_reorder()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md),
  [`fct_reorder2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  and
  [`as_factor()`](https://forcats.tidyverse.org/dev/reference/as_factor.md)
  now use the ellipsis package to warn if you pass in named components
  to `...` ([\#174](https://github.com/tidyverse/forcats/issues/174)).

## forcats 0.3.0

CRAN release: 2018-02-19

### API changes

- [`fct_c()`](https://forcats.tidyverse.org/dev/reference/fct_c.md) now
  requires explicit splicing with `!!!` if you have a list of factors
  that you want to combine. This is consistent with an emerging
  standards for handling `...` throughout the tidyverse.

- [`fct_reorder()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  and
  [`fct_reorder2()`](https://forcats.tidyverse.org/dev/reference/fct_reorder.md)
  have renamed `fun` to `.fun` to avoid spurious matching of named
  arguments.

### New features

- All functions that take `...` use “tidy” dots: this means that you use
  can `!!!` to splice in a list of values, and trailing empty arguments
  are automatically removed. Additionally, all other arguments gain a
  `.` prefix in order to avoid unhelpful matching of named arguments
  ([\#110](https://github.com/tidyverse/forcats/issues/110)).

- [`fct_lump()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  gains `w` argument
  ([\#70](https://github.com/tidyverse/forcats/issues/70),
  [@wilkox](https://github.com/wilkox)) to weight value frequencies
  before lumping them together
  ([\#68](https://github.com/tidyverse/forcats/issues/68)).

### Improvements to NA handling

- [`as_factor()`](https://forcats.tidyverse.org/dev/reference/as_factor.md)
  and
  [`fct_inorder()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  accept NA levels
  ([\#98](https://github.com/tidyverse/forcats/issues/98)).

- [`fct_explicit_na()`](https://forcats.tidyverse.org/dev/reference/fct_explicit_na.md)
  also replaces NAs encoded in levels.

- [`fct_lump()`](https://forcats.tidyverse.org/dev/reference/fct_lump.md)
  correctly accounts for `NA` values in input
  ([\#41](https://github.com/tidyverse/forcats/issues/41))

- [`lvls_revalue()`](https://forcats.tidyverse.org/dev/reference/lvls.md)
  preserves NA levels.

### Minor improvements and bug fixes

- Test coverage increased from 80% to 99%.

- [`fct_drop()`](https://forcats.tidyverse.org/dev/reference/fct_drop.md)
  now preserves attributes
  ([\#83](https://github.com/tidyverse/forcats/issues/83)).

- [`fct_expand()`](https://forcats.tidyverse.org/dev/reference/fct_expand.md)
  and
  [`lvls_expand()`](https://forcats.tidyverse.org/dev/reference/lvls.md)
  now also take character vectors
  ([\#99](https://github.com/tidyverse/forcats/issues/99)).

- [`fct_relabel()`](https://forcats.tidyverse.org/dev/reference/fct_relabel.md)
  now accepts objects coercible to functions by
  [`rlang::as_function`](https://rlang.r-lib.org/reference/as_function.html)
  ([\#91](https://github.com/tidyverse/forcats/issues/91),
  [@alistaire47](https://github.com/alistaire47))

## forcats 0.2.0

CRAN release: 2017-01-23

### New functions

- [`as_factor()`](https://forcats.tidyverse.org/dev/reference/as_factor.md)
  which works like [`as.factor()`](https://rdrr.io/r/base/factor.html)
  but orders levels by appearance to avoid differences between locales
  ([\#39](https://github.com/tidyverse/forcats/issues/39)).

- [`fct_other()`](https://forcats.tidyverse.org/dev/reference/fct_other.md)
  makes it easier to convert selected levels to “other”
  ([\#40](https://github.com/tidyverse/forcats/issues/40))

- [`fct_relabel()`](https://forcats.tidyverse.org/dev/reference/fct_relabel.md)
  allows programmatic relabeling of levels
  ([\#50](https://github.com/tidyverse/forcats/issues/50),
  [@krlmlr](https://github.com/krlmlr)).

### Minor improvements and bug fixes

- [`fct_c()`](https://forcats.tidyverse.org/dev/reference/fct_c.md) can
  take either a list of factors or individual factors
  ([\#42](https://github.com/tidyverse/forcats/issues/42)).

- [`fct_drop()`](https://forcats.tidyverse.org/dev/reference/fct_drop.md)
  gains `only` argument to restrict which levels are dropped
  ([\#69](https://github.com/tidyverse/forcats/issues/69)) and no longer
  adds `NA` level if not present
  ([\#52](https://github.com/tidyverse/forcats/issues/52)).

- [`fct_recode()`](https://forcats.tidyverse.org/dev/reference/fct_recode.md)
  is now checks that each new value is of length 1
  ([\#56](https://github.com/tidyverse/forcats/issues/56)).

- [`fct_relevel()`](https://forcats.tidyverse.org/dev/reference/fct_relevel.md)
  gains `after` argument so you can also move levels to the end (or any
  other position you like)
  ([\#29](https://github.com/tidyverse/forcats/issues/29)).

- [`lvls_reorder()`](https://forcats.tidyverse.org/dev/reference/lvls.md),
  [`fct_inorder()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md),
  and
  [`fct_infreq()`](https://forcats.tidyverse.org/dev/reference/fct_inorder.md)
  gain an `ordered` argument, allowing you to override the existing
  “ordered” status
  ([\#54](https://github.com/tidyverse/forcats/issues/54)).

## forcats 0.1.1

CRAN release: 2016-09-16

- Minor fixes for R CMD check

- Add package docs
