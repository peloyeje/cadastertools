#' selects the polygon whoch contains the lattitude and the lattitude specified in a SpatialPolygoneDataFrame
#'
#' @param long the longitude
#' @param lat the latitude
#' @param sp_data the SpatialPolygoneDataFrame
#'
#' @return
#' @export
#' @import sp
#'
#' @examples
#' \dontrun{
#' select_polygone(12.05, 14.215, my_data)
#' }
select_polygone <- function (long, lat, sp_data){
  assertthat::assert_that(class(sp_data) == "SpatialPolygonsDataFrame", msg = "function only supports SpatialPolygonsDataFrame as input")

  point <- sp::SpatialPoints(cbind(long, lat),
                             proj4string = sp::CRS(sp::proj4string(sp_data)))

  house_index <- point %over% sp::SpatialPolygons( sp_data@polygons,
                                                   proj4string = sp::CRS(sp::proj4string(sp_data)))
  return( sp_data[house_index,])
}
