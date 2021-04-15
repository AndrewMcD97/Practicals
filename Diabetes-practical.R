# Read in the diabetes files
diabetes_data <- read.csv("Diabetes-md.csv", na ="")

# What type is the data
str(diabetes_data)
class(diabetes_data)
dim(diabetes_data)

# Examine Missing Data
print(is.na(diabetes_data))

diabetes_data[!complete.cases(diabetes_data),]

# Install the mice package
install.packages("mice")
library(mice)
md.pattern(diabetes_data)

library(VIM)
missing_values <- aggr(diabetes_data, prop = FALSE, numbers = TRUE)

summary(missing_values)