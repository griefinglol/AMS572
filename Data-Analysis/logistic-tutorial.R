#load dataset
data <- ISLR::Default


#view summary of dataset
summary(data)


#make this example reproducible
set.seed(1)

#Use 70% of dataset as training set and remaining 30% as testing set
sample <- sample(c(TRUE, FALSE), nrow(data), replace=TRUE, prob=c(0.7,0.3))
train <- data[sample, ]
test <- data[!sample, ]  

##fit logistic regression model
model <- glm(default~student+balance+income, family="binomial", data=train)

#disable scientific notation for model summary
options(scipen=999)

#view model summary
summary(model)
#We can see that balance and student status seem to be important predictors since 
#they have low p-values while income is not nearly as important.

#Assessing Model Fit:
#In typical linear regression, we use R2 as a way to assess how well a model fits the data.
#Instead, we can compute a metric known as McFadden’s R2, which ranges from 0 to just under 1. 
#Values close to 0 indicate that the model has no predictive power. 
#In practice, values over 0.40 indicate that a model fits the data very well.
pscl::pR2(model)["McFadden"]
#Variable Importance:
caret::varImp(model)
#Higher values indicate more importance. These results match up nicely with the p-values from the model. 

#We can also calculate the VIF values of each variable in the model to see if multicollinearity is a problem:
car::vif(model)
#As a rule of thumb, VIF values above 5 indicate severe multicollinearity. 

#Step 4: Use the Model to Make Predictions
#define two individuals
new <- data.frame(balance = 1400, income = 2000, student = c("Yes", "No"))
predict(model, new, type="response")
#calculate probability of default for each individual in test dataset
predicted <- predict(model, test, type="response")

#Step 5: Model Diagnostics
#convert defaults from "Yes" and "No" to 1's and 0's
test$default <- ifelse(test$default=="Yes", 1, 0)
#find optimal cutoff probability to use to maximize accuracy
optimal <- informationValue::optimalCutoff(test$default, predicted)[1]

#plot the ROC curve
library(ggplot2)
library(pROC)
rocobj <- roc(test$default, predicted)
auc <- round(auc(test$default, predicted),4)
ggroc(rocobj, colour = 'steelblue', size = 2) +
  ggtitle(paste0('ROC Curve ', '(AUC = ', auc, ')')) +
  theme_minimal()


