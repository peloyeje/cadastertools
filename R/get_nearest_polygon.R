#' Get nearest polygon
#'
#'
#'
#' @param sf_dataframe
#' @param lat
#' @param long
#'
#' @return
#' @export
#'
#' @import sf
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @examples
get_nearest_polygon <- function(sf_dataframe, long, lat) {
  # We define some base variables
  epsg_codes <- list(
    geo = 4326, # Geo CRS - WSG 84
    proj = 3857 # Google Mercator
  )
  threshold <- 0.0001

  # We create the address geometry
  point <- sf::st_point(c(long, lat))

  # Filter df by contain test
  return(
    sf_dataframe %>%
      sf::st_transform(crs = epsg_codes$proj) %>%
      dplyr::mutate(
        distance = sf::st_distance(
          sf::st_transform(point, crs = epsg_codes$proj),
          geometry
        )
      ) %>%
      sf::st_transform(crs = epsg_codes$geo)
  )
  # filter_list <- sf::(sf_dataframe, point)
  #
  # return(sf_dataframe[(lengths(filter_list) > 0), ])
}
