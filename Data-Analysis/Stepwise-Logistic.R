#Stepwise logistic regression is a technique for building a logistic model that iteratively selects 
#or deselects predictors based on their statistical significance.

#The three main methods are:
  
#Forward selection: 
#This method starts with an intercept-only model and adds variables one at a time based on their significance and contribution to the model fit. The procedure stops when no more variables can be added or when the AIC increases.
#Backward elimination: 
#This method starts with a complete model with all variables and removes variables one at a time based on their significance and contribution to the model fit. The procedure stops when no more variables can be removed, or the AIC increases.
#Both-direction selection: 
#This method combines forward and backward selection by adding and removing variables at each step based on their significance and contribution to the model fit. The procedure stops when no more variables can be added or removed, or the AIC increases.

#stepAIC Function to perform
#Base model that defines the initial set of variables in the procedure
#Scope model that defines the range of variables that can be added or removed from the base model.

library(mlbench)
data("PimaIndiansDiabetes2", package = "mlbench")
PimaIndiansDiabetes2 <- na.omit(PimaIndiansDiabetes2)
str(PimaIndiansDiabetes2)# Inspect the data

#split data
library(caret)
library(dplyr)
set.seed(123)
training.samples <- PimaIndiansDiabetes2$diabetes %>%
  createDataPartition(p = 0.8, list = FALSE)
train.data <- PimaIndiansDiabetes2[training.samples, ]
test.data <- PimaIndiansDiabetes2[-training.samples, ]
dim(train.data)
dim(test.data)

#define Base and Scope models
#For the base model, you can use either an intercept-only model or a model with 
#one or more essential or relevant predictors for the outcome.
#For the scope model, you can use either a complete model with all predictors 
#or a model with a subset of predictors that you want to consider for the procedure.

# Define the base model (intercept-only)
base.model <- glm(diabetes ~ 1, data = train.data, family = binomial)
# Define the scope model (full model)
scope.model <- glm(diabetes ~ ., data = train.data, family = binomial)

#Perform stepwise logistic regression
library(MASS)

# Perform model selection
forward.model <- stepAIC(base.model, 
                         direction = "forward", scope = scope.model, trace = FALSE)
backward.model <- stepAIC(scope.model, 
                          direction = "backward", scope = scope.model, trace = FALSE)
step.model <- stepAIC(base.model, direction = "both", 
                      scope = scope.model, trace = FALSE)

# Compare the forward model and both-direction model
anova(forward.model, step.model, test = "Chisq")


