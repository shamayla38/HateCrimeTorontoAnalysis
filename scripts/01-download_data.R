
#### Preamble ####
# Purpose: Download and save the hate crimes dataset from Open Data Toronto.
# Author: Shamayla Durrin
# Date: 26 September 2024
# Contact: shamayla.islam@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `opendatatoronto` and `dplyr` packages must be installed.
# - Ensure internet connectivity to access the Open Data Toronto API.
# - The working directory should have a `data/raw_data/` folder to save the downloaded file.
# Any other information needed:
# - This script retrieves and saves the first available CSV or GeoJSON resource from the
# package titled "hate-crimes-open-data" from the Open Data Toronto portal.
# - The number of observations in the dataset is also printed for verification.


# Load necessary libraries
library(opendatatoronto)
library(dplyr)

# Get the package containing the dataset
package <- show_package("hate-crimes-open-data")

# Show package details (optional, to check what’s inside)
print(package)

# Get all resources associated with the package
resources <- list_package_resources(package)

# Identify datastore resources (CSV or GeoJSON formats)
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# Load the first datastore resource as a sample
data <- filter(datastore_resources, row_number() == 1) %>% get_resource()

# Save the downloaded data locally
write.csv(data, file = 'data/raw_data/unedited_data.csv', row.names = FALSE)


num_observations <- nrow(data)

# Print the number of observations
print(num_observations)