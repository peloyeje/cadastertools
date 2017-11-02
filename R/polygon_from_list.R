#' polygon_from_list : create polygon from coordinate list
#'
#' @param point_list coordinate list
#'
#' @return sfc polygon
#' @export
#' @import sf
#'
#' @examples
#' \dontrun{
#' ls <- list(c(long, lat), c(long+ 0.001, lat), c(long+0.001, lat +0.0005))
#' poly <- polygon_from_list(ls)
#' }
polygon_from_list <- function(point_list){
  epsg <- 4326
  matrx <- matrix(nrow = length(point_list) +1, ncol = 2)
  for (i in 1:length(point_list) ){
    matrx[i,] <- cbind(point_list[[i]][1], point_list[[i]][2])
  }
  matrx[dim(matrx)[1],] <- matrx[1,]
  return(
    sf::st_polygon(list(matrx)) %>% sf::st_sfc(crs = epsg)
  )
}
