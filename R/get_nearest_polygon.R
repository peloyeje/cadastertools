#' Get nearest polygon
#'
#' @param sf_dataframe A dataframe containing polygons to choose from
#' @param lat The latitude of the point
#' @param long The longitude of the point
#'
#' @return A 1*N SF dataframe containing the closest polygon
#' @export
#'
#' @import sf
#' @importFrom dplyr mutate
#' @importFrom dplyr arrange
#' @importFrom magrittr %>%
#'
#' @examples
#' \dontrun{
#' polygon <- get_nearest_polygon(town, adress_data$longitude, adress_data$latitude)
#' }
get_nearest_polygon <- function(sf_dataframe, long, lat) {
  # We define some base variables
  epsg_codes <- list(
    geo = 4326, # Geo CRS - WSG 84
    proj = 3857 # Google Mercator
  )
  threshold <- 0.0001

  # We create the address geometry
  point <- sf::st_point(c(long, lat)) %>% sf::st_sfc(crs=epsg_codes$geo)

  sf_dataframe <- sf_dataframe %>%
    # Change CRS to projected
    sf::st_transform(crs = epsg_codes$proj) %>%
    # Computes distance to point for each polygon
    dplyr::mutate(
      distance = as.numeric( sf::st_distance(
        sf::st_transform(point, crs = epsg_codes$proj),
        geometry
      ))
    ) %>%
    # Re-change CRS to geo projection
    sf::st_transform(crs = epsg_codes$geo) %>%
    # Sort by distance ASC
    dplyr::arrange(distance)

  return(sf_dataframe[1,])
}
