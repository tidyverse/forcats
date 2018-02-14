#' Reorder factor levels by hand
#'
#' This is a generalisaton of [stats::relevel()] that allows you to move any
#' number of levels to any location.
#'
#' @param .f A factor (or character vector).
#' @param ... Character vector of levels. Any levels not mentioned will be left
#'   in existing order, after the explicitly mentioned levels. Supports tidy
#'   dots.
#' @param after Where should the new values be placed?
#' @export
#' @examples
#' f <- factor(c("a", "b", "c", "d"))
#' fct_relevel(f)
#' fct_relevel(f, "c")
#' fct_relevel(f, "b", "a")
#'
#' # Move to the third position
#' fct_relevel(f, "a", after = 2)
#'
#' # Relevel to the end
#' fct_relevel(f, "a", after = Inf)
#' fct_relevel(f, "a", after = 3)
#'
#' # Using 'Inf' allows you to relevel to the end when the number
#' # of levels is unknown or variable (e.g. vectorised operations)
#' df  <- forcats::gss_cat[, c("rincome", "denom")]
#' lapply(df, levels)
#'
#' df2 <- lapply(df, fct_relevel, "Don't know", after = Inf)
#' lapply(df2, levels)
#'
#' # You'll get a warning if the levels don't exist
#' fct_relevel(f, "e")
fct_relevel <- function(.f, ..., after = 0L) {
  f <- check_factor(.f)

  first_levels <- rlang::chr(...)
  old_levels <- levels(f)

  unknown <- setdiff(first_levels, old_levels)
  if (length(unknown) > 0) {
    warning("Unknown levels in `f`: ", paste(unknown, collapse = ", "), call. = FALSE)
    first_levels <- intersect(first_levels, old_levels)
  }

  new_levels <- append(setdiff(old_levels, first_levels), first_levels, after = after)

  lvls_reorder(f, match(new_levels, old_levels))
}
