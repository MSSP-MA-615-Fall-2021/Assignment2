# The visualization function of Xihao's version 
# Visualize the data from wrangling 

# This is a 'inward-facing' file !!!!!!

# Creating function with 3 variables: country1, country2 and value.
plt_diff <- function(country1, country2, value) {
  # The following varibales only for debugging
  # country1 <- 'China'
  # country2 <- 'Japan'
  # value <- 'PC'
  # value <- as.character(value) 
  data1 <- filter(data, country == country1) # using filter to match the country1 data 
  data2 <- filter(data, country == country2) # same with the above function
  data1$Year <- as.numeric(data1$Year) # changing Year from character to numerical 
  data2$Year <- as.numeric(data2$Year)
  data3 <- data.frame(Year = data1$Year, NUI = data2$NUI - data1$NUI, PC = data2$PC - data1$PC)

  
  if (value == "NUI") {
    ggplot(data = data3) + geom_line(mapping = aes(x = Year, y = NUI), size = 0.5, color='red') +
    ggtitle('Difference in Percentage of People Not Using Internet') +
    labs(x = 'Year', y = 'Difference in %')
  } else if (value == 'PC') {
    ggplot(data = data3) + geom_line(mapping = aes(x = Year, y = PC), size = 0.5, color='red') +
    ggtitle('Difference in Personal Computers Per 100 People in A Year') +
    labs(x = 'Year', y = 'Difference')
  } else stop("Warning: Please ensure the value that enter was correct :D .")
}

# Debugging function
plt_data('India', 'China', 'NUI')
plt_data('India', 'China', 'PC')