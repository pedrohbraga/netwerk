## Go to Code, Insert Roxygen Skeleton to automatically fill
## arguments(which start with #')
## One muse include export, otherwise the function will be internal

#' Calculate the sum of elements in a numeric matrix
#'
#'
#' @param x the matrix to be summed
#'
#' @return Integer
#' @export

matrix_sum <- function(x){
  if(is.matrix(x) != TRUE) stop("Not a matrix!")
  return(sum(x))
}
