data <- read.csv("C:/Users/LENOVO/OneDrive/Documents/Desktop/Y2S2/SDM/ProductionSpeed.csv", header = TRUE, sep = ",")

M_X <- data$machine_X
M_Y <- data$machine_Y
M_Z <- data$machine_Z

shapiro.test(M_X)
shapiro.test(M_Y)
shapiro.test(M_Z)

install.packages("car")
library(car)
help("leveneTest")

production_speed <- c(M_X, M_Y, M_Z)
machine <- rep(c("X", "Y", "Z"), each = 40)

data <- data.frame(production_speed, machine)

leveneTest(production_speed ~ machine, data)

help("aov")

res.aov <- aov(production_speed ~ machine, data = data)
summary(res.aov)

help(TukeyHSD)

tukey.test <- TukeyHSD(res.aov)
tukey.test

plot(TukeyHSD(res.aov, conf.level=.95), las = 2)
