# cadastertools 

This is a package that provieds usefool tools to request and treat data from the different databases of the French cadaster. 
It also handles some manipulation of sp objects in order to be able extract the correct polygon from a (longitude, lattitude) localisation. 

api used : BANO 
packages used : 
- sf 
- banR
- dplyr
- magrittr
- assertthat
- glue
- R.utils
- sf
- 

authors : 
- Régis Bouyoux
- Jean-Eudues Peloye 
- Antoine Redier 

### get_bano_matches 
 Retrieves all addresses (+ useful info) that match the address query in the BANO database
 
### download_cadaster
Downloads the json file containing the geo info according to the provided city_code and layer

### json_to_sf 
Parses the provided GeoJSON to a Simple Features dataframe

### get_nearest_polygon 
gets the nearest polygon from a long lat point in a given SF dataframe

### get_parent_polygon 
Gets the shape of the sf_dataframe that intersects the given polygon

### get_area 
Computes the area of a list of Single Feature geometries

### polygon_from_list
Creates polygon from coordinate list