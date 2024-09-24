# Preamble:
# This script performs data cleaning on the raw hate crime dataset.
# The steps include:
# 1. Converting date columns to proper Date format.
# 2. Handling missing values in key columns (e.g., LOCATION_TYPE).
# 3. Formatting time columns (e.g., OCCURRENCE_TIME, REPORTED_TIME).
# 4. Ensuring consistency in categorical columns (e.g., ARREST_MADE).
# 5. Removing unnecessary columns (e.g., X_id).
# Author: Shamayla Durrin Islam
# Date: 22 September 2024

# Load necessary libraries
library(dplyr)

# Load the raw dataset (assuming it's stored in data/raw_data/unedited_data.csv)
raw_data <- read.csv(here::here("data/raw_data/unedited_data.csv"))

# 1. Convert OCCURRENCE_DATE and REPORTED_DATE to Date format
raw_data$OCCURRENCE_DATE <- as.Date(raw_data$OCCURRENCE_DATE, format = "%Y-%m-%d")
raw_data$REPORTED_DATE <- as.Date(raw_data$REPORTED_DATE, format = "%Y-%m-%d")

# 2. Handle missing values in LOCATION_TYPE
# If LOCATION_TYPE is missing, fill it with 'Unknown'
raw_data$LOCATION_TYPE[is.na(raw_data$LOCATION_TYPE)] <- "Unknown"

# 3. Convert OCCURRENCE_TIME and REPORTED_TIME to HH:MM format (assuming they are in HHMM integer format)
raw_data$OCCURRENCE_TIME <- sprintf("%04d", raw_data$OCCURRENCE_TIME)  # Ensure 4 digits
raw_data$OCCURRENCE_TIME <- substr(raw_data$OCCURRENCE_TIME, 1, 2) %>% paste0(":", substr(raw_data$OCCURRENCE_TIME, 3, 4))

raw_data$REPORTED_TIME <- sprintf("%04d", raw_data$REPORTED_TIME)  # Ensure 4 digits
raw_data$REPORTED_TIME <- substr(raw_data$REPORTED_TIME, 1, 2) %>% paste0(":", substr(raw_data$REPORTED_TIME, 3, 4))

# 4. Ensure ARREST_MADE contains only "YES" or "NO"
# If any values are not "YES" or "NO", replace them with NA
raw_data$ARREST_MADE <- ifelse(raw_data$ARREST_MADE %in% c("YES", "NO"), raw_data$ARREST_MADE, NA)

# 5. Remove the X_id column (if not needed)
raw_data <- raw_data %>% select(-X_id)

# Save the cleaned dataset to a new CSV file
write.csv(raw_data, file = here::here("data/analysis_data/cleaned_data.csv"), row.names = FALSE)

# Display the first few rows of the cleaned dataset
head(raw_data)

# Summary of the cleaned dataset
summary(raw_data)

