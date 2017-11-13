#' Polygon from list
#'
#' Creates polygon from coordinate list
#'
#' @param list_of_points List of point vectors
#'
#' @return a sfc
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
