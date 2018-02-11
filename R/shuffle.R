#' Randomly permute factor levels
#'
#' @param f A factor (or character vector).
#' @export
#' @examples
#' f <- factor(c("a", "b", "c"))
#' fct_shuffle(f)
#' fct_shuffle(f)
fct_shuffle <- function(f) {
  f <- check_factor(f)

  lvls_reorder(f, sample(lvls_seq(f)))
}
