#' selects the polygon whoch contains the lattitude and the lattitude specified in a SpatialPolygoneDataFrame
#'
#' @param long the longitude
#' @param lat the latitude
#' @param sp_data the SpatialPolygoneDataFrame
#'
#' @return
#' @export
#' @import sp
#' @importFrom rgeos gDistance
#'
#' @examples
#' \dontrun{
#' select_polygone(12.05, 14.215, my_data)
#' }
select_polygone <- function (sp_data, long, lat){
  assertthat::assert_that(class(sp_data) == "SpatialPolygonsDataFrame", msg = "function only supports SpatialPolygonsDataFrame as input")

  point <- sp::SpatialPoints(cbind(long, lat),
                             proj4string = sp::CRS(sp::proj4string(sp_data)))

  house_index <- point %over% sp::SpatialPolygons( sp_data@polygons,
                                                   proj4string = sp::CRS(sp::proj4string(sp_data)))
    if (is.na(house_index))
    {
      perfectly_in = FALSE

      pDist <- vector()
      for(j in 1:dim(sp_data)[1]) {
          suppressWarnings(
          pDist <- append(pDist, rgeos::gDistance(point,sp_data[j,])))
      }
      house_index <- which.min(pDist)
    }else {
      perfectly_in = TRUE
    }
  return(list(perfectly_in, sp_data[house_index,]))
}
