# Practical Demo

# Add contents into vec1
vec1 <- c('Hockey','Football','Baseball','Curling','Rugby',
          'Hurling','Basketball','Tennis','Cricket','Lacrosse')

vec1

# Add vec 1 and these other values into vec2
vec2 <- c(vec1, 'Hockey', 'Lacrosse','Hockey','Water Polo','Hockey','Lacrosse')

vec2

# Convert Vec 2 to a factor
vec2_factor <- as.factor(vec2)
vec2_factor

# Extract element 1,3,6 from vec2 into vec3
vec3 <- vec2[c(1,3,6)]

vec3
