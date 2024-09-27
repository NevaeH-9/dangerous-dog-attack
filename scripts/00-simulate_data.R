#### Preamble ####
# Purpose: Simulates data
# Author: Yuanchen Miao
# Date: 24 September 2024
# Contact: vincent.miao@mail.utoronto.ca
# License: none
# Pre-requisites: none
# Any other information needed? none


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
set.seed(782)

# Simulating number of dangerous act happens per day
#Define the start and end date
start_date <- as.Date("2017-01-01")
end_date <- as.Date("2023-12-31")

# set the number of random date I want to generate
number_of_dates <- 100

data <-
  tibble(
    dates = as.Date(
      runif(
        n = number_of_dates,
        min = as.numeric(start_date),
        max = as.numeric(end_date)
      ),
      origin = "1970-01-01"
    ),
    number_of_act = rpois(n = number_of_dates, lambda = 10)
  )

# Write_csv
write_csv(data, file = "data/raw_data/simulated_date.csv")

# Simulates the total number of dangerous act of a breed
dog_breeds <- c("Breed A", "Breed B", "Breed C")
num_days <- 100 

# Create an empty data frame to store results
results <- data.frame(Day = rep(1:num_days, times = length(dog_breeds)),
                      Breed = rep(dog_breeds, each = num_days),
                      DangerousActs = integer(num_days * length(dog_breeds)))

# Simulate the number of dangerous acts for each breed
for (i in 1:length(dog_breeds)) {
  results$DangerousActs[results$Breed == dog_breeds[i]] <- rpois(num_days, 10)
}
# Calculate total number of dangerous acts for each breed
total <- results %>%
  group_by(Breed) %>%
  summarise(TotalActs = sum(DangerousActs))

write_csv(total, file = "data/raw_data/simulate_breed.csv")

# Simulates the area happens dog attack

area <- c("M4Y", "M5E", "M6V")
num_acts <- 100

# Create an empty data frame to store results
results1 <- data.frame(Act = rep(1:num_acts, times = length(area)),
                       Area = rep(area, each = num_acts),
                       DangerousActs1 = integer(num_acts * length(area)))

# Simulate the number of dangerous acts for each area
for (i in 1:length(area)) {
  results1$DangerousActs1[results1$Area == area[i]] <- rpois(num_acts, 10)
}
# Calculate total number of dangerous acts for each area
data1 <- results1 %>%
  group_by(Area) %>%
  summarise(TotalActs = sum(DangerousActs1))

#Write csv
write_csv(data1, file = "data/raw_data/simulated_area.csv")