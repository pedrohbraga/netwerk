#' Calculation of the number of degrees to basal species
#'
#' @param L
#'
#' @return A vector of the distance to the base for every species. Producers have a default distance of 1. Unconnected species have a distance of 0
#' @export
#'
#' @examples
#' @author Dominique Gravel
dbase_fn = function(L) {
  NS = nrow(L)

  # Remove cannibalism
  diag(L)=0

  # First, identify the basal species
  nprey = apply(L,2,sum, na.rm = TRUE)
  basal = numeric(nrow(L))
  basal[nprey == 0] = 1
  rk = basal

  # Second, identify who feeds on the basal species
  for(k in 2:10) {
    for(i in 1:NS) {
  	  for(j in 1:NS){
		if(rk[i]==k-1 && rk[j] == 0 && L[i,j]%in%1 && i!=j) rk[j] = k
			}
		  }
		}
	return(rk)
}


