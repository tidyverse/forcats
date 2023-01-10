#' Drop unused levels
#'
#' Compared to `base::droplevels()`, does not drop `NA` levels that have values.
#'
#' @param f A factor (or character vector).
#' @param only A character vector restricting the set of levels to be dropped.
#'   If supplied, only levels that have no entries and appear in this vector
#'   will be removed.
#' @export
#' @seealso [fct_expand()] to add additional levels to a factor.
#' @examples
#' f <- factor(c("a", "b"), levels = c("a", "b", "c"))
#' f
#' fct_drop(f)
#'
#' # Set only to restrict which levels to drop
#' fct_drop(f, only = "a")
#' fct_drop(f, only = "c")
fct_drop <- function(f, only = NULL) {
  f <- check_factor(f)
  check_character(only, allow_null = TRUE)

  levels <- levels(f)
  count <- table(f)

  to_drop <- levels[count == 0]
  if (!is.null(only)) {
    to_drop <- intersect(to_drop, only)
  }

  refactor(f, new_levels = setdiff(levels, to_drop))
}
