#' Drop unused levels
#'
#' Compared to `base::droplevels()` does not drop `NA` levels that have values.
#'
#' @param f A factor
#' @param only A character vector restricting the set of levels to be dropped.
#'   If supplied, only levels that have no entries and appear in this vector
#'   will be removed.
#' @export
#' @examples
#' f <- factor(c("a", "b"), levels = c("a", "b", "c"))
#' f
#' fct_drop(f)
#'
#' # Set only to restrict which levels to drop
#' fct_drop(f, only = "a")
#' fct_drop(f, only = "c")
fct_drop <- function(f, only) {
  f <- check_factor(f)

  levels <- levels(f)
  count <- table(f)

  to_drop <- levels[count == 0]
  if (!missing(only)) {
    to_drop <- intersect(to_drop, only)
  }

  factor(f, levels = setdiff(levels, to_drop))
}
