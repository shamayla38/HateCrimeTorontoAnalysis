Hate Crimes in Toronto: An Analysis
Author: Shamayla Durrin Islam
Date: 22 September 2024
Repository Link: GitHub Repo

Project Overview

This project presents an analysis of hate crime occurrences in Toronto using data from Open Data Toronto. It explores hate crimes reported from 2018 to 2023, focusing on different bias categories like race, religion, ethnicity, and sexual orientation. The analysis examines the distribution of hate crimes across neighborhoods, types of bias, and primary offences. Additionally, the project uses simulated data to reproduce the dataset structure and supports a reproducible workflow using the opendatatoronto package in R.

Key Components:

Simulated Data: A script that simulates data based on the structure of the real dataset.
Data Download: A reproducible script for downloading the raw data using opendatatoronto.
Cleaning and Analysis: The dataset is cleaned and analyzed to produce summary statistics, graphs, and spatial visualizations of hate crime patterns in Toronto.
Final Paper: A detailed report summarizing the findings, with graphs and cross-references, formatted into a PDF using Quarto.


Folders Structure:
bash

├── data
│   ├── raw_data
│   │   └── unedited_data.csv   # Raw data downloaded from Open Data Toronto
│   ├── analysis_data
│   │   └── cleaned_data.csv    # Cleaned dataset used for analysis
├── paper
│   └── paper.qmd               # Quarto file for generating the final report
├── scripts
│   ├── 00-simulate_data.R      # Script to simulate the data structure
│   ├── 01-download_data.R      # Script to download the dataset
│   ├── 02-clean_data.R         # Script to clean the data
├── references.bib              # Bibliography file for references
└── README.md                   # Project overview and details

Instructions for Reproducibility:

Simulate Data: To simulate a similar dataset, run the script scripts/00-simulate_data.R.
Download Data: Use the scripts/01-download_data.R to download the real dataset from Open Data Toronto.
Clean and Analyze: Follow the script scripts/02-clean_data.R to clean the data and run the analysis.
Final Paper: The report will be generated using Quarto by rendering paper/paper.qmd.

Dependencies:
R version 4.2.2
Key Packages:
opendatatoronto
ggplot2
dplyr
sf
knitr
gt

Usage of LLM:
This project was partially assisted by ChattGPT for improving R codes and structuring the report. 

License:
This project is licensed under the MIT License.


