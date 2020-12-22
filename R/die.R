#' @title Die
#' @description Creates an object of class \code{"die"}
#' @param sides vector of die sides
#' @param prob vector of die probabilities
#' @return an object of class \code{"die"}
#' @export
die <- function(sides = c(1, 2, 3, 4, 5, 6), prob = c(rep(1/6, 6))){
  check_sides(sides)
  check_prob(prob)
  lst <- list(sides = sides, prob = prob)
  class(lst) <- "die"
  return(lst)
}

# private function to check vector of sides
check_sides <- function(sides){
  if(length(sides) != 6){
    stop("\n'sides' must be a vector of length 6")
  }
  if(!is.numeric(sides) & !is.character(sides)) {
    stop("\n'sides' must be a character or numeric vector")
  }else{
    TRUE
  }
}

# private function to check vector of probabilities
check_prob <- function(prob){
  if(sum(prob) != 1){
    stop("elements in 'prob' must add up to 1")
  }
  if(any(prob < 0) | any(prob > 1)) {
    stop("\n'prob' values must be between 0 and 1")
  }
  if(any(is.na(prob))){
    stop("\n'prob' cannot contain missing values")
  }
  if(length(prob) != 6 | !is.numeric(prob)) {
    stop("\n'prob' must be a numeric vector of length 6")
  }else{
    TRUE
  }
}

#' @export
print.die <- function(x){
  cat('object "die"\n\n')
  cd <- data.frame(
    side = x$sides, prob = x$prob
  )
  print(cd)
  invisible(x)
}
