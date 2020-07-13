# Load library ggplot
library(tidyverse)

# Read file for challenge MechaCar_mpg
MechaCar_mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names = F,stringsAsFactors = F)

# Multiple linear regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg_table)

# Generate statistical metrics
summary(lm(mpg ~ vehicle_weight + vehicle_length + spoiler_angle + ground_clearance + AWD, data=MechaCar_mpg_table))

# Read file suspension coil test
suspension_coil_table <- read.csv(file='Suspension_Coil.csv',check.names = F, stringsAsFactors = F)

# Download Pastecs package to use stat.desc() funtion to get summary statistics
install.packages ("pastecs")
library (pastecs)
# Summary Statistics Table whole database
summary_stat_suspension_wholeDB <- stat.desc(suspension_coil_table)
# Statistics by LOT
summary_stat_suspension <- suspension_coil_table %>% group_by(Manufacturing_Lot) %>% 
summarise(mean_PSI=mean(PSI), median_PSI=median(PSI),SD_PSI=sd(PSI), max_PSI=max(PSI),
min_PSI=min(PSI), var_PSI=var(PSI), n=n(),)
# Round summary_stat_suspension table
summary_stat_suspension[,-1] <- round(summary_stat_suspension[,-1],3)
print(summary_stat_suspension)

library(dplyr)
# Turn off scientific notation
options(scipen = 999)
# Selecting only PSI column
Suspension_Statistics_Summ_Table <- round(summary_stat_suspension_wholeDB %>% select(PSI),3)

# Plot dataset suspension_coil_table
plt <- ggplot(suspension_coil_table,aes(x=log10(PSI))) #import dataset into ggplot2
plt + geom_density()

# Suspension Coil T-Test
# Create a sample dataset
sample_table <- suspension_coil_table %>% sample_n(50)
plt <- ggplot(sample_table,aes(x=log10(PSI))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

# One sample T-Test.
t.test(log10(sample_table$PSI),mu=mean(log10(suspension_coil_table$PSI))) #compare sample versus suspension_coil_table means

# Two sample T-Test
sample_table2 <- suspension_coil_table %>% sample_n(50)
plt <- ggplot(sample_table2,aes(x=log10(PSI))) #import dataset into ggplot2
plt + geom_density() #visualize distribution using density plot

t.test(log10(sample_table$PSI),log10(sample_table2$PSI)) #compare means of two samples

# Paired T-Test
# Creating tables by Manufacturing_Lot
suspension_coil_Lot1 <- suspension_coil_table %>% filter(Manufacturing_Lot=='Lot1') #select only pressure points where the Manufacturing lot is from Lot1
suspension_coil_Lot2 <- suspension_coil_table %>% filter(Manufacturing_Lot=='Lot2') #select only pressure points where the Manufacturing lot is from Lot2
suspension_coil_Lot3 <- suspension_coil_table %>% filter(Manufacturing_Lot=='Lot3') #select only pressure points where the Manufacturing lot is from Lot3

# Plot dataset suspension_coil_table
plt <- ggplot(suspension_coil_Lot3,aes(x=log10(PSI))) #import dataset into ggplot2
plt + geom_density()

t.test(suspension_coil_Lot1$PSI,suspension_coil_Lot2$PSI,paired = T) #compare the mean difference between two lots
t.test(suspension_coil_Lot1$PSI,suspension_coil_Lot3$PSI,paired = T) #compare the mean difference between two lots
t.test(suspension_coil_Lot2$PSI,suspension_coil_Lot3$PSI,paired = T) #compare the mean difference between two lots
