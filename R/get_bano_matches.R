#' Get BANO matches
#'
#' Retrieves all addresses (+ useful info) that match the address query in the BANO database
#'
#' @param address Address to query
#'
#' @return A dataframe containing BANO search results
#' @export
#' @import banR
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' get_bano_matches("12, rue de Lota 75116 Paris")
#' }
get_bano_matches <- function(address) {
  assertthat::assert_that(
    length(address) != 0,
    msg = "You must enter an address"
  )

  return(
    banR::geocode(query = address)
  )
}
