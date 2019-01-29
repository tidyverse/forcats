#' Change factor levels by hand
#'
#' @param .f A factor (or character vector).
#' @param ... A sequence of named character vectors where the
#'   name gives the new level, and the value gives the old level.
#'   Levels not otherwise mentioned will be left as is. Levels can
#'   be removed by naming them `NULL`. Uses tidy dots.
#' @export
#' @examples
#' x <- factor(c("apple", "bear", "banana", "dear"))
#' fct_recode(x, fruit = "apple", fruit = "banana")
#'
#' # If you make a mistake you'll get a warning
#' fct_recode(x, fruit = "apple", fruit = "bananana")
#'
#' # If you name the level NULL it will be removed
#' fct_recode(x, NULL = "apple", fruit = "banana")
#'
#' # When passing a named vector to rename levels use !!! to splice
#' x <- factor(c("apple", "bear", "banana", "dear"))
#' levels <- c(fruit = "apple", fruit = "banana")
#' fct_recode(x, !!!levels)
fct_recode <- function(.f, ...) {
  f <- check_factor(.f)

  new_levels <- check_recode_levels(...)

  # Remove any named NULL and finish if all NULLs
  nulls <- names(new_levels) == "NULL"
  if (any(nulls)) {
    f <- factor(f, levels = setdiff(levels(f), new_levels[nulls]))
    new_levels <- new_levels[!nulls]
  }

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

check_recode_levels <- function(...) {
  levels <- rlang::dots_list(...)

  is_ok <- function(x) is.character(x) && length(x) == 1
  ok <- vapply(levels, is_ok, logical(1))

  if (!all(ok)) {
    stop(
      "Each input to fct_recode must be a single named string. ",
      "Problems at positions: ", paste0(which(!ok), collapse = ", "),
      call. = FALSE
    )
  }

  unlist(levels)
}
