# Preamble
# ----------------------------------------
# Script Name: 02-test_data.R
# Author: Shamayla Durrin Islam
# Date: 22 September 2024
#contact: Shamayla.islam@mail.utoronto.ca
# Description:
# This script performs a comparison between the actual dataset and the simulated dataset
# by generating side-by-side bar plots for key variables such as RACE_BIAS, PRIMARY_OFFENCE,
# LOCATION_TYPE, and ARREST_MADE. The script also verifies the consistency of OCCURRENCE_DATE
# and REPORTED_DATE ranges between the actual and simulated data.
#
# The comparison shows that the simulated data carefully resembles the actual data in terms 
# of the distributions of key variables. All plots are saved in the 'outputs' folder:
# - race_bias_comparison.png
# - primary_offence_comparison.png
# - location_type_comparison.png
# - arrest_made_comparison.png
#
# The date range comparison is printed to the console for manual verification.
# ----------------------------------------




# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load actual and simulated data
actual_data <- read.csv("data/raw_data/unedited_data.csv")
simulated_data <- read.csv("data/raw_data/simulated_data.csv")

# Helper function to create comparison plots
create_comparison_plot <- function(actual_col, simulated_col, col_name) {
  # Create a data frame for plotting
  actual_df <- data.frame(Value = actual_col, Type = "Actual Data")
  simulated_df <- data.frame(Value = simulated_col, Type = "Simulated Data")
  
  combined_df <- rbind(actual_df, simulated_df)
  
  # Generate the comparison plot
  ggplot(combined_df, aes(x = Value, fill = Type)) +
    geom_bar(position = "dodge", alpha = 0.7) +
    theme_minimal() +
    labs(title = paste("Distribution of", col_name),
         x = col_name,
         y = "Count") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    scale_fill_manual(values = c("Actual Data" = "blue", "Simulated Data" = "red"))
}

# 1. Plot comparison for RACE_BIAS
race_bias_plot <- create_comparison_plot(actual_data$RACE_BIAS, simulated_data$RACE_BIAS, "Race Bias")

# 2. Plot comparison for PRIMARY_OFFENCE
primary_offence_plot <- create_comparison_plot(actual_data$PRIMARY_OFFENCE, simulated_data$PRIMARY_OFFENCE, "Primary Offence")
primary_offence_plot
# 3. Plot comparison for LOCATION_TYPE
location_type_plot <- create_comparison_plot(actual_data$LOCATION_TYPE, simulated_data$LOCATION_TYPE, "Location Type")

# 4. Plot comparison for ARREST_MADE
arrest_made_plot <- create_comparison_plot(actual_data$ARREST_MADE, simulated_data$ARREST_MADE, "Arrest Made")

# 5. Check if date ranges match
# Check OCCURRENCE_DATE range
occurrence_date_comparison <- data.frame(
  Data = c("Actual", "Simulated"),
  Min_Occurrence_Date = c(min(as.Date(actual_data$OCCURRENCE_DATE)), min(as.Date(simulated_data$OCCURRENCE_DATE))),
  Max_Occurrence_Date = c(max(as.Date(actual_data$OCCURRENCE_DATE)), max(as.Date(simulated_data$OCCURRENCE_DATE)))
)

# Check REPORTED_DATE range
reported_date_comparison <- data.frame(
  Data = c("Actual", "Simulated"),
  Min_Reported_Date = c(min(as.Date(actual_data$REPORTED_DATE)), min(as.Date(simulated_data$REPORTED_DATE))),
  Max_Reported_Date = c(max(as.Date(actual_data$REPORTED_DATE)), max(as.Date(simulated_data$REPORTED_DATE)))
)

# Print the date range comparison
print("Occurrence Date Comparison:")
print(occurrence_date_comparison)

print("Reported Date Comparison:")
print(reported_date_comparison)

# Save the plots
ggsave("outputs/race_bias_comparison.png", plot = race_bias_plot, width = 8, height = 6)
ggsave("outputs/primary_offence_comparison.png", plot = primary_offence_plot, width = 8, height = 6)
ggsave("outputs/location_type_comparison.png", plot = location_type_plot, width = 8, height = 6)
ggsave("outputs/arrest_made_comparison.png", plot = arrest_made_plot, width = 8, height = 6)

# Display the plots
print(race_bias_plot)
print(primary_offence_plot)
print(location_type_plot)
print(arrest_made_plot)


