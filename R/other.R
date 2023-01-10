#' Manually replace levels with "other"
#'
#' @inheritParams fct_lump
#' @param keep,drop Pick one of `keep` and `drop`:
#'   * `keep` will preserve listed levels, replacing all others with
#'     `other_level`.
#'   * `drop` will replace listed levels with `other_level`, keeping all
#'     as is.
#' @seealso [fct_lump()] to automatically convert the rarest (or most
#'    common) levels to "other".
#' @export
#' @examples
#' x <- factor(rep(LETTERS[1:9], times = c(40, 10, 5, 27, 1, 1, 1, 1, 1)))
#'
#' fct_other(x, keep = c("A", "B"))
#' fct_other(x, drop = c("A", "B"))
fct_other <- function(f, keep, drop, other_level = "Other") {
  f <- check_factor(f)
  check_exclusive(keep, drop)
  check_string(other_level, allow_na = TRUE)

  if (!missing(keep)) {
    check_character(keep)
    lvls_other(f, levels(f) %in% keep, other_level)
  } else {
    check_character(drop)
    lvls_other(f, !levels(f) %in% drop, other_level)
  }
}

# Replace specified levels (if any), with other.
# @param keep A logical vector the same length as `levels(f)`
lvls_other <- function(f, keep, other_level = "Other") {
  if (all(keep)) {
    f
  } else {
    new_levels <- ifelse(keep, levels(f), other_level)
    f <- lvls_revalue(f, new_levels)
    fct_relevel(f, other_level, after = Inf)
  }
}

