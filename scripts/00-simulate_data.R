# Load necessary libraries
library(dplyr)

# Load the actual data
actual_data <- read.csv("data/raw_data/unedited_data.csv")

# Number of records in the actual dataset
n <- nrow(actual_data)

# Calculate proportions for each column in the actual data

# Distribution for LOCATION_TYPE
location_type_proportions <- prop.table(table(actual_data$LOCATION_TYPE))

# Distribution for AGE_BIAS
age_bias_proportions <- prop.table(table(actual_data$AGE_BIAS))

# Distribution for MENTAL_OR_PHYSICAL_DISABILITY
disability_proportions <- prop.table(table(actual_data$MENTAL_OR_PHYSICAL_DISABILITY))

# Distribution for RACE_BIAS
race_bias_proportions <- prop.table(table(actual_data$RACE_BIAS))

# Distribution for ETHNICITY_BIAS
ethnicity_bias_proportions <- prop.table(table(actual_data$ETHNICITY_BIAS))

# Distribution for LANGUAGE_BIAS
language_bias_proportions <- prop.table(table(actual_data$LANGUAGE_BIAS))

# Distribution for RELIGION_BIAS
religion_bias_proportions <- prop.table(table(actual_data$RELIGION_BIAS))

# Distribution for SEXUAL_ORIENTATION_BIAS
sexual_orientation_bias_proportions <- prop.table(table(actual_data$SEXUAL_ORIENTATION_BIAS))

# Distribution for GENDER_BIAS
gender_bias_proportions <- prop.table(table(actual_data$GENDER_BIAS))

# Distribution for PRIMARY_OFFENCE
primary_offence_proportions <- prop.table(table(actual_data$PRIMARY_OFFENCE))

# Distribution for ARREST_MADE
arrest_made_proportions <- prop.table(table(actual_data$ARREST_MADE))

# Now, simulate the new dataset based on the actual data distributions
set.seed(123)  # For reproducibility

simulated_data <- data.frame(
  EVENT_UNIQUE_ID = paste0("GO-", sample(201800000:201899999, n, replace = TRUE)),  # Random offense numbers
  
  OCCURRENCE_YEAR = sample(2018:2020, n, replace = TRUE),  # Randomly choose year (modify if you need real distribution)
  
  OCCURRENCE_DATE = sample(seq(as.Date("2018/01/01"), as.Date("2020/12/31"), by = "day"), n, replace = TRUE),  # Random date within range
  
  OCCURRENCE_TIME = sample(0:2359, n, replace = TRUE),  # Random time of day
  
  REPORTED_YEAR = sample(2018:2020, n, replace = TRUE),  # Random year (adjust if needed)
  
  REPORTED_DATE = sample(seq(as.Date("2018/01/01"), as.Date("2020/12/31"), by = "day"), n, replace = TRUE),  # Random reported date
  
  REPORTED_TIME = sample(0:2359, n, replace = TRUE),  # Random reported time
  
  DIVISION = sample(paste0("D", sample(10:55, n, replace = TRUE))),  # Random division codes
  
  LOCATION_TYPE = sample(names(location_type_proportions), size = n, replace = TRUE, prob = as.numeric(location_type_proportions)),
  
  AGE_BIAS = sample(names(age_bias_proportions), size = n, replace = TRUE, prob = as.numeric(age_bias_proportions)),
  
  MENTAL_OR_PHYSICAL_DISABILITY = sample(names(disability_proportions), size = n, replace = TRUE, prob = as.numeric(disability_proportions)),
  
  RACE_BIAS = sample(names(race_bias_proportions), size = n, replace = TRUE, prob = as.numeric(race_bias_proportions)),
  
  ETHNICITY_BIAS = sample(names(ethnicity_bias_proportions), size = n, replace = TRUE, prob = as.numeric(ethnicity_bias_proportions)),
  
  LANGUAGE_BIAS = sample(names(language_bias_proportions), size = n, replace = TRUE, prob = as.numeric(language_bias_proportions)),
  
  RELIGION_BIAS = sample(names(religion_bias_proportions), size = n, replace = TRUE, prob = as.numeric(religion_bias_proportions)),
  
  SEXUAL_ORIENTATION_BIAS = sample(names(sexual_orientation_bias_proportions), size = n, replace = TRUE, prob = as.numeric(sexual_orientation_bias_proportions)),
  
  GENDER_BIAS = sample(names(gender_bias_proportions), size = n, replace = TRUE, prob = as.numeric(gender_bias_proportions)),
  
  PRIMARY_OFFENCE = sample(names(primary_offence_proportions), size = n, replace = TRUE, prob = as.numeric(primary_offence_proportions)),
  
  ARREST_MADE = sample(names(arrest_made_proportions), size = n, replace = TRUE, prob = as.numeric(arrest_made_proportions)),
  
  HOOD_158 = sample(100:158, n, replace = TRUE)  # Random neighborhood ID
)

# View the first few rows of the simulated data
head(simulated_data)

# Save simulated data to a CSV file
write.csv(simulated_data, file = "data/raw_data/simulated_data.csv", row.names = FALSE)
