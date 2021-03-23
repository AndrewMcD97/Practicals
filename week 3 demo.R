# File dwnlaoded from blackboard and inserted into dataframe
# Missing content replaced with NA
managers_data <- read.csv("managers.csv", na = "")

# View structure of df
str(managers_data)


# Convert date variable to Date datatype
converted_date <- as.Date(managers_data$Date, '%m/%d/%y')
converted_date


managers_data$Date <- converted_date
str(managers_data)

# Convert age varibale to Int
converted_age <- as.integer(managers_data$Age)
managers_data$Age <- converted_age
str(managers_data)


start_date <- as.Date('2018-10-15')


#drop attributes from data
# show where specific var names are
include_list <- names(managers_data) %in% c("Q3", "Q4")
include_list

#This dataframe only contains Q3 and Q4
new_managers <- managers_data[(include_list)]
new_managers


#Uisng the subset function
# To extract all records where age > 35 or age <24
#Only select Q1-Q4

attach(managers_data)
new_data <- subset(managers_data, Age > 35 | Age < 24, 
                   select =  c(Q1,Q2,Q3,Q4))
new_data


# subset of managers data
# Gender = M and age > 25, only show records from gender to q4 inclusive
new_subset <- subset(managers_data, Age > 25 & Gender == 'M', 
                   select =  c(Gender, Age,Q1,Q2,Q3,Q4))
new_subset

#Random sampling
#Sample 3 records from the managers data frame
my_sample <- managers_data[sample(1:nrow(managers_data),3,replace=FALSE),]
my_sample


#Random sampling
#can we Sample 10 records from the managers data frame?
my_sample2 <- managers_data[sample(1:nrow(managers_data),10,replace=TRUE),]
my_sample2


#Sorting data by age
attach(managers_data)
new_data <- managers_data[order(Age),]
new_data


#Sort by gender and then age within each gender
# and store in df called sorted_data
attach(managers_data)
new_data2 <- managers_data[order(Gender,Age),]
new_data2

#save the sample file to a csv file
write.csv(my_sample, file="random sample.csv")

