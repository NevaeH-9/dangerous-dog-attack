#### Preamble ####
# Purpose: Cleans the raw dangerous act data by two observations, date and breed
# Author: Yuanchen Miao
# Date: 24 September 2024
# Contact: vincent.miao@mail.utoronto.ca
# License: none
# Pre-requisites: the raw data downloaded from open data toronto
# Any other information needed? none

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/raw_data.csv")

cleaned_data <- raw_data[c("Breed", "Bite_Circumstance", "Date_of_Dangerous_Act", "Forward_Sortation_Area")]

####Integrate breed of dogs together####
cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("HUSKY", Breed, ignore.case = TRUE) ~ "Husky",
    TRUE ~ Breed  
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("PIT BULL TER", Breed, ignore.case = TRUE) ~ "PIT BULL TER",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("BULLDOG", Breed, ignore.case = TRUE) ~ "BULLDOG",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("CATTLE DOG", Breed, ignore.case = TRUE) ~ "CATTLE DOG",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("BEAGLE", Breed, ignore.case = TRUE) ~ "BEAGLE",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("BELG MALINOIS", Breed, ignore.case = TRUE) ~ "BELG MALINOIS",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("BORDER COLLIE", Breed, ignore.case = TRUE) ~ "BORDER COLLIE",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("BOXER", Breed, ignore.case = TRUE) ~ "BOXER",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("BULLMASTIFF", Breed, ignore.case = TRUE) ~ "BULLMASTIFF",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("CANE CORSO", Breed, ignore.case = TRUE) ~ "CANE CORSO",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("CHOW CHOW", Breed, ignore.case = TRUE) ~ "CHOW CHOW",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("DOBERMAN PINSCH", Breed, ignore.case = TRUE) ~ "DOBERMAN PINSCH",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("SHEPHERD", Breed, ignore.case = TRUE) ~ "SHEPHERD",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("GOLDEN RETR", Breed, ignore.case = TRUE) ~ "GOLDEN RETR",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("GREAT DANE", Breed, ignore.case = TRUE) ~ "GREAT DANE",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("LABRADOR RETR", Breed, ignore.case = TRUE) ~ "LABRADOR RETR",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("MASTIFF", Breed, ignore.case = TRUE) ~ "MASTIFF",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("POODLE STND", Breed, ignore.case = TRUE) ~ "POODLE STND",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("AKITA", Breed, ignore.case = TRUE) ~ "AKITA",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Breed = case_when(
    grepl("POODLE MIN", Breed, ignore.case = TRUE) ~ "POODLE MIN",
    TRUE ~ Breed
  ))

cleaned_data <- cleaned_data %>%
  mutate(Bite_Circumstance = case_when(
    grepl("NAB", Bite_Circumstance, ignore.case = TRUE) ~ "NOT A BITE",
    TRUE ~ Bite_Circumstance
  ))
#### Save data ####
write_csv(cleaned_data, "data/analysis_data/analysis_data.csv")
