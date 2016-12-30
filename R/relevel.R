#' Reorder factor levels by hand
#'
#' This is a generalisaton of \code{\link[stats]{relevel}} that allows you to
#' move any number of levels to appear first or last in the levels list.
#'
#' @param f A factor.
#' @param ... Character vector of levels. Any levels not mentioned will be
#'   left in existing order, after the explicitly mentioned levels.
#' @param .last A logical indicating whether the target level(s) should be placed last. Defaults to FALSE.
#' @export
#' @examples
#' f <- factor(c(letters[1:5]))
#' fct_relevel(f)
#' fct_relevel(f, "c")
#' fct_relevel(f, "b", "a")
#' fct_relevel(f, "b", "a", .last = TRUE)
#'
#' # You'll get a warning if the levels don't exist
#' fct_relevel(f, "d")
fct_relevel <- function(f, ..., .last = FALSE) {
  f <- check_factor(f)

  target_levels <- c(..., character())
  stopifnot(is.character(target_levels))

  old_levels <- levels(f)

  unknown <- setdiff(target_levels, old_levels)
  if (length(unknown) > 0) {
    warning("Unknown levels in `f`: ", paste(unknown, collapse = ", "), call. = FALSE)
    target_levels <- intersect(target_levels, old_levels)
  }

  if(.last){
    # place target levels at the end
    new_levels <- c(setdiff(old_levels, target_levels), target_levels)
  } else {
    # place the target levels at the start
    new_levels <- c(target_levels, setdiff(old_levels, target_levels))
  }

  lvls_reorder(f, match(new_levels, old_levels))
}
