#' get_section
#'
#' @param polygon : SpatialPolygoneDataFrame de l'adresse (cadaster_type = "sections" quand on get_cadaster_sp)
#'
#' @return
#' @export
#'
#' @examples
get_section <- function(polygon){
  numero_section <- polygon[[2]]@data["id"]
  return(numero_section)
}
