# checks input types

    Code
      fct(1:3)
    Condition
      Error in `fct()`:
      ! `x` must be a character vector
    Code
      fct("x", 1:3)
    Condition
      Error in `fct()`:
      ! `levels` must be a character vector
    Code
      fct("x", "y", na = 1)
    Condition
      Error in `fct()`:
      ! `na` must be a character vector

# clear error if levels are incomplete

    Code
      fct(c("x", "y", "z"), c("x", "y"))
    Condition
      Error in `fct()`:
      ! All values of `x` must appear in `levels` or `na`
      i Missing level: "z"

