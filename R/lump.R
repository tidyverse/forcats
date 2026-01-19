#' Lump uncommon factor levels together into "other"
#'
#' @name fct_lump
#' @rdname fct_lump
#'
#' @description
#' A family for lumping together levels that meet some criteria.
#'
#' * `fct_lump_min()`: lumps levels that appear fewer than `min` times.
#' * `fct_lump_prop()`: lumps levels that appear in fewer than (or equal to)
#'   `prop * n` times.
#' * `fct_lump_n()`: lumps all levels except for the `n` most frequent
#'   (or least frequent if `n < 0`).
#' * `fct_lump_lowfreq()`: lumps together the least frequent levels, ensuring
#'   that "other" is still the smallest level.
#'
#' @param f A factor (or character vector).
#' @param n Positive `n` preserves the most common `n` values.
#'   Negative `n` preserves the least common `-n` values.
#'   If there are ties, you will get at least `abs(n)` values.
#' @param prop Positive `prop` lumps values which do not appear at least
#'   `prop` of the time. Negative `prop` lumps values that
#'   do not appear at most `-prop` of the time.
#' @param min Preserve levels that appear at least `min` number of times.
#' @param w An optional numeric vector giving weights for frequency of
#'   each value (not level) in `f`.
#' @param other_level Value of level used for "other" values. Always
#'   placed at end of levels.
#' @param ties.method A character string specifying how ties are
#'   treated. See [rank()] for details.
#'
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
NULL

#' Superseded helper for lumping factor levels
#'
#' @description
#' `fct_lump()` automatically chooses between [fct_lump_min()],
#' [fct_lump_prop()], [fct_lump_n()], and [fct_lump_lowfreq()] based on
#' its arguments. It is kept for backward compatibility, but is
#' superseded and no longer recommended for new code.
#'
#' @details
#' For new code, prefer the more explicit helpers:
#' [fct_lump_min()], [fct_lump_prop()], [fct_lump_n()], and
#' [fct_lump_lowfreq()].
#'
#' @param f A factor (or character vector).
#' @param n Positive `n` preserves the most common `n` values; negative
#'   `n` preserves the least common `-n` values. If there are ties, you
#'   will get at least `abs(n)` values.
#' @param prop Positive `prop` lumps values which do not appear at least
#'   `prop` of the time; negative `prop` lumps values that do not appear
#'   at most `-prop` of the time.
#' @param min Preserve levels that appear at least `min` number of times.
#'   This is passed on to [fct_lump_min()] when used.
#' @param w An optional numeric vector giving weights for the frequency
#'   of each value (not level) in `f`.
#' @param other_level Value of the level used for "other" values. Always
#'   placed at the end of the levels.
#' @param ties.method A character string specifying how ties are treated.
#'   See [rank()] for details.
#'
#' @seealso [fct_lump_min()], [fct_lump_prop()], [fct_lump_n()],
#'   [fct_lump_lowfreq()]
#'
#' @examples
#' x <- factor(letters[rpois(100, 5)])
#' table(x)
#'
#' # fct_lump() still works, but is superseded:
#' table(fct_lump(x, n = 3))
#'
#' # For new code, prefer the explicit helpers:
#' table(fct_lump_n(x, n = 3))
#'
#' @export
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




