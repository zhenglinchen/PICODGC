#' CalculateIQR
#'
#' This function calculates the distance of each data point from the nearest quartile boundary, expressed in units of the Interquartile Range (IQR). It returns a vector where each element indicates how many IQR units a data point deviates from either the first quartile (Q1) or third quartile (Q3), depending on its position relative to the interquartile range.
#' 
#' @param data a vector of your data
#' @export


CalculateIQR <- function(data) {

  q1 <- quantile(data, 0.25, na.rm = TRUE)
  q3 <- quantile(data, 0.75, na.rm = TRUE)
  iqr <- q3 - q1
  
  distances <- numeric(length(data))

  for (i in seq_along(data)) {
    x <- data[i]
    
    if (is.na(x)) {
      distances[i] <- NA
    } else if (x < q1) {
      distances[i] <- (q1 - x) / iqr
    } else if (x > q3) {
      distances[i] <- (x - q3) / iqr
    } else {
      distances[i] <- 0
    }
  }
  
  return(distances)
}


