#' Reorders levels in order of first appearance or frequency.
#'
#' @param f A factor
#' @export
#' @examples
#' f <- factor(c("b", "b", "a", "c", "c", "c"))
#' f
#' fct_inorder(f)
#' fct_infreq(f)
fct_inorder <- function(f) {
  f <- check_factor(f)

  factor(f, levels = levels(f)[as.integer(f[!duplicated(f)])])
}

#' @export
#' @rdname fct_inorder
fct_infreq <- function(f) {
  f <- check_factor(f)
  count <- fct_count(f)

  factor(f, levels = count$level[order(count$n, decreasing = TRUE)])
}
