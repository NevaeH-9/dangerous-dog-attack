#### Preamble ####
# Purpose: Downloads and saves the data from opendatatoronto
# Author: Yuanchen Miao
# Date: 24 September 2024
# Contact: vincent.miao@mail.utoronto.ca
# License: none
# Pre-requisites: none
# Any other information needed? none

# Work space set up
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("dogs-issued-dangerous-dog-orders")


# get all resources for this package
resources <- list_package_resources("dogs-issued-dangerous-dog-orders")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()


write_csv(data, "data/raw_data/raw_data.csv")