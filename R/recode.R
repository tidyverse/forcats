#' Change the levels of a factor
#'
#' @param f A factor.
#' @param ... A sequence of named character vectors where the
#'   name gives the new level, and the value gives the old level.
#'   Levels not otherwise mentioned will be left as is.
#' @export
#' @examples
#' x <- factor(c("apple", "bear", "banana", "dear"))
#' fct_recode(x, fruit = "apple", fruit = "banana")
#'
#' # If you make a mistake you'll get a warning
#' fct_recode(x, fruit = "apple", fruit = "bananana")
fct_recode <- function(f, ...) {
  f <- check_factor(f)

  new_levels <- c(...)
  stopifnot(is.character(new_levels))

  # Match old levels with new levels
  old_levels <- levels(f)
  idx <- match(new_levels, old_levels)

  # Handle levels that don't exist
  if (any(is.na(idx))) {
    bad <- new_levels[is.na(idx)]
    warning("Unknown levels in `f`: ", paste(bad, collapse = ", "), call. = FALSE)

    new_levels <- new_levels[!is.na(idx)]
    idx <- idx[!is.na(idx)]
  }

  old_levels[idx] <- names(new_levels)

  lvls_revalue(f, old_levels)
}
