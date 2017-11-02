#' JSON to SF
#'
#' Parses the provided GeoJSON to a Simple Features dataframe
#'
#' @param json_file A path to the JSON file to parse
#'
#' @return A sp::SpatialPolygonsDataFrame
#'
#' @import assertthat
#' @import sf
#' @importFrom magrittr %>%
#' @export
#'
#' @examples
#' \dontrun{
#' json_to_sf("../../cadaster-75001.json")
#' }
json_to_sf <- function(json_file) {
  # We define some base variables
  epsg_code <- 4326 # Geographic CRS

  # We validate the file
  assertthat::assert_that(
    file.exists(json_file),
    msg = "The file doesn't exist"
  )
  assertthat::assert_that(
    assertthat::has_extension(json_file, "json"),
    msg = "You must provide a JSON file"
  )

  return(
    json_file %>%
      sf::read_sf() %>%
      sf::st_transform(epsg_code)
  )
}
