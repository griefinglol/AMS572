library(mice)

#hypothesis1

#MCAR
data <- read.csv(url("https://raw.githubusercontent.com/Bleak-bleak/ams572project/main/h1_mcar.csv"))
mcar_clean <- na.omit(data)
plot(price~horsepower, data=mcar_clean,
     main="price vs. horsepower mcar before", xlab="price",ylab = "horsepower")
abline(lm(price~horsepower, data = mcar_clean), col="red")


#imputation using recommend package function
#default method:predictive mean matching(no extrme value)
impute1 <- mice(data, m=3,seed=100)
temp2 <- complete(impute1)
mcarimp <- temp2

#check the validity of new dataset
plot(price~horsepower, data=mcarimp,
     main="price vs. horsepower mcar after", xlab="price",ylab = "horsepower")
abline(lm(price~horsepower, data = mcarimp), col="red")

write.csv(mcarimp,"h1_mcar_imputed.csv",row.names=FALSE)


#MNAR
data1 <- read.csv("https://raw.githubusercontent.com/Bleak-bleak/ams572project/main/h1_mnar.csv")
mnar_clean <- na.omit(data1)
plot(price~horsepower, data=mnar_clean,
     main="price vs. horsepower mnar before", xlab="price",ylab = "horsepower")
abline(lm(price~horsepower, data = mnar_clean), col="red")


#imputation using recommend package function
#default method:predictive mean matching(no extrme value)
impute1 <- mice(data1, m=5,seed=100)
temp2 <- complete(impute1)
mnarimp <- temp2

plot(price~horsepower, data=mnarimp,
     main="price vs. horsepower mnar after", xlab="price",ylab = "horsepower")
abline(lm(price~horsepower, data = mnarimp), col="red")

write.csv(mnarimp,"h1_mnar_imputed.csv",row.names=FALSE)
