###Formula:
#log[p(X) / (1-p(X))]  =  β0 + β1X1 + β2X2 + … + βpXp
#calculate the probability:
#p(X) = exp(β0 + β1X1 + β2X2 + … + βpXp) / (1 + exp(β0 + β1X1 + β2X2 + … + βpXp))
#We then use some probability threshold(0.5) to classify the observation as either 1 or 0.

###Assumptions of Logistic Regression:
#1.The response variable is binary.
#2. The observations are independent.
#3. There is no severe multicollinearity among predictor variables. 
#   none of the predictor variables are highly correlated with each other.
#4. There are no extreme outliers. 
#5. There is a linear relationship between the predictor variables 
#   and the logit of the response variable. 
#   This assumption can be tested using a Box-Tidwell test.
#6. The sample size is sufficiently large. 

#check the assumption:
#2.The easiest way to check this assumption is to create a plot of residuals 
#against time (i.e. the order of the observations) and observe whether or not there is a random pattern.

#3.The most common way to detect multicollinearity is by using the variance inflation factor (VIF)

#4.calculate Cook’s distance for each observation.

#5.This assumption can be tested using a Box-Tidwell test.

###Report results:
#1. calculate the odds ratio for each predictor variable by using the formula exp(β).
#2. calculate the 95% confidence interval for the odds ratio of each predictor variable using the formula exp(β +/- 1.96*std error).

#Result
#Logistic regression was used to analyze the relationship between 
#var1 and var2 on the probability of passing a final exam.

#It was found that, holding all other predictor variables constant constant, 
#the odds of outcome1 increased by exp(β) - 1 (95% CI []) 
#for a one -unit increase in [predictor variable 1].



#The most straightforward way to detect multicollinearity in a regression model 
#is by calculating a metric known as the variance inflation factor, often abbreviated VIF.

#VIF measures the strength of correlation between predictor variables in a model. 
#It takes on a value between 1 and positive infinity.

#We use the following rules of thumb for interpreting VIF values:
  
#VIF = 1: There is no correlation between a given predictor variable and any other predictor variables in the model.
#VIF between 1 and 5: There is moderate correlation between a given predictor variable and other predictor variables in the model.
#VIF > 5: There is severe correlation between a given predictor variable and other predictor variables in the model.


#当p值小于0.05时，说明该变量和logit(P)之间存在非线性关系，
#需要对该变量做进一步的处理（比如取对数或平方等）后，再用多因素logistic回归模型进行建模。

#而当p值大于0.05时，则说明该变量和logit(P)之间为线性关系。
