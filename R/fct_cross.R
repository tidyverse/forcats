#' Combine levels from two or more factors to create a new factor
#'
#' Computes a factor whose levels are all the combinations of the levels of the input factors.
#'
#' @param .f A factor or character vector
#' @param ...  Additional factors or character vectors
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
fct_cross <- function(.f, ..., sep = ":", keep_empty = FALSE) {
  .f <- check_factor(.f)

  flist <- rlang::list2(...)
  if (length(flist) == 0) {
    return(.f)
  }

  .data <- lapply(tibble::tibble(.f, !!!flist), check_factor)
  newf <- rlang::invoke(paste, .data, sep = sep)

  if (keep_empty) {
    all_levels <- lapply(.data, levels)
    factor(newf, levels = rlang::invoke(paste,
      rlang::invoke(expand.grid, all_levels),
      sep = sep
    ))
  } else {
    anyNA <- Reduce("|", lapply(.data, is.na), FALSE)
    newf[anyNA] <- NA
    as.factor(newf)
  }
}
