#' Sort factor levels according to a user-defined function
#'
#' @param .f A factor (or character vector).
#' @param .fun A function that will sort or permute the existing factor levels.
#'   It must accept one character argument and return a character argument of
#'   the same length as it's input.
#'
#' @param ... Additional arguments to `.fun`.
#' @export
#' @examples
#' medieval_experiment <- factor(
#'   c("Control", "Comfrey", "Cropleek", "Bishopwort")
#' )
#' medieval_experiment
#'
#' # Default (alphabetical) level-sorting:
#' fct_sort_levels(medieval_experiment, sort)
#'
#' # Reversed ordering (equivalent to `fct_rev`):
#' fct_sort_levels(medieval_experiment, sort, decreasing = TRUE)
#'
#' # Level-sorting with "Control" as the first level
#' # (equivalent: `fct_relevel(medieval_experiment, "Control")`)
#' fct_sort_levels(
#'   medieval_experiment,
#'   function(x) c("Control", sort(setdiff(x, "Control"))))
#'
#' # Randomised sorting of the levels:
#' fct_sort_levels(medieval_experiment, sample)
#'
fct_sort_levels <- function(.f, .fun, ...) {
  f <- check_factor(.f)
  .fun <- rlang::as_function(.fun)

  old_levels <- levels(f)
  new_levels <- .fun(old_levels, ...)
  stopifnot(
    length(old_levels) == length(new_levels) &&
      all(new_levels %in% old_levels)
  )
  fct_relevel(f, new_levels)
}
