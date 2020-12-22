#' @title Plot of object roll
#' @description Plots the relative frequencies in a barplot of a series of rolls
#' @param x an object of class \code{"die"}
#' @param num number of total rolls
#' @export
#'
plot.roll <- function(x, num = x$total){
  freq <- table(x$rolls)/x$total
  barplot(freq,
          main = sprintf("Frequencies in a series of %s die rolls", num),
          xlab = "sides of die",
          ylab = "relative frequencies",
          border = NA)
}
