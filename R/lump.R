#' Lump together least/most common levels into "other".
#'
#' @param f A factor.
#' @param n,prop
#'   If both \code{n} and \code{prop} are missing, \code{fct_lump} lumps
#'   together the least frequent levels into "other", while ensuring that
#'   "other" is still the smallest level. It's particularly useful in
#'   conjunction with \code{\link{fct_inorder}()}.
#'
#'   Positive \code{n} preserves the most common \code{n} values.
#'   Negative \code{n} preserves the least common \code{-n} values.
#'   It there are ties, you will get at least \code{abs(n)} values.
#'
#'   Positive \code{prop}, preserves values that appear at least
#'   \code{prop} of the time. Negative \code{prop}, preserves values that
#'   appear at most \code{-prop} of the time.
#' @param other_level Value of level used for "other" values. Always
#'   placed at end of levels.
#' @param ties.method A character string specifying how ties are
#'   treated. See \code{\link{rank}} for details
#' @export
#' @examples
#' x <- factor(rep(LETTERS[1:9], times = c(40, 10, 5, 27, 1, 1, 1, 1, 1)))
#' x %>% table()
#' x %>% fct_lump() %>% table()
#' x %>% fct_lump() %>% fct_inorder() %>% table()
#'
#' x <- factor(letters[rpois(100, 5)])
#' x
#' table(x)
#' table(fct_lump(x))
#'
#' # Use positive values to collapse the rarest
#' fct_lump(x, n = 3)
#' fct_lump(x, prop = 0.1)
#'
#' # Use negative values to collapse the most common
#' fct_lump(x, n = -3)
#' fct_lump(x, prop = -0.1)
#'
#' # Use ties.method to control how tied factors are collapsed
#' fct_lump(x, n = 6)
#' fct_lump(x, n = 6, ties.method = "max")
#'
fct_lump <- function(f, n, prop, other_level = "Other",
                     ties.method = c("min", "average", "first", "last", "random", "max")) {
  f <- check_factor(f)
  ties.method <- match.arg(ties.method)

  levels <- levels(f)
  count <- table(f)

  if (!xor(missing(n), missing(prop))) {
    new_levels <- ifelse(!in_smallest(table(f)), levels, other_level)
  } else if (!missing(n)) {
    if (n < 0) {
      rank <- rank(count, ties = ties.method)
      n <- -n
    } else {
      rank <- rank(-count, ties = ties.method)
    }

    new_levels <- ifelse(rank <= n, levels, other_level)

  } else if (!missing(prop)) {
    prop_n <- count / sum(count)
    if (prop < 0) {
      new_levels <- ifelse(prop_n <= -prop, levels, other_level)
    } else {
      new_levels <- ifelse(prop_n > prop, levels, other_level)
    }
  }

  f <- lvls_revalue(f, new_levels)

  # Place other at end
  levels <- levels(f)
  other_back <- c(setdiff(levels, other_level), intersect(levels, other_level))
  lvls_reorder(f, match(other_back, levels))
}

# Lump together smallest groups, ensuring that the collective
# "other" is still the smallest group. Assumes x is vector
# of counts in descending order
lump_cutoff <- function(x) {
  left <- sum(x)

  for (i in seq_along(x)) {
    # After group, there are this many left
    left <- left - x[i]

    if (x[i] > left)
      return(i + 1)
  }

  length(x) + 1
}

# Given vector of counts, returns logical vector if in
# smallest groups
in_smallest <- function(x) {
  ord_x <- order(x, decreasing = TRUE)
  idx <- lump_cutoff(x[ord_x])

  to_lump <- seq_along(x) >= idx
  # Undo initial ordering
  to_lump[order(ord_x)]
}
