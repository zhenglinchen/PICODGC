#' Get_Recommand_K
#'
#' Get a appropriate K value inferred by sample size
#' @param n sample size
#' @export
Get_Recommand_K <- function(n){
  coverage_down <- 1-0.01/n 
  coverage_up <- 1-0.001/n 
  
  k1 <- Calculate_K_FromCoverage(coverage_up)-1
  k2 <- Calculate_K_FromCoverage(coverage_down)-1

  return(mean(k1,k2))
}
