#' Get cadaster SP (DEPRECATED)
#'
#' Wrapper around download_cadaster and json_to_sf functions
#'
#' @param city_code A city code
#' @param layer A layer
#'
#' @return A SP dataframe
#' @export
#'
#' @examples
#' \dontrun{
#' get_cadaster_sp(75001, "batiments")
#' }
get_cadaster_sp <- function(city_code, layer = "batiments") {
  json_file <- download_cadaster(city_code, layer)
  return(json_to_sf(json_file))
}
