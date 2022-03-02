#' Reorder factor levels by hand
#'
#' This is a generalisation of [stats::relevel()] that allows you to move any
#' number of levels to any location.
#'
#' @param .f A factor (or character vector).
#' @param ... Either a function (or formula), or character levels.
#'
#'   A function will be called with the current levels as input, and the
#'   return value (which must be a character vector) will be used to relevel
#'   the factor.
#'
#'   Any levels not mentioned will be left in their existing order, by default
#'   after the explicitly mentioned levels. Supports tidy dots.
#' @param after Where should the new values be placed?
#' @export
#' @examples
#' f <- factor(c("a", "b", "c", "d"), levels = c("b", "c", "d", "a"))
#' fct_relevel(f)
#' fct_relevel(f, "a")
#' fct_relevel(f, "b", "a")
#'
#' # Move to the third position
#' fct_relevel(f, "a", after = 2)
#'
#' # Relevel to the end
#' fct_relevel(f, "a", after = Inf)
#' fct_relevel(f, "a", after = 3)
#'
#' # Relevel with a function
#' fct_relevel(f, sort)
#' fct_relevel(f, sample)
#' fct_relevel(f, rev)
#'
#' # Using 'Inf' allows you to relevel to the end when the number
#' # of levels is unknown or variable (e.g. vectorised operations)
#' df <- forcats::gss_cat[, c("rincome", "denom")]
#' lapply(df, levels)
#'
#' df2 <- lapply(df, fct_relevel, "Don't know", after = Inf)
#' lapply(df2, levels)
#'
#' # You'll get a warning if the levels don't exist
#' fct_relevel(f, "e")
fct_relevel <- function(.f, ..., after = 0L) {
  f <- check_factor(.f)

  old_levels <- levels(f)
  if (dots_n(...) == 1L && (is.function(..1) || is_formula(..1))) {
    fun <- as_function(..1)
    first_levels <- fun(old_levels)
    if (!is.character(first_levels)) {
      cli::cli_abort("Re-leveling function must return character vector")
    }
  } else {
    first_levels <- chr(...)
  }

  unknown <- setdiff(first_levels, old_levels)
  if (length(unknown) > 0) {
    cli::cli_warn("{length(unknown)} unknown level{?s} in `f`: {unknown}")
    first_levels <- intersect(first_levels, old_levels)
  }

  new_levels <- append(setdiff(old_levels, first_levels), first_levels, after = after)

  lvls_reorder(f, match(new_levels, old_levels))
}
