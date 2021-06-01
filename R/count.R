#' Count entries in a factor
#'
#' @param f A factor (or character vector).
#' @param sort If `TRUE`, sort the result so that the most common values
#'   float to the top.
#' @param prop If `TRUE`, compute the fraction of marginal table.
#' @return A tibble with columns `f`, `n` and `p`, if prop is `TRUE`.
#' @export
#' @examples
#' f <- factor(sample(letters)[rpois(1000, 10)])
#' table(f)
#' fct_count(f)
#' fct_count(f, sort = TRUE)
#' fct_count(f, sort = TRUE, prop = TRUE)
fct_count <- function(f, sort = FALSE, prop = FALSE) {
  f2 <- check_factor(f)
  n_na <- sum(is.na(f))

  df <- tibble::tibble(
    f = fct_inorder(c(levels(f2), if (n_na > 0) NA)),
    n = c(tabulate(f2, nlevels(f)), if (n_na > 0) n_na)
  )

  if (sort) {
    df <- df[order(df$n, decreasing = TRUE), ]
  }

  if (prop) {
    df$p <- prop.table(df$n)
  }

  df
}
