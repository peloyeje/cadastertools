#' polygon_from_list : create polygon from coordinate list
#'
#' @param point_list coordinate list
#'
#' @return sfc polygon
#' @export
#' @import sf
#'
#' @examples
#' \dontrun{
#' ls <- list(c(long, lat), c(long+ 0.001, lat), c(long+0.001, lat +0.0005))
#' poly <- polygon_from_list(ls)
#' }
polygon_from_list <- function(list_of_points) {
  epsg <- 4326 # Geo CRS - WSG 84

  mat <- matrix(
    c(unlist(list_of_points), list_of_points[[1]]),
    ncol = 2,
    byrow = T
  )

  return(
    sf::st_polygon(list(mat)) %>% sf::st_sfc(crs = epsg)
  )
}
