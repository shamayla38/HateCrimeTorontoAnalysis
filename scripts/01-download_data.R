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