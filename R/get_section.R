#' Get section
#'
#' @param polygon : SpatialPolygoneDataFrame de l'adresse (cadaster_type = "sections" quand on get_cadaster_sp)
#'
#' @return section of the town of a polygon
#' @export
#'
#' @examples
#' \dontrun{
#' sections_df <- cadastertools::get_cadaster_sp(adress_data$citycode, layer = "sections")
#' section <- get_nearest_polygon(section_df, adress_data$longitude, adress_data$latitude)
#' section_name <- get_section(section)
#' }
get_section <- function(polygon){
  # TO BE CHANGED TO SF
  numero_section <- polygon[[2]]@data["id"]
  return(numero_section)
}
