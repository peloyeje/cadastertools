#' get_areas
#'
#' @param polygon_df your SpatialPolygonsDataFrame
#'
#' @return returns the area of the polygon of a given address
#' @export
#' @importFrom methods slot
#' @examples
#' \dontrun{
#' get_areas(polygon_df)
#' }
get_areas <- function(polygon_df){
  polygon_list <- lapply(polygon_df@polygons , methods::slot , "Polygons")
  areas_list <- lapply(polygon_list, function(x) slot(x[[1]], "area"))
  return(areas_list)
}
