#' Download cadaster
#'
#' Downloads the json file containing the geo info according to the provided city_code and layer
#' @param city_code A city code (string/number)
#' @param layer The layer we want to get (string)
#'
#' @return A file path to the downloaded json file
#' @export
#'
#' @import assertthat
#' @import glue
#' @importFrom utils download.file
#' @importFrom R.utils gunzip
#'
#' @examples
#' \dontrun{
#' download_cadaster("75001", "batiments")
#' }
download_cadaster <- function(city_code, layer = "batiments") {
  # We set some base variables
  available_layers <- c("parcelles", "feuilles", "sections", "communes", "batiments")
  cadaster_base_url <- "https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson"
  gzip_extension <- ".gz"

  # We validate parameters
  city_code <- as.character(city_code)

  assertthat::assert_that(
    grepl("^[0-9]{5}$", city_code),
    msg = "Please provide a valid city code"
  )
  assertthat::assert_that(
    layer %in% available_layers,
    msg = glue::glue("Please enter valid cadaster type : { glue::collapse(available_layers, sep = \", \") }")
  )

  # We build the filename of the cadaster and its path
  cadaster_filename <- glue::glue("cadastre-{city_code}-{cadaster_type}.json")
  cadaster_filepath <- file.path(tempdir(), cadaster_filename)

  if (!file.exists(cadaster_filepath)) {
    # We download the json.gz cadaster file from the gouv website
    tempfile <- tempfile()
    cadaster_url <- glue::glue(
      "{cadaster_base_url}/communes/{region_code}/{city_code}/{cadaster_filename}{gzip_extension}",
      region_code = substring(city_code, 0, 2)
    )
    utils::download.file(
      url = cadaster_url,
      destfile = tempfile,
      method = "auto"
    )
    # We decompress it
    R.utils::gunzip(
      filename = tempfile,
      destname = cadaster_filepath,
      remove = TRUE # Remove the temp file
    )
  }

  return(cadaster_filepath)
}
