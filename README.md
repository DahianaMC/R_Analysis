# R_Analysis
Statistical analysis of two datasets:
- A mpg testing dataset of 50 potential prototype MechaCars. The MechaCar prototypes were produced using multiple design specifications to identify ideal vehicle performance. Multiple metrics such as vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance were collected for each vehicle.
- MechaCar suspension coil test results from multiple production lots. In this dataset, the weight capacity of multiple suspension coils were tested to determine if the manufacturing process is consistent across lots.
- The analysis of the dataset is included on the file MechaCarWriteUp.txt and the R code is in the file MechaCarChallenge.

# Analysis
# Module 15 Challenge

# MPG Regression
- We used the dataset MechaCar_mpg.csv. for this exercise. 

## Results
### Multiple Linear Regression
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = MechaCar_mpg_table)

Coefficients:
     (Intercept)    vehicle_length    vehicle_weight  
     -103.963979          6.267128          0.001245  
   spoiler_angle  ground_clearance               AWD  
        0.068766          3.545534         -3.411499 

### Statistical metrics
lm(formula = mpg ~ vehicle_weight + vehicle_length + spoiler_angle + 
    ground_clearance + AWD, data = MechaCar_mpg_table)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                    Estimate  Std. Error t value        Pr(>|t|)    
(Intercept)      -103.963979   15.850376  -6.559 0.0000000507794 ***
vehicle_weight      0.001245    0.000689   1.807          0.0776 .  
vehicle_length      6.267128    0.655348   9.563 0.0000000000026 ***
spoiler_angle       0.068766    0.066526   1.034          0.3069    
ground_clearance    3.545534    0.541191   6.551 0.0000000521269 ***
AWD                -3.411499    2.534697  -1.346          0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 0.0000000000535


## Analysis of the results
- Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset? According to the results, vehicle_length and ground_clearance (as well as intercept), are providing a non-random amount of variance to the mpg values in the dataset.  The vehicle_length and ground_clearance have a significant impact on the mpg.  Since the intercept is statistically significant, there are other variables and factors that contribute to the variation in mpg that have not been included in the model.

- Is the slope of the linear model considered to be zero? Why or why not? The summary of the results show the p-value is much smaller than the assumed significance level of 0.05%, therefore we can state  that there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero. 

- Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not? Looking the summary output the Multiple R-Square is 0.71 and the p-value remain significant, meaning 71% of all mpg data will be correct when using this model and also the p-values is much smaller than the assumed significance level of 0.05%, but the lack of significant variables is evidence of the performance of a model performs well with a current dataset, but fails to generalize and predict future data correctly.
We recommend to do the linear regression to each variable and also the multiple linear regression to get more information.



# Exercise: Suspension Coil Summary Statistics
- We used the dataset Suspension_Coil for this exercise.

## Statistics Summary Table dataset suspension_coil_table (n=150)

PSI
nbr.val     150.000
nbr.null      0.000
nbr.na        0.000
min        1452.000
max        1542.000
range        90.000
sum      224817.000
median     1500.000
mean       1498.780
SE.mean       0.644
CI.mean       1.273
var          62.294
std.dev       7.893
coef.var      0.005

### Interpretation and findings for the suspension coil summary statistics.
- We used stat.desc() function from Pastecs library to calculate the summary statistics from the dataset with 150 points.
- We calculated the summary statistics for the suspension coil data, using the 150 points, the median and mean are slightly different, median is 1500 and mean is 1498.78, the dataset has a distribution that is slightly skewed left.  
- The range is 90 (difference between the lowest and highest values in the dataset), this will help us to understand how spread is our dataset, and more important to compare the datasets created from the Manufacturing lots.
- The variance of our dataset is 62.3, the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per inch, if we used the variance for the 150 points the data meets the design specification because is below 100 pounds per inch.


## Statistics Summary by Manufacturing Lot

  Manufacturing_Lot mean_PSI median_PSI SD_PSI max_PSI min_PSI var_PSI     n
1 Lot1                 1500       1500    0.99    1502    1498    0.98    50
2 Lot2                 1500.      1500    2.73    1506    1494    7.47    50
3 Lot3                 1496.      1498.  13.0     1542    1452  170.      50

### Interpretation and findings for the suspension coil summary statistics using the datasets by lots.
- We use the groupby() function to create the datasets by lots for Lot1, Lot2 and Lot3 and using summarise() function we computed: mean, median, sd, max, min, variance and n(number of data points) for each lot.  We created a total of 3 datasets.
- Lot1 and Lot2 datasets have same mean and median, meaning the datasets have a normal distribution.  
- The mean and median for Lot3 dataset are slightly different, the dataset has a distribution that is slightly skewed to the left.
- The ranges for the datasets are: Lot1=4, Lot2=12 and Lot3=90.  The data for Lot3 is more spread out comparing with Lot1 and Lot2.  Lot 1 has the data less spread out.
- The dataset for lot1 has the lower standard deviation and variance.
- Taking in consideration the design specification for the MechaCar suspension coils the datasets for Lo1 and Lot2 meet the design specification, the variances for these datasets are below 100.
- The variance of the dataset for Lot3 is 170, this dataset does not meet the design specification that MechaCar suspension coils dictate because is higher than 100.


