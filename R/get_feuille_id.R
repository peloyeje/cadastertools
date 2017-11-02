#' get_feuille_id
#' Fonction qui donne le numero de feuille <- pas encore commit ce commentaire !
#'
#' @param poly : unique sf polygon, output de slelect_polygon(get_cadaster_sp(cadaster_type = "feuilles"), long, lat)
#'
#' @return The "feuille" number
#' @export
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' get_feuille_id(polygon)
#' }
get_feuille_id <- function(poly){
  assertthat::assert_that(inherits(poly, "sf"), msg = "function only works with sf polygons")
  assertthat::assert_that(dim(poly)[1] == 1, msg = "function works with unique polygon use cadastertools::select_polygon")
  numero_feuille <- poly[[1]]
  return(numero_feuille)
}

