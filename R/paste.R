#' "Paste" together factors.
#' 
#' Order is cartesian product of all levels.
#' 
#' This is sometimes useful when plotting a factor
#'
#' @param ... Factors to be united. 
#' @param sep Separtor to use
#' @export
#' @examples
#' f <- factor(c("a", "b", "c"))
#' g <- factor(c("x", "y", "z"))
#' fct_paste(f, g, sep="-")
fct_paste <- function(..., sep=" ") {
  input_fct <- Map(check_factor, list(...))
  
  my_paste <- function(input) do.call(paste, append(input, list(sep=sep)))
   
  fcts <- Map(function(fct) as.character(levels(fct)),input_fct)
  
  new_factor_lvls <- do.call( my_paste , do.call(expand.grid, fcts) )
  
  factor(my_paste(input_fct), levels=new_factor_lvls)
}
