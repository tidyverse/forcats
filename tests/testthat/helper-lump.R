lump_test <- function(x) {
  paste(ifelse(in_smallest(x), "X", letters[seq_along(x)]), collapse = "")
}
