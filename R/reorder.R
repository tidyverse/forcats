#' Reorder factor levels by sorting along another variable
#'
#' `fct_reorder()` is useful for 1d displays where the factor is mapped to
#' position; `fct_reorder2()` for 2d displays where the factor is mapped to
#' a non-position aesthetic. `last2()` and `first2()` are helpers for `fct_reorder2()`;
#' `last2()` finds the last value of `y` when sorted by `x`; `first2()` finds the first value.
#'
#' @param .f A factor (or character vector).
#' @param .x,.y The levels of `f` are reordered so that the values
#'    of `.fun(.x)` (for `fct_reorder()`) and `fun(.x, .y)` (for `fct_reorder2()`)
#'    are in ascending order.
#' @param .fun n summary function. It should take one vector for
#'   `fct_reorder`, and two vectors for `fct_reorder2`, and return a single
#'   value.
#' @param .na_rm Should `fct_reorder()` remove missing values?
#'   If `NULL`, the default, will remove missing values with a warning.
#'   Set to `FALSE` to preserve `NA`s (if your `.fun` already handles them) and
#'   `TRUE` to remove silently.
#' @param .default What default value should we use for `.fun` for
#'   empty levels? Use this to control where empty levels appear in the
#'   output.
#' @param ... Other arguments passed on to `.fun`.
#' @param .desc Order in descending order? Note the default is different
#'   between `fct_reorder` and `fct_reorder2`, in order to
#'   match the default ordering of factors in the legend.
#' @export
#' @examples
#' # fct_reorder() -------------------------------------------------------------
#' # Useful when a categorical variable is mapped to position
#' boxplot(Sepal.Width ~ Species, data = iris)
#' boxplot(Sepal.Width ~ fct_reorder(Species, Sepal.Width), data = iris)
#'
#' # or with
#' library(ggplot2)
#' ggplot(iris, aes(fct_reorder(Species, Sepal.Width), Sepal.Width)) +
#'   geom_boxplot()
#'
#' # fct_reorder2() -------------------------------------------------------------
#' # Useful when a categorical variable is mapped to color, size, shape etc
#'
#' chks <- subset(ChickWeight, as.integer(Chick) < 10)
#' chks <- transform(chks, Chick = fct_shuffle(Chick))
#'
#' # Without reordering it's hard to match line to legend
#' ggplot(chks, aes(Time, weight, colour = Chick)) +
#'   geom_point() +
#'   geom_line()
#'
#' # With reordering it's much easier
#' ggplot(chks, aes(Time, weight, colour = fct_reorder2(Chick, Time, weight))) +
#'   geom_point() +
#'   geom_line() +
#'   labs(colour = "Chick")
fct_reorder <- function(
  .f,
  .x,
  .fun = median,
  ...,
  .na_rm = NULL,
  .default = Inf,
  .desc = FALSE
) {
  f <- check_factor(.f)
  stopifnot(length(f) == length(.x))
  .fun <- as_function(.fun)
  check_dots_used()
  check_bool(.na_rm, allow_null = TRUE)
  check_bool(.desc)

  miss <- is.na(.x)
  if (any(miss)) {
    if (is.null(.na_rm)) {
      cli::cli_warn(c(
        "{.fn fct_reorder} removing {sum(miss)} missing value{?s}.",
        i = "Use {.code .na_rm = TRUE} to silence this message.",
        i = "Use {.code .na_rm = FALSE} to preserve NAs."
      ))
      .na_rm <- TRUE
    }

    if (isTRUE(.na_rm)) {
      .x <- .x[!miss]
      .f <- .f[!miss]
    }
  }

  summary <- tapply(.x, .f, function(x) .fun(x, ...), default = .default)
  check_single_value_per_group(summary, ".fun")
  lvls_reorder(f, order(summary, decreasing = .desc))
}

