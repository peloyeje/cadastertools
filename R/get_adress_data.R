#' Get address data
#'
#' Retrieves add addresses (+ useful info) that match the address query
#'
#' @param query_adress address to query
#'
#' @return A dataframe
#' @export
#' @import banR
#'
#' @examples
#' \dontrun{
#' get_adress_data("12, rue de Lota 75116 Paris")
#' }
get_adress_data <- function(query_adress){
  suppressMessages(
adress_data <- banR::geocode(query = query_adress)
)
return(adress_data)
}
