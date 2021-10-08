# Visualize the data from wrangling 

# This is a 'inward-facing' file !!!!!!

# Creating function with 3 variables: country1, country2 and value.
plt_data <- function(country1, country2, value) {
  # The following varibales only for debugging
  # country1 <- 'China'
  # country2 <- 'Japan'
  # value <- 'PC'
  # value <- as.character(value) 
  data1 <- filter(data, country == country1) # using filter to match the country1 data 
  data2 <- filter(data, country == country2) # same with the above function
  data1$Year <- as.numeric(data1$Year) # changing Year from character to numerical 
  data2$Year <- as.numeric(data2$Year)
  
  
  # Create datasets for logit statements
  # from c1.1 to c2.2 all function is to frame the data in specific detail
  c1.1 <- data.frame(country = data1$country, Year = data1$Year, NUI = data1$NUI) 
  c2.1 <- data.frame(country = data2$country, Year = data2$Year, NUI = data2$NUI)
  c1.2 <- data.frame(country = data1$country, Year = data1$Year, PC = data1$PC)
  c2.2 <- data.frame(country = data2$country, Year = data2$Year, PC = data2$PC)
  
  # Combine two data into one 
  t_data1 <- bind_rows(c1.1,c2.1)
  t_data2 <- bind_rows(c1.2,c2.2)
  
  
  # 'if' sentence to determine the value whether NUI or PC
  if (value == 'NUI'){
    # Plot use geom_line, x-axis is Year, Yaxis is NUI, seperate countris by using col 
    ggplot(data = t_data1, aes(x = Year, y = NUI, col = country)) +
      geom_line(size = 0.5) +
      ggtitle('Percentage of People Not Using Internet') +
      labs(x = 'Year', y = 'Percentage of Not Use Internet')
  } else if (value == 'PC') {
    ggplot(data = t_data2, aes(x = Year, y = PC, col = country)) +
      geom_line(size = 0.5) +
      ggtitle('Personal Computers Per 100 People in A Year')+
      labs(x = 'Year', y = 'PC per 100 people')
  } else stop("Warning: Please ensure the value that enter was correct :D .") # Checking if the value include in the function.
}

# Debugging function
plt_data('India', 'China', 'NUI')
plt_data('India', 'China', 'PC')