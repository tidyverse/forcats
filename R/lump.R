#' Lump uncommon factor levels together into "other"
#'
#' @description
#' A family for lumping together levels that meet some criteria.
#' * `fct_lump_min()`: lumps levels that appear fewer than `min` times.
#' * `fct_lump_prop()`: lumps levels that appear in fewer than (or equal to)
#'    `prop * n` times.
#' * `fct_lump_n()` lumps all levels except for the `n` most frequent
#'    (or least frequent if `n < 0`)
#' * `fct_lump_lowfreq()` lumps together the least frequent levels, ensuring
#'    that "other" is still the smallest level.
#'
#' `fct_lump()` exists primarily for historical reasons, as it automatically
#' picks between these different methods depending on its arguments.
#' We no longer recommend that you use it.
#'
#' @param f A factor (or character vector).
#' @param n Positive `n` preserves the most common `n` values.
#'   Negative `n` preserves the least common `-n` values.
#'   It there are ties, you will get at least `abs(n)` values.
#' @param prop  Positive `prop` lumps values which do not appear at least
#'   `prop` of the time. Negative `prop` lumps values that
#'   do not appear at most `-prop` of the time.
#' @param min Preserve levels that appear at least `min` number of times.
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
#' x |> table()
#' x |>
#'   fct_lump_n(3) |>
#'   table()
#' x |>
#'   fct_lump_prop(0.10) |>
#'   table()
#' x |>
#'   fct_lump_min(5) |>
#'   table()
#' x |>
#'   fct_lump_lowfreq() |>
#'   table()
#'
#' x <- factor(letters[rpois(100, 5)])
#' x
#' table(x)
#' table(fct_lump_lowfreq(x))
#'
#' # Use positive values to collapse the rarest
#' fct_lump_n(x, n = 3)
#' fct_lump_prop(x, prop = 0.1)
#'
#' # Use negative values to collapse the most common
#' fct_lump_n(x, n = -3)
#' fct_lump_prop(x, prop = -0.1)
#'
#' # Use weighted frequencies
#' w <- c(rep(2, 50), rep(1, 50))
#' fct_lump_n(x, n = 5, w = w)
#'
#' # Use ties.method to control how tied factors are collapsed
#' fct_lump_n(x, n = 6)
#' fct_lump_n(x, n = 6, ties.method = "max")
#'
#' # Use fct_lump_min() to lump together all levels with fewer than `n` values
#' table(fct_lump_min(x, min = 10))
#' table(fct_lump_min(x, min = 15))
fct_lump <- function(
  f,
  n,
  prop,
  w = NULL,
  other_level = "Other",
  ties.method = c("min", "average", "first", "last", "random", "max")
) {
  if (missing(n) && missing(prop)) {
    fct_lump_lowfreq(f, w = w, other_level = other_level)
  } else if (missing(prop)) {
    fct_lump_n(
      f,
      n,
      w = w,
      other_level = other_level,
      ties.method = ties.method
    )
  } else if (missing(n)) {
    fct_lump_prop(f, prop, w = w, other_level = other_level)
  } else {
    cli::cli_abort("Must supply only one of {.arg n} and {.arg prop}.")
  }
}

#' @export
#' @rdname fct_lump
fct_lump_min <- function(f, min, w = NULL, other_level = "Other") {
  f <- check_factor(f)
  check_number_decimal(min, min = 0)
  check_string(other_level, allow_na = TRUE)

  level_w <- compute_weights(f, w)
  lvls_other(f, level_w >= min, other_level)
}

#' @export
#' @rdname fct_lump
fct_lump_prop <- function(f, prop, w = NULL, other_level = "Other") {
  f <- check_factor(f)
  check_number_decimal(prop)
  check_string(other_level, allow_na = TRUE)

  level_w <- compute_weights(f, w)
  # Compute proportion of total, including NAs
  if (is.null(w)) {
    prop_n <- level_w / length(f)
  } else {
    prop_n <- level_w / sum(w)
  }

  if (prop < 0) {
    lvls_other(f, prop_n <= -prop, other_level)
  } else {
    lvls_other(f, prop_n > prop, other_level)
  }
}

#' @export
#' @rdname fct_lump
fct_lump_n <- function(
  f,
  n,
  w = NULL,
  other_level = "Other",
  ties.method = c("min", "average", "first", "last", "random", "max")
) {
  f <- check_factor(f)
  check_number_decimal(n)
  check_string(other_level, allow_na = TRUE)
  ties.method <- arg_match(ties.method)

  level_w <- compute_weights(f, w)
  if (n < 0) {
    rank <- rank(level_w, ties.method = ties.method)
    n <- -n
  } else {
    rank <- rank(-level_w, ties.method = ties.method)
  }

  lvls_other(f, rank <= n, other_level)
}

#' @export
#' @rdname fct_lump
fct_lump_lowfreq <- function(f, w = NULL, other_level = "Other") {
  f <- check_factor(f)
  check_string(other_level, allow_na = TRUE)
  level_w <- compute_weights(f, w)

  lvls_other(f, !in_smallest(level_w), other_level)
}


# helpers -----------------------------------------------------------------

compute_weights <- function(f, w = NULL, call = caller_env()) {
  w <- check_weights(w, length(f), call = call)

  w <- w %||% rep(1L, length(f))
  n <- as.vector(tapply(w, f, sum))
  # fill in counts for empty levels
  n[is.na(n)] <- 0

  n
}

# Lump together smallest groups, ensuring that the collective
# "other" is still the smallest group. Assumes x is vector
# of counts in descending order
lump_cutoff <- function(x) {
  left <- sum(x)

  for (i in seq_along(x)) {
    # After group, there are this many left
    left <- left - x[i]

    if (x[i] > left) {
      return(i + 1)
    }
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

check_weights <- function(w, n = length(w), call = caller_env()) {
  if (is.null(w)) {
    return(w)
  }

  if (!is.numeric(w)) {
    cli::cli_abort(
      "{.arg w} must be a numeric vector, not {.obj_type_friendly w}.",
      call = call
    )
  }

  if (length(w) != n) {
    cli::cli_abort(
      "{.arg w} must be the same length as {.arg f} ({n}), not length {length(w)}.",
      call = call
    )
  }

  bad <- w < 0 | is.na(w)
  if (any(bad)) {
    probs <- which(bad)
    cli::cli_abort(
      c(
        "All {.arg w} must be non-negative and non-missing.",
        "{length(probs)} problem{?s} at positions {probs}."
      ),
      call = call
    )
  }

  w
}
