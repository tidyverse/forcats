#' Low-level functions for manipulating levels
#'
#' `lvls_reorder` leaves values as they are, but changes the order.
#' `lvls_revalue` changes the values of existing levels; there must
#' be one new level for each old level.
#' `lvls_expand` expands the set of levels; the new levels must
#' include the old levels.
#'
#' These functions are less helpful than the higher-level `fct_` functions,
#' but are safer than the very low-level manipulation of levels directly,
#' because they are more specific, and hence can more carefully check their
#' arguments.
#'
#' @param f A factor (or character vector).
#' @param idx A integer index, with one integer for each existing level.
#' @param new_levels A character vector of new levels.
#' @param ordered A logical which determines the "ordered" status of the
#'   output factor. `NA` preserves the existing status of the factor.
#' @name lvls
#' @examples
#' f <- factor(c("a", "b", "c"))
#' lvls_reorder(f, 3:1)
#' lvls_revalue(f, c("apple", "banana", "carrot"))
#' lvls_expand(f, c("a", "b", "c", "d"))
NULL

#' @export
#' @rdname lvls
lvls_reorder <- function(f, idx, ordered = NA) {
  f <- check_factor(f)

  if (!is.numeric(idx)) {
    cli::cli_abort("{.arg idx} must be numeric")
  }
  if (!setequal(idx, lvls_seq(f)) || length(idx) != nlevels(f)) {
    cli::cli_abort("{.arg idx} must contain one integer for each level of {.arg f}")
  }

  refactor(f, levels(f)[idx], ordered = ordered)
}

#' @export
#' @rdname lvls
lvls_revalue <- function(f, new_levels) {
  f <- check_factor(f)
  check_character(new_levels)

  if (length(new_levels) != nlevels(f)) {
    n_new <- length(new_levels)
    n_old <- nlevels(f)
    cli::cli_abort(
      "{.arg new_levels} must be the same length ({n_new}) as {.code levels(f)} ({n_old})."
    )
  }

  if (anyDuplicated(new_levels)) {
    # Collapse levels, creating a new factor
    u_levels <- unique(new_levels)
    index <- match(new_levels, u_levels)

    out <- index[f]
    attributes(out) <- attributes(f)
    attr(out, "levels") <- u_levels
    out
  } else {
    attr(f, "levels") <- new_levels
    f
  }
}

#' @export
#' @rdname lvls
lvls_expand <- function(f, new_levels) {
  f <- check_factor(f)

  missing <- setdiff(levels(f), new_levels)
  if (length(missing) > 0) {
    cli::cli_abort(c(
      "{.arg new_levels} must include all levels in {.arg f}.",
      i = "Missing {length(missing)} level{?s}: {missing}"
    ))
  }

  refactor(f, new_levels)
}

lvls_seq <- function(f) {
  seq_along(levels(f))
}

refactor <- function(f, new_levels, ordered = NA) {
  if (is.na(ordered)) {
    ordered <- is.ordered(f)
  }

  new_f <- factor(f, levels = new_levels, exclude = NULL, ordered = ordered)
  attributes(new_f) <- utils::modifyList(attributes(f), attributes(new_f))
  new_f
}


#' Find all levels in a list of factors
#'
#' @param fs A list of factors.
#' @export
#' @examples
#' fs <- list(factor("a"), factor("b"), factor(c("a", "b")))
#' lvls_union(fs)
lvls_union <- function(fs) {
  fs <- check_factor_list(fs)
  Reduce(function(x, y) union(x, levels(y)), fs, init = character())
}
