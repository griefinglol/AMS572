df1 <- data.frame(team=rep(c('0mg', '100mg', '200mg'), each=10),
                 points=c(242, 245, 244, 248, 247, 248, 242, 244, 246, 242,
                          248, 246, 245, 247, 248, 250, 247, 246, 243, 244,
                          246, 248, 250, 252, 248, 250, 246, 248, 245, 250))

boxplot(df1$points ~ df1$team,
        col='steelblue',
        main='Q12.2a',
        xlab='Caffeine Dose',
        ylab='Finger Taps per Minute') 

model1 <- lm(df1$points ~ df1$team)
res <- resid(model1)
plot(df1$points, res, main='Q12.2c',ylab='residuals', xlab='Finger Taps per Minute')
abline(0,0)

HBSS <- rep('HBSS', times = 16)
HBS<- rep('HBS/', times = 10)
HBSC <- rep('HBSC', 15)
df2 <- data.frame(team=c(HBSS, HBS, HBSC),
                  points=c(7.2, 7.7, 8.0, 8.1, 8.3, 8.4, 8.4, 8.5, 8.6, 8.7, 9.1, 9.1, 9.1, 9.8, 10.1, 10.3, 
                           8.1,9.2,10.0, 10.4, 10.6, 10.9, 11.1, 11.9, 12.0, 12.1,
                           10.7, 11.3, 11.5, 11.6, 11.7, 11.8, 12.0, 12.1, 12.3, 12.6, 12.6, 13.3, 13.3, 13.8, 13.9))

boxplot(df2$points ~ df2$team,
        col='steelblue',
        main='12.5a',
        xlab='types of sickle cell disease:',
        ylab='hemoglobin levels') 

model2 <- lm(df2$points ~ df2$team)
res2 <- resid(model2)
plot(df2$points, res2, ylab='residuals', main='12.5c',xlab='hemoglobin levels')
abline(0,0)





