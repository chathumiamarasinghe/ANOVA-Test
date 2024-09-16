data <- read.csv("C:/Users/LENOVO/OneDrive/Documents/Desktop/Y2S2/SDM/laptop_price - dataset.csv", header = TRUE, sep = ",")
colnames(data)

# Example dataset
data <- data.frame(
  Group = rep(c("A", "B", "C"), each = 10),
  Value = c(rnorm(10, mean = 5), rnorm(10, mean = 7), rnorm(10, mean = 9))
)

# Install and load required packages
install.packages("ggplot2")
library(ggplot2)

# Check normality with a Q-Q plot
qqnorm(residuals(lm(Value ~ Group, data = data)))
qqline(residuals(lm(Value ~ Group, data = data)))

# Check homogeneity of variances with Levene's test
install.packages("car")
library(car)
leveneTest(Value ~ Group, data = data)

# Perform one-way ANOVA
anova_result <- aov(Value ~ Group, data = data)

# View the ANOVA table
summary(anova_result)

# Perform Tukey's HSD test
tukey_result <- TukeyHSD(anova_result)

# View the results
print(tukey_result)

# Install and load ggplot2
library(ggplot2)

# Create a boxplot
ggplot(data, aes(x = Group, y = Value)) +
  geom_boxplot() +
  labs(title = "Boxplot of Value by Group", x = "Group", y = "Value")


