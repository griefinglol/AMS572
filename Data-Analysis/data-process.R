suppressPackageStartupMessages(library(tidyverse))

data <- read_csv('Data/data.csv',show_col_types = FALSE)
Y <- as.numeric(data$`curb-weight`)

model <- lm(Y ~ data$length + data$width)

summary(model)

cor(data$length, data$width)

confint(model, conf.level = 0.95)

abline(model)
par(mfrow = c(2,2))
plot(model)