library(sf)
library(dplyr)
library(readr)

# Read locations data
incident_locations <- read_csv("Data/Incident Locations.csv")
incident_locations$INCIDENT_NO <- as.character(incident_locations$INCIDENT_NO)

# Create geometry column
incident_locations <- st_as_sf(incident_locations, coords = c("LON", "LAT"), crs = 4326)

# Import San Francisco Zip Code Shapefile
gdf_zips <- st_read("Data/Zip Codes/geo_export_68affbe4-ce61-4d6c-b707-ce1a0ebed55d.shp")

# Check and set CRS if they are different
if (st_crs(incident_locations) != st_crs(gdf_zips)) {
  gdf_zips <- st_transform(gdf_zips, crs = st_crs(incident_locations))
}

# Spatial Join
joined_data1 <- st_join(incident_locations, gdf_zips, join = st_intersects)

# Import San Francisco Supervisor Districts Shapefile
gdf_sup <- st_read("Data/Supervisor Districts/geo_export_323aac1a-7340-4c45-a771-a9d2084355b0.shp")

# Check and set CRS if they are different
if (st_crs(incident_locations) != st_crs(gdf_sup)) {
  gdf_sup <- st_transform(gdf_sup, crs = st_crs(incident_locations))
}

# Spatial Join
joined_data2 <- st_join(incident_locations, gdf_sup, join = st_intersects)

# Import San Francisco Neighborhoods Shapefile
gdf_nhoods <- st_read("Data/Neighborhoods/geo_export_d783cca7-4b0f-4bf8-9c5a-4018d6431a44.shp")

# Check and set CRS if they are different
if (st_crs(incident_locations) != st_crs(gdf_nhoods)) {
  gdf_nhoods <- st_transform(gdf_nhoods, crs = st_crs(incident_locations))
}

# Spatial Join
joined_data3 <- st_join(incident_locations, gdf_nhoods, join = st_intersects)

# Import San Francisco Police Districts Shapefile
gdf_police_districts <- st_read("Data/Police Districts/geo_export_d75d86f0-92e8-499f-b896-07c12a786b06.shp")

# Check and set CRS if they are different
if (st_crs(incident_locations) != st_crs(gdf_police_districts)) {
  gdf_police_districts <- st_transform(gdf_police_districts, crs = st_crs(incident_locations))
}

# Spatial Join
joined_data4 <- st_join(incident_locations, gdf_police_districts, join = st_intersects)

# Identify overlapping columns
overlapping_columns <- intersect(colnames(joined_data1), colnames(joined_data2))
overlapping_columns <- union(overlapping_columns, intersect(colnames(joined_data1), colnames(joined_data3)))
overlapping_columns <- union(overlapping_columns, intersect(colnames(joined_data1), colnames(joined_data4))) 

# Exclude overlapping columns from subsequent joins
non_overlapping_joined_data2 <- joined_data2[, !(colnames(joined_data2) %in% overlapping_columns)]
non_overlapping_joined_data3 <- joined_data3[, !(colnames(joined_data3) %in% overlapping_columns)]
non_overlapping_joined_data4 <- joined_data4[, !(colnames(joined_data4) %in% overlapping_columns)]

# Combine the Spatial Data Frames
combined_data <- cbind(joined_data1, non_overlapping_joined_data2, non_overlapping_joined_data3, non_overlapping_joined_data4)

# Drop unnecessary columns
combined_data <- combined_data[, !(colnames(combined_data) %in% c('geometry.1', 'geometry.2', 'geometry.3', 'objectid', 'st_length_', 'company', 'shape_le_1', 'shape_leng', 'index_right', 'multigeom', 'id', 'date_dat_2', 'pop10_sqmi', 'pop2010', 'sqmi', 'st_area_sh', 'state', 'zip_code', 'time_dat_2', 'sup_dist_n', 'sup_dist_2', 'sup_dist_p', 'po_name', 'date_data_', 'time_data_'))]

# Write to CSV
write_csv(combined_data, "Outputs/combined_data.csv")