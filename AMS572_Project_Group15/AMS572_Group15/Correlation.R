df <- read.csv(url("https://raw.githubusercontent.com/Bleak-bleak/ams572project/main/data_updated.csv"), stringsAsFactors = FALSE, header = TRUE, na.strings = "?")
data <- na.omit(df)

#Convert to numeric
data$horsepower <- as.numeric(data$horsepower)
data$price <- as.numeric(data$price)
data$engine.size <- as.numeric(data$engine.size)
data$`city.mpg` <- as.numeric(data$`city.mpg`)
data$`highway.mpg` <- as.numeric(data$`highway.mpg`)

data$fuel_type_binary <- ifelse(data$fuel.type == "diesel", 1, 0)

# Calculate the correlation
correlation_price <- cor(data$horsepower, data$price, use = "complete.obs")
correlation_enginesize <- cor(data$horsepower, data$engine.size, use = "complete.obs")
correlation_citympg <- cor(data$fuel_type_binary, data$`city.mpg`, use = "complete.obs")
correlation_highwaympg <- cor(data$fuel_type_binary, data$`highway.mpg`, use = "complete.obs")

# Create a data frame for the correlation
correlation_df_price <- data.frame(
  Variable1 = "Horsepower",
  Variable2 = "Price",
  Correlation = correlation_price
)

correlation_df_enginesize <- data.frame(
  Variable1 = "Horsepower",
  Variable2 = "Engine Size",
  Correlation = correlation_enginesize
)

correlation_df_citympg <- data.frame(
  Variable1 = "Fuel Type",
  Variable2 = "City MPG",
  Correlation = correlation_citympg
)

correlation_df_highwaympg <- data.frame(
  Variable1 = "Fuel Type",
  Variable2 = "Highway MPG",
  Correlation = correlation_highwaympg
)


print(correlation_df_price)
print(correlation_df_enginesize)
print(correlation_df_citympg)
print(correlation_df_highwaympg)