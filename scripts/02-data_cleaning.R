#### Preamble ####
# Purpose: Cleans the raw dangerous act data by two observations, date and breed
# Author: Yuanchen Miao
# Date: 24 September 2024
# Contact: vicnent.miao@mail.utoronto.ca
# License: none
# Pre-requisites: the raw data downloaded from open data toronto
# Any other information needed? none

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <- raw_data[c("Breed", "Bite_Circumstance", "Date_of_Dangerous_Act")]


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