# Suspension Coil T-Test

## One Sample t-test

data:  log10(sample_table$PSI)
t = -0.67315, df = 49, p-value = 0.504
alternative hypothesis: true mean is not equal to 3.175732
95 percent confidence interval:
 3.174805 3.176194
sample estimates:
mean of x 
 3.175499 

- Conclusion: Assuming the significance level is 0.05 percent, the p-value is above the significance level, therefore, we do not have sufficient evidence to reject the null hypothesis, meaning the two means are statistically similar.

## Welch Two Sample t-test

data:  log10(sample_table$PSI) and log10(sample_table2$PSI)
t = -0.39953, df = 95.664, p-value = 0.6904
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.0010834060  0.0007203653
sample estimates:
mean of x mean of y 
 3.175499  3.175681 

- Conclusion: Assuming the significance level is 0.05 percent, the p-value is above the significance level, therefore, we do not have sufficient evidence to reject the null hypothesis, meaning the two means are statistically similar.


## Paired t-test
We created 3 datasets by Manufacturing_Lot (Lot1, Lot2 and Lot3).  We used the paired t-test to determine if there is a statistical difference in pressure between lot1, lot2 and lot3. Below are the results of the paired test:

### Paired Test 1: Lot1 and Lot 2
data:  suspension_coil_Lot1$PSI and suspension_coil_Lot2$PSI
t = -0.52031, df = 49, p-value = 0.6052
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -0.9724591  0.5724591
sample estimates:
mean of the differences -0.2 

- Conclusion: Assuming the significance level is 0.05 percent, the p-value is above the significance level, therefore, we do not have sufficient evidence to reject the null hypothesis, meaning the two means are statistically similar.

### Paired Test 2: Lot1 and Lot 3
data:  suspension_coil_Lot1$PSI and suspension_coil_Lot3$PSI
t = 2.0728, df = 49, p-value = 0.04347
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 0.1177828 7.6022172
sample estimates:
mean of the differences 3.86 

- Conclusion: Assuming the significance level is 0.05 percent, the p-value is below the significance level, therefore, we do have sufficient evidence to reject the null hypothesis, meaning the two means are statistically different.

### Paired Test 3: Lot2 and Lot 3
data:  suspension_coil_Lot2$PSI and suspension_coil_Lot3$PSI
t = 2.0883, df = 49, p-value = 0.04199
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 0.1529772 7.9670228
sample estimates:
mean of the differences 4.06

- Conclusion: Assuming the significance level is 0.05 percent, the p-value is below the significance level, therefore, we do have sufficient evidence to reject the null hypothesis, meaning the two means are statistically different.


## General observations about the T-Test
- Making the one sample and two sample T-test, we do not have sufficient evidence to reject the null hyphotesis, meaning the two means are statistically different.

- We created 3 datasets by Manufaturing lot to make the paired T-test.  When we paired lot1 and lot2, we did not have sufficient evidence to reject the null hypothesis, but when we paired lot1 with lot3 and lot 2 with lot3, we did have sufficient evidence to reject the null hypothesis, meaning the two means are statistically different.


# Design Your Own Study
- Compare the performance of the MechaCar prototype vehicle to other comparable vehicles on the market.

### We suggest to add more metrics to the data MechaCar that a consumer could be interested to make a statistical study more complete, we are suggesting the following metrics:
Car Cylinder, cost to manufacture, manufacturing cycle time, safety rating, type of vehicle (SUV, van, auto, etc), defective units, types of fuel, aspiration.

Car Cylinder: This metric is important to measure fuel economy and power of the cars.

Cost to manufacture: This metric is important because it can indicate an automotive company’s ability to produce vehicles efficiently.

Manufacturing cycle time: This metric is important because it helps determine how many units can be completed within a time period and determines the total number of units that will be available for customer purchase. The manufacturing cycle time is important for companies to stick to in order to produce enough vehicles for customer demand.

Safety rating: Help consumers find safer cars in the market.

Type of Vehicle: This is important information that customer always are looking for, size of the car.

Types of fuel: diesel or gas.

Aspiration: how the engine’s internal combustion works, turbo or standard.

Defective Units: This metric is an important quality measure for automotive companies. Automotive manufacturers should strive to keep recall rates low to in order to keep consumers safe as well as mitigate the costs that are associated with product recalls along with potential bad press that comes along with recalls, which may deter consumers from buying products from companies with high recall rates.

### Null and alternative hypothesis would be to answer that question, and what statistical test could be used to test this hypothesis.
- The safety rating is above the standard. Two sample T-test.
- How many recalls have the vehicle, how the price increase becuase the recalls. Simple Linear Regression. 
- Diesel car have better performance based on mpg.  Paired sample t-test
- How the manufacturing cost is related to car cylinders, aspiration (turbo or std) or type of fuel. Multiple linear regresion.

### We should collect the safety rating for the vehicles based on NHTSA, the recalls for each vehicle, the manufacturing cost, the car cylinders, the aspiration (turbo or std vehicle) and type of fuel (gas of diesel vehicle).



