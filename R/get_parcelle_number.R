#' get_parcelle_number
#' Fonction qui donne le numero de la parcelle
#'
#' @param poly : sf_data frame with only one polygone
#'
#' @return The polygon number
#' @export
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' get_feuille_id(polygon)
#' }
get_parcelle_number<- function(poly){
  assertthat::assert_that(inherits(poly, "sf"), msg = "function only works with sf polygons")
  assertthat::assert_that(dim(poly)[1] == 1, msg = "function works with unique polygon use cadastertools::select_polygon")
  numero_feuille <- poly[[2]]
  return(numero_feuille)
}

