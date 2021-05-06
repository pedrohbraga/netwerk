##################
# Function calculating the statistics of food webs
# Input is a binary link matrix
# Returns a list with all the stats
# October 2011
# by Dominique Gravel
##################

#' Calculating statistics of food webs
#'
#' @param x binary link matrix
#'
#' @return Something
#'
#' @importFrom stats sd
#'
#' @export
#'
stats_fn <- function(x) {

  # Calculate the number of species
  NS = nrow(x)

  # Number of predators
  NPred = apply(x, 1, sum, na.rm = TRUE)

  # Number of preys
  NPrey = apply(x, 2, sum, na.rm = TRUE)

  # Calculate the number of producers
  Prod = numeric(NS)
  Prod[NPrey == 0] = 1
  NProd = sum(Prod)

  # Calculate which species is top
  Top = numeric(NS)
  Top[NPred==0]=1
  Top[Prod==1]=0
  NTop = sum(Top)

  # Calculate the number of intermediate
  NInt = NS-NProd-NTop

  # Calculate the fraction of herbivores
  DBase = dbase_fn(L)
  Herb = numeric(NS)
  Herb[DBase==2] = 1
  NHerb = sum(Herb)

  # Calculate the number of links
  NL = sum(x, na.rm=TRUE)

  # Calculate directed connectance
  C = NL/NS^2

  # SD of generality (only for consumers)
  GenSD = sd(NPrey[Prod==0])

  # Calculate vulnerability (following Wiliams and Martinez)
  VulSD = sd(NPred)

  # Calculate mean and max distance to basal species
  MeanDBase = mean(DBase)
  MaxDBase = max(DBase)

  MeanTR = mean(tr, na.rm = TRUE)
  MaxTR = max(tr, na.rm = TRUE)

  # Calculate the average omnivory index
  Omn = mean(TrophInd_myversion(x)[,2])

  # Report the results
  res = c(NS=NS,NBasale=NProd,NInt=NInt,NTop=NTop,NHerb=NHerb,NL=NL,C=C,GenSD=GenSD,VulSD=VulSD,MeanDBase=MeanDBase,MaxDBase=MaxDBase,MoyTR=MeanTR,MaxTR=MaxTR,Omn=Omn)

  return(res)
}
