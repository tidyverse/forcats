#' Anonymise factor levels
#'
#' Replaces factor levels with arbitrary numeric identifiers. Neither
#' the values nor the order of the levels are preserved.
#'
#' @param f A factor.
#' @param prefix A character prefix to insert in front of the random labels.
#' @export
#' @examples
#' gss_cat$relig |> fct_count()
#' gss_cat$relig |>
#'   fct_anon() |>
#'   fct_count()
#' gss_cat$relig |>
#'   fct_anon("X") |>
#'   fct_count()
fct_anon <- function(f, prefix = "") {
  f <- check_factor(f)
  check_string(prefix)
  levels <- paste0(prefix, zero_pad(seq_len(nlevels(f))))

  f <- lvls_revalue(f, sample(levels))
  lvls_reorder(f, match(levels, levels(f)))
}

digits <- function(x) nchar(max(x, na.rm = TRUE))

zero_pad <- function(x) {
  sprintf(paste0("%0", digits(x), "d"), x)
}
