# Read in the Brexit file
brexit_data <- read.csv("data_brexit_referendum.csv", na ="")

# Examine data type and structure of DF
str(brexit_data)
head(brexit_data)

# Count num of values with -1 in the Leave column
nrow(brexit_data[brexit_data$Leave == -1,])

# Change -1 to NA
brexit_data$Leave[brexit_data$Leave == -1] <- NA

#View num of records with NA
na_records <- brexit_data[!complete.cases(brexit_data),]



# Number of rows with NA records
nrow(na_records)

# MICE
library(mice)
md.pattern(brexit_data)

# VIM 
library(VIM)
missing_values <- aggr(brexit_data , prop = FALSE, numbers = TRUE)
summary(missing_values)

#q5
brexit_data$Proportion = brexit_data$Leave/brexit_data$NVotes *100


# if prop > 50 = leave < 50 = remain
brexit_data$Vote[brexit_data$Proportion <= 50] <- "Remain"
brexit_data$Vote[brexit_data$Proportion > 50] <- "Leave"



str(brexit_data)
# var is a character so need to convert first
brexit_data$RegionName[brexit_data$RegionName == "London"] <- 'L'
brexit_data$RegionName[brexit_data$RegionName == "North West"] <- 'NW'
brexit_data$RegionName[brexit_data$RegionName == "North East"] <- 'NE'
brexit_data$RegionName[brexit_data$RegionName == "South West"] <- 'SW'
brexit_data$RegionName[brexit_data$RegionName == "South East"] <- 'SE'
brexit_data$RegionName[brexit_data$RegionName == "East Midlands"] <- 'EM'
brexit_data$RegionName[brexit_data$RegionName == "West Midlands"] <- 'WM'
brexit_data$RegionName[brexit_data$RegionName == "East of England"] <- 'EE'
brexit_data$RegionName[brexit_data$RegionName == "Yorkshire and The Humber"] <- 'Y'

# Use sapply90 to examine the structure of each vairabel
numerical_variable_list <- sapply(brexit_data, is.numeric)
class(numerical_variable_list)
numerical_variable_list

# we can use this logic to create a subset of the data
numerical_Data <- brexit_data[numerical_variable_list]
numerical_Data

#remove id field as it is no use. we can assign False to it
numerical_variable_list['ID'] <- FALSE

# we can use apply() to return a list where each list member is a variable
lapply(numerical_Data, summary)