#' Count entries in a factor
#'
#' @param f A factor
#' @param sort If \code{TRUE}, sort the result so that most common values
#'   float to the top.
#' @return A tibble with columns \code{f} and \code{n}
#' @export
#' @examples
#' f <- factor(sample(letters)[rpois(1000, 10)])
#' table(f)
#' fct_count(f)
#' fct_count(f, sort = TRUE)
fct_count <- function(f, sort = FALSE) {
  f <- check_factor(f)
  f2 <- addNA(f, ifany = TRUE)

  df <- tibble::tibble(
    f = fct_unique(f2),
    n = as.integer(table(f2))
  )

  if (sort) {
    df <- df[order(df$n, decreasing = TRUE), ]
  }

  df
}
