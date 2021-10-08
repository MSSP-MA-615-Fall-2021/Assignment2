# Data wrangling 

# This is a 'inward-facing' file!!!!!!

library(tidyverse)
library(dplyr)

# Description 1: The proportion of people who did not use internet in the last 3 months from any locations, 
# calculate as the percentage of the total population. 
# Description 2: Personal computers per 100 people in a year
# Data from 1989 to 2005 

nnup1 <- tibble(read_csv("nnup.csv")) # Read the data from local work direction
pc1 <- tibble(read_csv("PC.csv"))

nnup1 <- nnup1[,1:18] # Matching the data, ensure they have same timeline 

nnup2 <- nnup1 %>% pivot_longer(col = -country, names_to = "Year", values_to = "NUI", values_drop_na = T) # Changing data from long data to wide data 

pc2 <- pc1 %>% pivot_longer(col = -country, names_to = "Year", values_to = "PC", values_drop_na = T)

data <- full_join(nnup2, pc2, na.rm = T) # After changing data and drop NA value, join two data.


# Checking the function
data %>% 
  filter(country == 'China')
