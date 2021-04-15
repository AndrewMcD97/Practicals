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

# Show content of missing values
summary(missing_values)

# Dealing with missing data
# Decided to only keep data with
# Missing type and health status
# and the addresses are not important
keep_this_data <- diabetes_data[!complete.cases(diabetes_data$Daibetes.type, diabetes_data$Status),]
keep_this_data

dim(keep_this_data)

# 15 rows with missing data that i'd like to keep
# Reverse the logic to contain relevant data
keep_this_data <- diabetes_data[complete.cases(diabetes_data$Daibetes.type, diabetes_data$Status),]
keep_this_data
dim(keep_this_data)
dim(diabetes_data)

# Replace the original dataframe with the content of the processed data
diabetes_data <- keep_this_data
head(diabetes_data, 15)

# 4 - config type to an unordered factor with two levels
diabetes_data$Type <- factor(diabetes_data$Type, order = FALSE, levels = c("Type 1", "Type 2"))

# Refactor status too
diabetes_data$Status <- factor(diabetes_data$Status, order = TRUE, levels = c("Poor","Improved","Excellent"))

# 5 - define new col names
col_names <- c("Patient Name", "NI address", "Type", "Age", "Health Status")
colnames(diabetes_data) <- col_names

str(diabetes_data)

# lets look at the class of each element inside dataframe
class_list <- lapply(diabetes_data, class)
class_list

class_list <- sapply(diabetes_data, class)
class_list

# Build the data frame first 
dose <- c(20,30,40,45,60)
drug_a <- c(16,20,27,40,60)
drug_b <- c(15,18,25,31,40)
  
# Create a new dataframe
drugs <- data.frame(dose,drug_a,drug_b)
drugs

plot(drugs)

attach(drugs)
plot(dose, type ="o", col="blue")

plot(dose, drug_a, type = "b")

# par = parameters
opar <- par(no.readonly = TRUE)


# lty = line type
# lwd = line width
# lty = two dashed line
# pch = 17 solid triangle triangle

par = opar

plot(dose, drug_a, type ="b", lty = 2, pch = 17)

graph_range <- range(0, drug_a, drug_b)
graph_range
plot(drug_a, type = "o", col="blue", ylim = graph_range, axes=FALSE, ann=FALSE)

# make the a axis label
axis(1, at = 1:5, labels = c("20ml","40ml","60ml","60ml","100ml"))