#' get_areas
#'
#' @param query_adress
#' @param data
#'
#' @return returns the area of the polygon of a given address
#' @export
#' @importFrom methods slot
#' @examples
get_areas <- function(polygon_df){
  polygon_list <- lapply(polygon_df@polygons , methods::slot , "Polygons")
  areas_list <- lapply(polygon_list[[1]], function(x) slot(x, "area"))
  return(areas_list)
}
