check_factor <- function(f) {
  if (is.character(f)) {
    f <- factor(f)
  } else if (is.factor(f)) {
    f
  } else {
    stop("`f` must be a factor (or character vector).", call. = FALSE)
  }
}
