library(mice)
#Generating missing value for hypothesises
data <- read.csv(url('https://raw.githubusercontent.com/Bleak-bleak/ams572project/main/data_updated.csv'))

#hypothesis 1
h1dataset <- data[c("price", "horsepower")]
#MCAR
mcar <- ampute(h1dataset,prop = 0.2 ,mech = "MCAR")
h1_amputed <- mcar$amp
h1dataset$price <- h1_amputed$price
h1dataset$horsepower <- h1_amputed$horsepower
write.csv(h1dataset,"h1_mcar.csv",row.names=FALSE)
#MNAR
h1dataset <- data[c("price", "horsepower")]
help(ampute)
mnar <- ampute(h1dataset,prop = 0.2,mech = "MNAR")
h1_amputed2 <- mnar$amp
h1dataset$price <- h1_amputed2$price
h1dataset$horsepower <- h1_amputed2$horsepower
write.csv(h1dataset,"h1_mnar.csv",row.names=FALSE)




#hypothesis 2
h2dataset <- data[c("length", "width", "height", "wheel.base")]
#MCAR
mcar2 <- ampute(h2dataset,prop = 0.2 ,mech = "MCAR")
h2_amputed <- mcar2$amp
h2dataset$length <- h2_amputed$length
h2dataset$width <- h2_amputed$width
h2dataset$height <- h2_amputed$height
h2dataset$wheel.base <- h2_amputed$wheel.base
cate <- data[c("num.of.doors")]
ans <-cbind(cate,h2dataset)
write.csv(ans,"h2_mcar.csv",row.names=FALSE)
#MNAR
h2dataset2 <- data[c("length", "width", "height", "wheel.base")]
mnar2 <- ampute(h2dataset2,prop = 0.2 , freq=c(0.3,0.2,0.2,0.3),mech = "MNAR")
h2_amputed2 <- mnar2$amp
h2dataset2$length <- h2_amputed2$length
h2dataset2$width <- h2_amputed2$width
h2dataset2$height <- h2_amputed2$height
h2dataset2$wheel.base <- h2_amputed$wheel.base
cate <- data[c("num.of.doors")]
ans2 <-cbind(cate,h2dataset2) 
write.csv(ans2,"h2_mnar.csv",row.names=FALSE)
