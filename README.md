# Cadaster Tools

This package provides functions to request and processes data from various databases of the French cadaster. 
It also handles manipulation of sp objects in order to extract the correct polygon from a (longitude, lattitude) tuple. 

**Data sources**: BANO, French cadaster open data

**R packages**
- sf 
- banR
- dplyr
- magrittr
- assertthat
- glue
- R.utils

### Installation

1. Install `devtools`
2. Run `devtools::install_github("peloyeje/cadastertools")`

### API reference

All function definitions are located in the `R/` folder.

- **get_bano_matches**: Retrieves all addresses that match the query from the BANO database.
- **download_cadaster**: Downloads the json file containing the geo info according to the provided city_code and layer.
- **json_to_sf**: Parses the provided GeoJSON into a Simple Features dataframe.
- **get_nearest_polygon**: Gets the nearest polygon from a long lat point in a given SF dataframe.
- **get_parent_polygon**: Gets the shape of the sf_dataframe that intersects a given polygon.
- **get_area**: Computes the area of a list of Single Feature shapes.
- **polygon_from_list**: Creates a polygon from a coordinates list.

### Authors
- Régis Bouyoux
- Jean-Eudues Peloye 
- Antoine Redier 
