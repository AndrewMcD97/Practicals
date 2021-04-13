# -----
# Merging Datasets
# -----
managers_data <- read.csv("managers.csv", na ="")
new_managers_data <- read.csv("MoreData.csv", na = "")

# Show DF Structure
str(new_managers_data)


# Showe Headers From DataFrames
names(managers_data)
names(new_managers_data)

include_list <- new_managers_data[c("Date",
                                    "Country",
                                    "Gender",
                                    "Age",
                                    "Q1","Q2","Q3","Q4","Q5")]

modified_managers <- managers_data[2:11]
modified_managers


# This is how we will combine the dataframes
# But right now it does not work
rbind(managers_data, include_list)

# Create a new "AgeCat" variable in the include_list
# and then calculate containing values
attach(include_list)
include_list$AgeCat[Age >= 45] <- "Elder"
include_list$AgeCat[Age >= 26 & Age <=44] <- "Middle Aged"
include_list$AgeCat[Age <= 45] <- "Young"

# IF NA is found, categorise as Elder
include_list$AgeCat[is.na(Age)] <- "Elder"


# Update date fields on both data frames to correct format
modified_managers$Date <- as.Date(modified_managers$Date, format ="%m/%d/%y")
str(modified_managers)

include_list$Date <- as.Date(include_list$Date, format ="%m/%d/%Y")
str(include_list)

# Combine both dataframes
combined_managers <- rbind(modified_managers, include_list)

# Set AgeCat with ordered factor
combined_managers$AgeCat <- factor(combined_managers$AgeCat, 
                            levels = c("Young", "Middle Aged", "Elder"), ordered = TRUE)