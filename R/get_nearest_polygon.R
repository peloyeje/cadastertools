#' Get nearest polygon
#'
#'
#'
#' @param sf_dataframe dataframe containing polygons to choose from
#' @param lat latitude of the point
#' @param long longitude of the point
#'
#' @return sf_dataframe with the closest polygon
#' @export
#'
#' @import sf
#' @import dplyr
#' @importFrom magrittr %>%
#'
#' @examples
#' \dontrun{
#' get_nearest_polygon(town, adress_data$longitude, adress_data$latitude)
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

  # Filter df by contain test
  return(
    sf_dataframe %>%
      sf::st_transform(crs = epsg_codes$proj) %>%
      dplyr::mutate(
        distance = as.numeric( sf::st_distance(
         sf::st_transform(point, crs = epsg_codes$proj),
          geometry
        ))
      ) %>%
      sf::st_transform(crs = epsg_codes$geo) %>%
      dplyr::arrange(distance)  %>%
      dplyr::top_n(-1)
  )
  # filter_list <- sf::(sf_dataframe, point)
  #
  # return(sf_dataframe[(lengths(filter_list) > 0), ])
}
