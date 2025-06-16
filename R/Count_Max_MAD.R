#' Count_Max_MAD
#'
#' Compute the max MAD in a vector
#' 
#' @param data a vector of your data
#' @export

Count_Max_MAD <- function(data){
  
  median_val <- median(data, na.rm = TRUE)
  
  mad_val <- median(abs(data - median_val), na.rm = TRUE)
  
  if (mad_val == 0) {
    mad_val <- 1e-10  
  }
  
  mad_scores <- abs(data - median_val) / mad_val
  
  max_score <- max(mad_scores)
  return(max_score)
}