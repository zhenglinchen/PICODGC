library(ape)

#' PICODGC
#'
#' Perform PICODGC
#'
#' @param my_df dataframe of traits 
#' @param X trait1 name
#' @param Y trait2 name
#' @param my_tree phylogenetic tree
#' @param MAD_threshold MAD threshold of outlier
#' @param threshold.auto logical value, TRUE means using the estimated threshold automatically according to the sample size, if False, you can indicate MAD_threshold manually 
#' @return PICODGC model
#' @export



PIC_ODGC <- function(my_df,X,Y,my_tree,MAD_threshold,threshold.auto=TRUE){
  Y_vec <- my_df[,Y]
  X_vec <- my_df[,X]
  
  names(Y_vec) <- rownames(my_df)
  names(X_vec) <- rownames(my_df)
  
  PIC_Y <- pic(Y_vec,my_tree)
  PIC_X <- pic(X_vec,my_tree)
  
  PIC_Y_mad_max <- Count_Max_MAD(PIC_Y)
  PIC_X_mad_max <- Count_Max_MAD(PIC_X)
  
  tips_num <- length(PIC_X)
    
  if (threshold.auto){
    MAD_threshold <- Get_Recommand_K(tips_num)
  }else{
    MAD_threshold <- MAD_threshold
  }
  
  
  if (tips_num <30){
    PIC_Y_normal_p <- shapiro.test(PIC_Y)$p.value
    PIC_X_normal_p <- shapiro.test(PIC_X)$p.value
    
    if (PIC_Y_mad_max > MAD_threshold | PIC_X_mad_max > MAD_threshold | 
        PIC_Y_normal_p<0.05 | PIC_X_normal_p<0.05){
      PIC_ODGC_fit <- cor.test(PIC_Y,PIC_X,method="spearman")
    }else{
      PIC_ODGC_fit <- cor.test(PIC_Y,PIC_X,method="pearson")
    }
  }else{
    if (PIC_Y_mad_max > MAD_threshold | PIC_X_mad_max > MAD_threshold){
      PIC_ODGC_fit <- cor.test(PIC_Y,PIC_X,method="spearman")
    }else{
      PIC_ODGC_fit <- cor.test(PIC_Y,PIC_X,method="pearson")
    }
  }
  
  return(PIC_ODGC_fit)
  
}

