#' Change the order of levels in a factor
#'
#' This is a generalisaton of \code{\link[stats]{relevel}} that allows you to
#' move any number of levels to the front.
#'
#' @param f A factor.
#' @param ... Character vector of levels. Any levels not mentioned will be
#'   left in existing order, after the explicitly mentioned levels.
#' @export
#' @examples
#' f <- factor(c("a", "b", "c"))
#' fct_relevel(f)
#' fct_relevel(f, "c")
#' fct_relevel(f, "b", "a")
#'
#' # You'll get a warning if the levels don't exist
#' fct_relevel(f, "d")
fct_relevel <- function(f, ...) {
  f <- check_factor(f)

  first_levels <- c(..., character())
  stopifnot(is.character(first_levels))

  old_levels <- levels(f)

  unknown <- setdiff(first_levels, old_levels)
  if (length(unknown) > 0) {
    warning("Unknown levels in `f`: ", paste(unknown, collapse = ", "), call. = FALSE)
    first_levels <- intersect(first_levels, old_levels)
  }

  new_levels <- c(first_levels, setdiff(old_levels, first_levels))

  lvls_reorder(f, match(new_levels, old_levels))
}
