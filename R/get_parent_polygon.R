#' Get parent polygon
#'
#' Gets the shape of the sf_dataframe that intersects the given polygon
#'
#' @param polygon A sfg object (single polygon)
#' @param sf_dataframe A SF dataframe
#'
#' @return A 1*n SF dataframe containing the matched line
#' @export
#' @import sf
#'
#' @examples
#' \dontrun{
#' feuille <- get_parent_polygon(building, parcelles)
#' }
get_parent_polygon <- function(polygon, sf_dataframe) {
  filter <- sf::st_intersects(sf_dataframe$geometry, polygon$geometry, sparse = FALSE)
  return(
    sf_dataframe[filter, ][1, ]
  )
}
