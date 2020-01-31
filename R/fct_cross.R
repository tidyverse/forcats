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
fct_cross <- function(..., sep = ":", keep_empty = FALSE) {

  flist <- list2(...)
  if (length(flist) == 0) {
    return(factor())
  }

  .data <- tibble::as_tibble(flist, .name_repair = "minimal")
  .data <- lapply(.data, check_factor)
  newf <- invoke(paste, .data, sep = sep)

  all_old_levels <- lapply(.data, levels)
  all_new_levels <- invoke(paste,
                                  invoke(expand.grid, all_old_levels),
                                  sep = sep)

  if (keep_empty) {

    factor(newf, levels = all_new_levels)

  } else {

    anyNA <- Reduce("|", lapply(.data, is.na), FALSE)
    newf[anyNA] <- NA
    factor(newf, levels = intersect(all_new_levels, newf))
  }
}
