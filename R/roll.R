#' @title Roll a die
#' @description Creates an object of class \code{"roll"}
#' @param die object of class \code{"die"}
#' @param times number of rolls
#' @return an object of class \code{"roll"} with the following elements:
#' @return \item{rolls}{vector of rolls}
#' @return \item{sides}{vector of die \code{"sides"}}
#' @return \item{prob}{vector of die \code{"prob"}}
#' @return \item{total}{total number of rolls}
#' @export
#'
roll <- function(die, times = 1){
  check_times(times)
  rolls <- sample(die$sides, size = times, replace = TRUE, prob = die$prob)
  make_roll(die, rolls)
}

# private function to check vector of 'times'
check_times <- function(times){
  if (times %% 1 != 0 | times < 1){
    stop("\n'times' must be a positive integer value")
  }
  if(!is.integer(times) & !is.numeric(times)){
    stop("\n'times' must be a numeric value")
  }else{
    TRUE
  }
}

#' @title Make Roll Object
#' @description Constructor function for object "roll"
#' @param die object of class die
#' @param rolls object of class rolls
#' @keywords internal
make_roll <- function(die, rolls){
  res <- list(rolls = rolls, sides = die$sides, prob = die$prob, total = length(rolls))
  class(res) <- "roll"
  return(res)
}

#' @export
print.roll <- function(x){
  cat('object "roll"\n\n')
  cd <- list(
    rolls = x$rolls, sides = x$sides, prob = x$prob, total = x$total
  )
  print(list(rolls = x$rolls))
  invisible(x)
}

#' @export
summary.roll <- function(object){
  side <- object$sides
  count <- as.vector(table(object$rolls))
  prop <- count / object$total
  freqs <- data.frame(side, count, prop)
  res <- list(freqs = freqs)
  class(res) <-"summary.roll"
  res
}

#' @export
print.summary.roll <- function(x){
  cat('summary "roll"\n\n')
  print(x$freqs)
  invisible(x)
}

#' @export
"[.roll" <- function(x, i) {
  x$rolls[i]
}

#' @export
"[<-.roll" <- function(x, i, value) {
  if (value != x$sides[1] & value != x$sides[2] & value != x$sides[3]& value != x$sides[4]& value != x$sides[5]& value != x$sides[6]) {
    stop(sprintf('\nreplacing value must be %s, %s, %s, %s, %s, or %s',
                 x$sides[1], x$sides[2],  x$sides[3], x$sides[4], x$sides[5], x$sides[6]))
  }
  x$rolls[i] <- value
  make_roll(x, x$rolls)
}

#' @export
"+.roll" <- function(obj, incr) {
  if (length(incr) != 1 | incr <= 0) {
    stop("\ninvalid increment (must be positive)")
  }
  more_rolls <- roll(obj, times = incr)
  make_roll(obj, c(obj$rolls, more_rolls$rolls))
}
