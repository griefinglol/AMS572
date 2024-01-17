library(ggplot2)
df <- read.csv("C:/Users/royan/Downloads/AMS 572/data.csv", stringsAsFactors = FALSE, header = TRUE, na.strings = "?")
data <- na.omit(df)

# Convert horsepower and price columns to numeric
data$horsepower <- as.numeric(data$horsepower)
data$price <- as.numeric(data$price)
data$engine.size <- as.numeric(data$engine.size)
data$city.mpg <- as.numeric(data$city.mpg)
data$highway.mpg <- as.numeric(data$highway.mpg)


# Categorizing horsepower into 'Low' and 'High'
data$horsepower <- ifelse(data$horsepower >= 0 & data$horsepower <= 150, "Low", 
                          ifelse(data$horsepower >= 151 & data$horsepower <= 300, "High", NA))

# Creating a boxplot
ggplot(data, aes(x = horsepower, y = price)) +
  geom_boxplot() +
  labs(title = "Price vs Horsepower", x = "Horsepower", y = "Price")

ggplot(data, aes(x = horsepower, y = engine.size)) +
  geom_boxplot() +
  labs(title = "Engine Size vs Horsepower Category", x = "Horsepower Category", y = "Engine Size")

ggplot(data, aes(x = fuel.type, y = `city.mpg`)) +
  geom_boxplot() +
  labs(title = "City MPG vs Fuel Type", x = "Fuel Type", y = "City MPG")

ggplot(data, aes(x = fuel.type, y = `highway.mpg`)) +
  geom_boxplot() +
  labs(title = "Highway MPG vs Fuel Type", x = "Fuel Type", y = "Highway MPG")
