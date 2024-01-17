# Load the necessary library
library(corrplot)
library(ggplot2)
library(gplots)
# Load the dataset
car_data <- read.csv(url('https://raw.githubusercontent.com/Bleak-bleak/ams572project/main/data_updated.csv'))
car_data <- na.omit(car_data[,c('horsepower', 'price')])

str(car_data)

# Extract 'horsepower' and 'price' columns
horsepower <- car_data$horsepower
price <- car_data$price

# Perform Pearson correlation test
cor_test_result <- cor.test(horsepower, price, use = "pairwise.complete.obs")

# Calculate the confidence interval
conf_interval <- cor_test_result$conf.int

# Display the results
cat("Pearson Correlation Coefficient:", cor_test_result$estimate, "\n")
cat("Confidence Interval:", conf_interval[1], "to", conf_interval[2], "\n")
cat("P-value:", cor_test_result$p.value, "\n")

# Check the significance level
alpha <- 0.05
if (cor_test_result$p.value < alpha) {
  cat("The correlation is statistically significant.\n")
} else {
  cat("The correlation is not statistically significant.\n")
}

# Create a scatter plot
ggplot(car_data, aes(x = horsepower, y = price)) +
  geom_point() +
  labs(title = 'Scatter Plot of Horsepower vs. Price',
       x = 'Horsepower',
       y = 'Price')


# Create a correlation matrix
correlation_matrix <- cor(car_data)

heatmap.2(correlation_matrix, 
          col = colorRampPalette(c("navy", "white", "firebrick3"))(100),
          main = "Correlation Heatmap",
          key = TRUE, keysize = 1.2, cexRow = 1.5, cexCol = 1.5,
          density.info = "none", trace = "none",
          margins = c(8, 8),
          cellnote = correlation_matrix,
          notecol="white", notecex = 0.7, symkey = FALSE)
