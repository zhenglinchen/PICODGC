library(ape)

#' PICODGC
#'
#' Perform PICODGC
#'
#' @param my_df dataframe of traits 
#' @param X trait1 name
#' @param Y trait2 name
#' @param my_tree phylogenetic tree
#' @param IQR_threshold IQR threshold of outlier
#' @return PICODGC model
#' @export



PIC_ODGC <- function(my_df,X,Y,my_tree,IQR_threshold=1.5){
  Y_vec <- my_df[,Y]
  X_vec <- my_df[,X]
  
  names(Y_vec) <- rownames(my_df)
  names(X_vec) <- rownames(my_df)
  
  PIC_Y <- pic(Y_vec,my_tree)
  PIC_X <- pic(X_vec,my_tree)
  
  PIC_Y_IQR_max <- max(CalculateIQR(PIC_Y))
  PIC_X_IQR_max <- max(CalculateIQR(PIC_X))
  
  tips_num <- length(PIC_X)
  
  
  if (tips_num <30){
    PIC_Y_normal_p <- shapiro.test(PIC_Y)$p.value
    PIC_X_normal_p <- shapiro.test(PIC_X)$p.value
    
    if (PIC_Y_IQR_max > IQR_threshold | PIC_X_IQR_max > IQR_threshold | 
        PIC_Y_normal_p<0.05 | PIC_X_normal_p<0.05){
      PIC_ODGC_fit <- cor.test(PIC_Y,PIC_X,method="spearman")
    }else{
      
      PIC_ODGC_fit <- lm(PIC_Y~PIC_X-1)
    }
  }else{
    if (PIC_Y_IQR_max > IQR_threshold | PIC_X_IQR_max > IQR_threshold){
      PIC_ODGC_fit <- cor.test(PIC_Y,PIC_X,method="spearman")
    }else{
      PIC_ODGC_fit <- lm(PIC_Y~PIC_X-1)
    }
  }
  
  return(PIC_ODGC_fit)
  
}

