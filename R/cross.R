#' Combine levels from two or more factors to create a new factor
#'
#' Computes a factor whose levels are all the combinations of the levels of the input factors.
#'
#' @param ...  <[`dynamic-dots`][rlang::dyn-dots]> Additional factors
#'   or character vectors.
#' @param sep A character string to separate the levels
#' @param keep_empty If TRUE, keep combinations with no observations as levels
#' @return The new factor
#'
#' @export
#' @examples
#' fruit <- factor(c("apple", "kiwi", "apple", "apple"))
#' colour <- factor(c("green", "green", "red", "green"))
#' eaten <- c("yes", "no", "yes", "no")
#' fct_cross(fruit, colour)
#' fct_cross(fruit, colour, eaten)
#' fct_cross(fruit, colour, keep_empty = TRUE)
fct_cross <- function(..., sep = ":", keep_empty = FALSE) {
  check_dots_unnamed()
  check_string(sep, allow_empty = TRUE)
  check_bool(keep_empty)

  flist <- list2(...)
  if (length(flist) == 0) {
    return(factor())
  }

  .data <- tibble::as_tibble(flist, .name_repair = "minimal")
  .data <- lapply(.data, check_factor)

  newf <- exec(paste, !!!.data, sep = sep)

  old_levels <- lapply(.data, levels)
  grid <- exec(expand.grid, old_levels)
  new_levels <- exec(paste, !!!grid, sep = sep)

  if (!keep_empty) {
    new_levels <- intersect(new_levels, newf)
  }
  factor(newf, levels = new_levels)
}
