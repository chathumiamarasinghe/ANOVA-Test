data <- read.csv("C:/Users/LENOVO/Downloads/plastic_bottles_data.csv", header = TRUE, sep = ",")
hist(data$Wall_Thickness, 
     main = "Histogram of Wall_Thickness", 
     xlab = "Values", 
     ylab = "Frequency", 
     col = "blue", 
     border = "black")
thickness <-data$Wall_Thickness
mean(thickness)
summary(thickness)
boxplot(thickness)
help("t.test")
t.test(thickness,alternative="two.sided",mu=0.8,conf.level = 0.95)

#H0:molding temperature higher than or equal than the historical standard of 160°C : mu>=160
#H1:molding temperature lower than the historical standard of 160°C : mu<160
temp <- data$Molding_Temperature
help("t.test")
t.test(temp,alternative="less",mu=160,conf.level = 0.95)
hist(temp, 
     main = "Histogram of Wall_Thickness", 
     xlab = "Values", 
     ylab = "Frequency", 
     col = "blue", 
     border = "black")
boxplot(temp)