#' Lump together least/most common factor levels into "other"
#'
#' @param f A factor (or character vector).
#' @param n,prop
#'   If both `n` and `prop` are missing, `fct_lump` lumps
#'   together the least frequent levels into "other", while ensuring that
#'   "other" is still the smallest level. It's particularly useful in
#'   conjunction with \code{\link{fct_inorder}()}.
#'
#'   Positive `n` preserves the most common `n` values.
#'   Negative `n` preserves the least common `-n` values.
#'   It there are ties, you will get at least `abs(n)` values.
#'
#'   Positive `prop` preserves values that appear at least
#'   `prop` of the time. Negative `prop` preserves values that
#'   appear at most `-prop` of the time.
#' @param w An optional numeric vector giving weights for frequency of
#'   each value (not level) in f.
#' @param other_level Value of level used for "other" values. Always
#'   placed at end of levels.
#' @param ties.method A character string specifying how ties are
#'   treated. See [rank()] for details.
#' @export
#' @seealso [fct_other()] to convert specified levels to other.
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
#' # Use weighted frequencies
#' w <- c(rep(2, 50), rep(1, 50))
#' fct_lump(x, n = 5, w = w)
#'
#' # Use ties.method to control how tied factors are collapsed
#' fct_lump(x, n = 6)
#' fct_lump(x, n = 6, ties.method = "max")
#'
fct_lump <- function(f, n, prop, w = NULL, other_level = "Other",
                     ties.method = c("min", "average", "first", "last", "random", "max")) {
  f <- check_factor(f)
  w <- check_weights(w, length(f))
  ties.method <- match.arg(ties.method)

  levels <- levels(f)
  if (is.null(w)) {
    count <- as.vector(table(f))
    total <- length(f)
  } else {
    count <- as.vector(tapply(w, f, FUN = sum))
    total <- sum(w)
  }

  if (!xor(missing(n), missing(prop))) {
    new_levels <- ifelse(!in_smallest(count), levels, other_level)
  } else if (!missing(n)) {
    if (n < 0) {
      rank <- rank(count, ties = ties.method)
      n <- -n
    } else {
      rank <- rank(-count, ties = ties.method)
    }

    new_levels <- ifelse(rank <= n, levels, other_level)

  } else if (!missing(prop)) {
    prop_n <- count / total
    if (prop < 0) {
      new_levels <- ifelse(prop_n <= -prop, levels, other_level)
    } else {
      new_levels <- ifelse(prop_n > prop, levels, other_level)
    }
  }

  if (other_level %in% new_levels) {
    f <- lvls_revalue(f, new_levels)
    fct_relevel(f, other_level, after = Inf)
  } else {
    f
  }
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

check_weights <- function(w, n = length(w)) {
  if (is.null(w)) {
    return(w)
  }

  if (!is.numeric(w)) {
    stop("`w` must be a numeric vector", call. = FALSE)
  }

  if (length(w) != n) {
    stop(
      "`w` must be the same length as `f` (", n, "), not length ", length(w),
      call. = FALSE
    )
  }

  bad <- w < 0 | is.na(w)
  if (any(bad)) {
    stop(
      "All `w` must be non-negative and non-missing. Problems at positions: ",
      paste0(which(bad), collapse = ", "),
      call. = FALSE
    )
  }

  w
}
