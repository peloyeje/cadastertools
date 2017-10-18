#' get_feuille_id
#' Fonction qui donne le numero de feuille <- pas encore commit ce commentaire !
#'
#' @param polygon : SpatialPolygoneDataFrame, output de get_cadaster_sp (cadaster_type = "feuilles")
#'
#' @return The "feuille" number
#' @export
#'
#' @examples
#' \dontrun{
#' get_feuille_id(polygon)
#' }
get_feuille_id <- function(polygon){
  numero_feuille <- polygon[[2]]@data["id"]
  return(numero_feuille)
}

# faire : select_polygone(adresse_antoine) selectionner la feuille
