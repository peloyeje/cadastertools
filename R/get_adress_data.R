#' gets detailed dataframe of the adresses that match a query adress
#'
#' @param query_adress adresss to query
#'
#' @return
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
