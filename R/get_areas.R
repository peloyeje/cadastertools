#' get_areas
#'
#' @param polygon_df your SpatialPolygonsDataFrame
#'
#' @return returns the area of the polygon of a given address
#' @export
#' @import sp
#' @importFrom methods slot
#'
#' @examples
#' \dontrun{
#' get_areas(polygon_df)
#' }
get_areas <- function(polygon_df){
  polygon_df <- sp::spTransform(polygon_df, sp::CRS(paste("+proj=merc +lat_ts=48.84 +units=m")))
  polygon_list <- lapply(polygon_df@polygons , methods::slot , "Polygons")
  areas_list <- lapply(polygon_list, function(x){
    return(slot(x[[1]], "area"))
  })
  return(unlist(areas_list))
}
