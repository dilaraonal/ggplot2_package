#BSB632 HW2 Dilara ONAL

milk_data <- read.table("E:/Downloads/milk.csv", #file path information on the computer 
                          header = TRUE,      
                          sep = ","  )
#Removed the rownamnes column from the data 
milk_data <- milk_data[, !(names(milk_data) %in% c("rownames"))]

###A###
install.packages("ggplot2")
library(ggplot2)
#Generated boxplot to show protein measurements for each feeding strategy

#first plot that without data points
ggplot(data = milk_data,
       aes(x = Diet,
           y = protein)) + 
  geom_boxplot() + 
  labs(title = "Protein Measurements According to Feeding Strategy") +
  theme(plot.title = element_text(hjust = 0.5)) #title moved to center position with hjust function

#second plot that with data points
ggplot(data = milk_data,
       aes(x = Diet, 
           y = protein)) + 
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, #Created a point cloud with geom_jitter so that a box plot was created with the data spread
              color = "blue") + 
  labs(title = "Protein Measurements According to Feeding Strategy") +
  theme(plot.title = element_text(hjust = 0.5))

###B###
library(dplyr)
#For each cow included in the data, a different data frame was taken with data from the first week.
first_week <- milk_data %>%
  filter(Time == 1)

ggplot(data = first_week,
       aes(x = Diet,
           y = protein)) + 
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, 
              color = "blue")+
  labs(title = "Protein Measurements According to Feeding Strategy For 1th Weeks") +
  theme(plot.title = element_text(hjust = 0.5))

###C###
#Generated a new data frame with selected cows
cows <- milk_data %>%
  filter(Time <= 18, 
         Cow %in% c("B01" ,"B02", "BL01", "BL02", "L01", "L02"))


ggplot(data = cows) + 
  aes(x = Time, y = protein, color = Cow) + #Each selected cow is labeled with a different color
  geom_line() + # Generated line plots to show protein contents changes for selected cows
  geom_point() + # data points appeared
  labs(title = "Protein Measurements According to Selected Cows") +
  theme(plot.title = element_text(hjust = 0.5))


###D###
ggplot(data = cows) + 
  aes(x = Time, y = protein, color = Cow) +
  geom_line() + 
  geom_point() + facet_wrap(~Cow) + # with facet_wrap function plotted different subplots for each cows
  labs(title = "Protein Measurements Plots According to Selected Cows") +
  theme(plot.title = element_text(hjust = 0.5))

###E###
#data grouped by week and count number of cows and calculated mean of protein measurements
num_cows_mean_protein <- milk_data %>%
  group_by(Time) %>%
  summarise(Number_cows = n_distinct(Cow),
            Protein_mean = mean(protein, na.rm = TRUE)) #with na.rm=TRUE not available data NA data was skipped


ggplot(data = num_cows_mean_protein)+
  aes(x = Time, y = Protein_mean) +
  geom_line() + #generated scatter plot
  geom_point() +
  labs(x = "Weeks", y = "Mean protein", title = "Average Protein Measurements Distribution") +
  theme(plot.title = element_text(hjust = 0.5))


###G###
# data grouped by week and feeding strategy then count number of cows and calculated mean of protein measurements
num_cows_Diet <- milk_data %>%
  group_by(Time,Diet) %>%
  summarise(Number_cows = n_distinct(Cow), # with n_distinct function, count unique cow names.
            Protein_mean = mean(protein, na.rm = TRUE)) 

ggplot(data = num_cows_Diet) + 
  aes(x = Time, y = Protein_mean, color = Diet) +
  geom_line() +
  geom_point() +
  labs(x = "Weeks", y = "Mean protein", title = "Protein Averages by Feeding Strategy") +
  theme(plot.title = element_text(hjust = 0.5))


###H###
install.packages("tidyr")
library(tidyr)
#Changes were made to the tidy data set and it was shown in different columns every week with the pivot_wider function.
wider_form <- pivot_wider(data = milk_data,
                     names_from = "Time",
                     values_from = "protein")
#protein and time data seperated columns
