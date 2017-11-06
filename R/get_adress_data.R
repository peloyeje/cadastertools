#' Get address data
#'
#' Retrieves add addresses (+ useful info) that match the address query
#'
#' @param query_adress address to query
#'
#' @return A dataframe
#' @export
#' @import banR
#' @import assertthat
#'
#' @examples
#' \dontrun{
#' get_adress_data("12, rue de Lota 75116 Paris")
#' }
get_adress_data <- function(address) {
  assertthat::assert_that(
    length(address) != 0,
    msg = "You must enter an address"
  )

  return(
    banR::geocode(query = address)
  )
}
