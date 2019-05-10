#' Replace levels with "other"
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

  if (!xor(missing(keep), missing(drop))) {
    stop("Must supply exactly one of `keep` and `drop`", call. = FALSE)
  }

  levels <- levels(f)
  if (!missing(keep)) {
    levels[!levels %in% keep] <- other_level
  } else {
    levels[levels %in% drop] <- other_level
  }

  f <- lvls_revalue(f, levels)
  fct_relevel(f, other_level, after = Inf)
}
