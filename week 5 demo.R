# Read in the diabetes files. DIABETES Not Diabetes-md.csv
diabetes_data <- read.csv("diabetes.csv", na="")

# Show incomplete rows
diabetes_data[!complete.cases(diabetes_data),]


# Pasting into a correct format and then converting from character to Date
diabetes_data$Date <- paste(diabetes_data$Month, diabetes_data$Year, "01", sep='/')
diabetes_data$Date <- as.Date(diabetes_data$Date, format ="%m/%Y/%d")

#Check if its not changed to a date in the structure
str(diabetes_data)

# Change status to a factor in order to plot it
diabetes_data$Status <- as.factor(diabetes_data$Status)

# Plot Status
plot(diabetes_data$Status)
summary(diabetes_data$Status)

# Add titles to cvhart that are relavent
attach(diabetes_data)
display_settings <- par(no.readonly = TRUE)
plot(Status, main="Number Of Patients And Their Diabetes Condition"
     , ylab="Number Of Patients", xlab="Patients Current Condition")

# save modified dataframe
write.csv("Diabetes-data.csv")