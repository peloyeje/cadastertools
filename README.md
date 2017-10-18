# cadastertools 

This is a package that provieds usefool tools to request and treat data from the different databases of the French cadaster. 
It also handles some manipulation of sp objects in order to be able extract the correct polygon from a (longitude, lattitude) localisation. 

#### get_adress_data

this function querys the Ban database to get the informations (in particular the citycode, longitude and lattitude) for a given adress. It returns a dataframe with the informatioons for each adress that is a match with the specified adress

### get_cadaster_sp 

this function allows you to download the cadaster data of a town in a `sp::SpatialPolygonsDataFrame`. It also puts the specified town data (compressed) in a cache folder. If the town data is already in the cahe, it doesn't downlaod it but only decompresses it and transforms it in sp 

### select_polygon 

selects the polygon which contains a specified point within a `SpatialPolygonsDataFrame`. 
if the point is indeed in a polygon in retruns a list with `TRUE` and the polygon. If not it retruns a list with `FALSE`and the closest polygon in the `SpatialPolygonsDataFrame`

### get_areas 

retruns a vector with the areas of the polygons in a `SpatialPolygonsDataFrame` 