#' Get cadaster SP
#'
#' Downloads the cadaster GeoJSON file associated with a city code and a data type (parcelles, etc.)
#' Returns a SP dataframe containing the geographic data
#'
#' @param city_code code of the desired city
#' @param cadaster_type type of cadaster to extract
#'
#' @return sp::SpatialPolygonsDataFrame
#'
#' @import assertthat
#' @import dplyr
#' @import geojsonio
#' @import sp
#' @importFrom glue glue
#' @importFrom R.utils gunzip
#' @importFrom utils download.file
#' @export
#'
#' @examples
#' \dontrun{
#' get_cadaster_sp(75001, cadaster_type = "parcelles")
#' }
get_cadaster_sp <- function(city_code, cadaster_type = "batiments") {
  # Base variables
  available_types <- c("parcelles", "feuilles", "sections", "communes", "batiments")
  cadaster_base_url <- "https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson"
  gzip_extension <- ".gz"

  # Validation
  city_code <- as.character(city_code)

  assertthat::assert_that(
    grepl("^[0-9]{5}$", city_code),
    msg = "Please provide a valid city code"
  )
  assertthat::assert_that(
    cadaster_type %in% available_types,
    msg = glue::glue("Please enter valid cadaster type : { glue::collapse(available_types, sep = \", \") }")
  )

  # Build the filename of the cadaster
  cadaster_filename <- glue::glue("cadastre-{city_code}-{cadaster_type}.json")
  cadaster_filepath <- file.path(tempdir(), cadaster_filename)

  if (!file.exists(cadaster_filepath)) {
    tmp <- tempfile()
    cadaster_url <- glue::glue(
      "{cadaster_base_url}/communes/{region_code}/{city_code}/{cadaster_filename}{gzip_extension}",
      region_code = substring(city_code, 0, 2)
    )
    utils::download.file(
      url = cadaster_url,
      destfile = tmp,
      method = "auto"
    )
    R.utils::gunzip(
      filename = tmp,
      destname = cadaster_filepath,
      remove = TRUE
    )
  }

  return(
    geojsonio::geojson_read(
      cadaster_filepath,
      what = "sp",
      p4s = "+proj=merc +lat_ts=48.84 +units=m"
    )
  )
}
