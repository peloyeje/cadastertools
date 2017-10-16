#' returns sp::PolygonesDataFrame with all the infos on the cadaster type of a "commune"
#'
#' @param communal_code code of the desired city
#' @param cadaster_type type of cadaster to extract
#'
#' @return
#' @export
#' @import assertthat
#' @import dplyr
#' @import geojsonio
#' @import stringr
#'
#' @examples
#' \dontrun{
#' get_cadaster_sp(75116, cadaster_type = "parcelles")
#' }
get_cadaster_sp <- function (communal_code, cadaster_type = "batiments"){
  assertthat::assert_that(cadaster_type %in% c("parcelles", "feuilles", "sections", "communes", "batiments"),
                          msg = "please enter valid cadaster_type (\"parcelles\", \"feuilles\", \"sections\", \"communes\", \"batiments\")")

  communal_code <- as.character(communal_code)
  data_url <- paste("https://cadastre.data.gouv.fr/data/etalab-cadastre/latest/geojson/communes/",
                    stringr::str_extract(communal_code, "[0-9]{2}"),
                    "/",
                    communal_code,
                    "/cadastre-",
                    communal_code,
                    "-",
                    cadaster_type,
                    ".json.gz",
                    sep = "")

  temp_dir <- tempdir()
  temp_file_name <- file.path(temp_dir, "out.json")

  write(readLines(gzcon(url(data_url)), warn = FALSE), file = temp_file_name)

  data <- geojsonio::geojson_read(temp_file_name, what = "sp")

  return(data)
}
