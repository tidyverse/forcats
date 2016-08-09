#' Randomly permute the levels of a factor
#'
#' @param f A factor
#' @export
#' @examples
#' f <- factor(c("a", "b", "c"))
#' fct_shuffle(f)
#' fct_shuffle(f)
fct_shuffle <- function(f) {
  f <- check_factor(f)
  factor(f, levels = sample(levels(f)))
}
