#' Get area
#'
#' Computes the area of a list of Single Feature geometries
#'
#' @param sf_dataframe A Single Features dataframe with geometries
#'
#' @return A "units" object
#' @export
#' @import assertthat
#' @import sf
#'
#' @examples
#' \dontrun{
#' get_area(sf_dataframe)
#' }
get_area <- function(sf_dataframe){
  areas <- sf::st_area(sf_dataframe)
  return(areas)
}
