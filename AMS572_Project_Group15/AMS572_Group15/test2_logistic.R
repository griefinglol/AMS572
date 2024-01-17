###load library
library(MASS)
library(car)


#create file to save results
folder_reuslts <- 'results'
if (!file.exists(folder_reuslts)) {
  dir.create(folder_reuslts)
}

###load and process data
data <- read.csv(url("https://raw.githubusercontent.com/Bleak-bleak/ams572project/main/data_updated.csv"),header = TRUE)
data <- na.omit(data)
data$Y <- ifelse(data$num.of.doors =="two", 1, 0)

#load output
sink("results/logistic_output.txt")

#make this example reproducible
set.seed(1)

###split train and test data
sample <- sample(c(TRUE, FALSE), nrow(data), replace=TRUE, prob=c(0.7,0.3))
train <- data[sample, ]
test <- data[!sample, ]

##fit logistic regression model
factor <- Y ~ length + width + height + wheel.base
base.model <- glm(factor, train, family="binomial")
print("summary base model")
summary(base.model)

#calculate p-value of overall Chi-Square statistic
p_value_base <- 1-pchisq(base.model$null.deviance-base.model$deviance , base.model$df.null-base.model$df.residual)


#perform backward stepwise regression
both.model <- step(base.model, direction='both', trace=0)
#view model summary
print("summary both model")
summary(both.model)

#rechose parameter based on stepwise regression
factor_new <- Y ~ width + height + wheel.base
stepACI.model <- glm(factor_new, train,  family="binomial")
#view model summary
print("summary stepACI model")
summary(stepACI.model)

#compare two model using anova 
print("anova between two model")
print(anova(base.model,stepACI.model))

#Logistic regression diagnostics
#create residual plots to check wheter the observations are independent.
#get list of residuals 
res <- resid(stepACI.model)
#produce residual vs. fitted plot
jpeg("results/logistic_residual.jpg", width = 350, height = 350)
plot(fitted(stepACI.model), res)
#add a horizontal line at 0 
abline(0,0)
dev.off()

#find Cook's distance for each observation in the dataset
cooksD <- cooks.distance(stepACI.model)
# Plot Cook's Distance with a horizontal line at 4/n to see which observations
#exceed this thresdhold
jpeg("results/logistic_cook.jpg", width = 350, height = 350)
plot(cooksD, main = "Cooks Distance for Influential Obs")
abline(h = 4/nrow(train), lty = 2, col = "steelblue") # add cutoff line
dev.off()

#test collinearity assumption
print("test collinearity assumption")
print(vif(stepACI.model))

#get predictions from train data and corresponding logit(P)
train$pred_training <- 1/(1+exp(-predict(stepACI.model,train)))
train$logitP<-logit(train$pred_training)
#boxTidwell test
print("boxTidwell test")
boxTidwell(formula=factor_new, data=train)

#calculate p-value of overall Chi-Square statistic
p_value_ACI <- 1-pchisq(stepACI.model$null.deviance-stepACI.model$deviance , stepACI.model$df.null-stepACI.model$df.residual)
print("p value")
print(p_value_ACI)
print(ifelse(p_value_ACI < 0.05, "reject H0", "not enough evidence to reject H0"))

#test data accuracy
predictions <- predict(stepACI.model,test)
test$pre <- ifelse(predictions>=0.5,1,0)

#compare prediction and Y
test$results <- ifelse(test$Y == test$pre, 1, 0)
accuracy <- sum(test$results)/nrow(test)
print("accuracy on test data")
print(accuracy)

sink()


