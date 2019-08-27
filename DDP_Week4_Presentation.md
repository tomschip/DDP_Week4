DDP_Week4_Presentation
========================================================
author: Thomas Schipritt
date: 8/27/2019
autosize: true

Predicting Cereal Ratings
========================================================

Using four different nutritional factors, the app predicts the rating of the cereal.  There are four sliders available to adjust the amounts of the nutrional factors.

- Grams of Fat
- Grams of Sugar
- Grams of Protein
- Grams of Fiber



The prediction is based off a study of 80 breakfast cereals
========================================================
Data Source: https://www.kaggle.com/crawford/80-cereals/downloads/80-cereals.zip/2


```r
cereal_data <- read.csv("https://raw.githubusercontent.com/tomschip/DDP_Week4/master/cereal.csv",header=T, sep = ",")
summary(cereal_data)
```

```
                        name    mfr    type      calories    
 100% Bran                : 1   A: 1   C:74   Min.   : 50.0  
 100% Natural Bran        : 1   G:22   H: 3   1st Qu.:100.0  
 All-Bran                 : 1   K:23          Median :110.0  
 All-Bran with Extra Fiber: 1   N: 6          Mean   :106.9  
 Almond Delight           : 1   P: 9          3rd Qu.:110.0  
 Apple Cinnamon Cheerios  : 1   Q: 8          Max.   :160.0  
 (Other)                  :71   R: 8                         
    protein           fat            sodium          fiber       
 Min.   :1.000   Min.   :0.000   Min.   :  0.0   Min.   : 0.000  
 1st Qu.:2.000   1st Qu.:0.000   1st Qu.:130.0   1st Qu.: 1.000  
 Median :3.000   Median :1.000   Median :180.0   Median : 2.000  
 Mean   :2.545   Mean   :1.013   Mean   :159.7   Mean   : 2.152  
 3rd Qu.:3.000   3rd Qu.:2.000   3rd Qu.:210.0   3rd Qu.: 3.000  
 Max.   :6.000   Max.   :5.000   Max.   :320.0   Max.   :14.000  
                                                                 
     carbo          sugars           potass          vitamins     
 Min.   :-1.0   Min.   :-1.000   Min.   : -1.00   Min.   :  0.00  
 1st Qu.:12.0   1st Qu.: 3.000   1st Qu.: 40.00   1st Qu.: 25.00  
 Median :14.0   Median : 7.000   Median : 90.00   Median : 25.00  
 Mean   :14.6   Mean   : 6.922   Mean   : 96.08   Mean   : 28.25  
 3rd Qu.:17.0   3rd Qu.:11.000   3rd Qu.:120.00   3rd Qu.: 25.00  
 Max.   :23.0   Max.   :15.000   Max.   :330.00   Max.   :100.00  
                                                                  
     shelf           weight          cups           rating     
 Min.   :1.000   Min.   :0.50   Min.   :0.250   Min.   :18.04  
 1st Qu.:1.000   1st Qu.:1.00   1st Qu.:0.670   1st Qu.:33.17  
 Median :2.000   Median :1.00   Median :0.750   Median :40.40  
 Mean   :2.208   Mean   :1.03   Mean   :0.821   Mean   :42.67  
 3rd Qu.:3.000   3rd Qu.:1.00   3rd Qu.:1.000   3rd Qu.:50.83  
 Max.   :3.000   Max.   :1.50   Max.   :1.500   Max.   :93.70  
                                                               
```

The adjusted r squared of the model is .87 and the p-value is less than .05
========================================================
The 4 factors explain 87% of the variation in rating and the null hypotheisis can be rejected because of the low p-value


```r
model <- lm(rating ~ fat + sugars + protein + fiber, data = cereal_data)
summary(model)
```

```

Call:
lm(formula = rating ~ fat + sugars + protein + fiber, data = cereal_data)

Residuals:
    Min      1Q  Median      3Q     Max 
-9.9746 -3.4412 -0.8455  2.9144 10.4912 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  50.0205     2.0993  23.827  < 2e-16 ***
fat          -3.9424     0.6463  -6.100 4.81e-08 ***
sugars       -1.8412     0.1508 -12.207  < 2e-16 ***
protein       1.4422     0.6917   2.085   0.0406 *  
fiber         2.6545     0.2868   9.254 7.04e-14 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 5.119 on 72 degrees of freedom
Multiple R-squared:  0.8742,	Adjusted R-squared:  0.8672 
F-statistic: 125.1 on 4 and 72 DF,  p-value: < 2.2e-16
```

The plot of the residuals is random - so the predictional model is appropriate
========================================================

![plot of chunk unnamed-chunk-3](DDP_Week4_Presentation-figure/unnamed-chunk-3-1.png)
