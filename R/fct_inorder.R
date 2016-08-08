#' Reorders levels in order of first appearance in data
#'
#' @param f As factor
#' @export
#' @examples
#' f <- factor(c("b", "b", "a", "a", "c", "c"))
#' f
#' fct_inorder(f)
fct_inorder <- function(f) {
  factor(f, levels = levels(f)[as.integer(f[!duplicated(f)])])
}
