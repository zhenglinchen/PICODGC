Calculate_K_FromCoverage <- function(coverage) {
  MAD_to_SD <- 0.67449
  q <- qnorm((1 + coverage)/2)
  k <- q / MAD_to_SD
  return(k)
}