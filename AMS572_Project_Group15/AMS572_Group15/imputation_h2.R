library(mice)

#hypothesis2

#MCAR
data <- read.csv("https://raw.githubusercontent.com/Bleak-bleak/ams572project/main/h2_mcar.csv")
impute <- mice(data, m=3,seed=100)
temp <- complete(impute)
mcarimp <- temp
write.csv(mcarimp,"h2_mcar_imputed.csv",row.names=FALSE)

#MNAR
data1 <- read.csv("https://raw.githubusercontent.com/Bleak-bleak/ams572project/main/h2_mnar.csv")
impute1 <- mice(data1, m=3,seed=100)
temp1 <- complete(impute1)
mnarimp <- temp1
write.csv(mnarimp,"h2_mnar_imputed.csv",row.names=FALSE)