#' @export
#' @rdname fct_reorder
fct_reorder2 <- function(
  .f,
  .x,
  .y,
  .fun = last2,
  ...,
  .na_rm = NULL,
  .default = -Inf,
  .desc = TRUE
) {
  .f <- check_factor(.f)
  stopifnot(length(.f) == length(.x), length(.x) == length(.y))
  check_dots_used()
  check_bool(.na_rm, allow_null = TRUE)
  check_bool(.desc)

  miss <- is.na(.x) | is.na(.y)
  if (any(miss)) {
    if (is.null(.na_rm)) {
      cli::cli_warn(c(
        "{.fn fct_reorder2} removing {sum(miss)} missing value{?s}.",
        i = "Use {.code .na_rm = TRUE} to silence this message.",
        i = "Use {.code .na_rm = FALSE} to preserve NAs."
      ))
      .na_rm <- TRUE
    }

    if (isTRUE(.na_rm)) {
      .x <- .x[!miss]
      .y <- .y[!miss]
      .f <- .f[!miss]
    }
  }

  summary <- tapply(
    seq_along(.x),
    .f,
    function(i) .fun(.x[i], .y[i], ...),
    default = .default
  )
  check_single_value_per_group(summary, ".fun")

  lvls_reorder(.f, order(summary, decreasing = .desc))
}

check_single_value_per_group <- function(x, fun_arg, call = caller_env()) {
  # This is a bit of a weak test, but should detect the most common case
  # where `.fun` returns multiple values.
  if (is.list(x)) {
    cli::cli_abort(
      "{.arg {fun_arg}} must return a single value per group",
      call = call
    )
  }
}

#' @export
#' @rdname fct_reorder
last2 <- function(.x, .y) {
  terminal(.x, .y, desc = TRUE)
}

#' @export
#' @rdname fct_reorder
first2 <- function(.x, .y) {
  terminal(.x, .y, desc = FALSE)
}

terminal <- function(x, y, desc) {
  miss <- is.na(x) | is.na(y)
  x <- x[!miss]
  y <- y[!miss]

  if (length(x) == 0) {
    y[NA_integer_]
  } else {
    y[[order(x, decreasing = desc)[[1]]]]
  }
}

#' Reorder factor levels by first appearance, frequency, or numeric order
#'
#' This family of functions changes only the order of the levels.
#' * `fct_inorder()`: by the order in which they first appear.
#' * `fct_infreq()`: by number of observations with each level (largest first)
#' * `fct_inseq()`: by numeric value of level.
#'
#' @inheritParams lvls_reorder
#' @param f A factor
#' @export
#' @examples
#' f <- factor(c("b", "b", "a", "c", "c", "c"))
#' f
#' fct_inorder(f)
#' fct_infreq(f)
#'
#' f <- factor(1:3, levels = c("3", "2", "1"))
#' f
#' fct_inseq(f)
fct_inorder <- function(f, ordered = NA) {
  f <- check_factor(f)
  check_bool(ordered, allow_na = TRUE)

  idx <- as.integer(f)[!duplicated(f)]
  idx <- union(idx[!is.na(idx)], lvls_seq(f))
  lvls_reorder(f, idx, ordered = ordered)
}

#' @export
#' @rdname fct_inorder
#' @inheritParams fct_lump
fct_infreq <- function(f, w = NULL, ordered = NA) {
  f <- check_factor(f)
  w <- compute_weights(f, w)
  check_bool(ordered, allow_na = TRUE)

  lvls_reorder(f, order(w, decreasing = TRUE), ordered = ordered)
}

#' @export
#' @rdname fct_inorder
fct_inseq <- function(f, ordered = NA) {
  f <- check_factor(f)
  check_bool(ordered, allow_na = TRUE)

  num_levels <- suppressWarnings(as.numeric(levels(f)))
  if (all(is.na(num_levels))) {
    cli::cli_abort("At least one existing level must be coercible to numeric.")
  }

  lvls_reorder(f, order(num_levels), ordered = ordered)
}
