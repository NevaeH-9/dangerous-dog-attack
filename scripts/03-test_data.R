#### Preamble ####
# Purpose: Sanity check of the data
# Author: Yuanchen Miao
# Date: 24 September 2024
# Contact: vicnent.miao@mail.utoronto.ca
# License: none
# Pre-requisites: need to have the analyzed data
# Any other information needed? none


#### Workspace setup ####
library(tidyverse)


#### Test data ####
data <- read_csv("data/analysis_data/analysis_data.csv")

# Test for NAs
all(is.na(data$Breed))
all(is.na(data$Bite_Circumstance))
all(is.na(data$Date_of_Dangerous_Act))