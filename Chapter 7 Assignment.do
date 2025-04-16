***Ben Chima***
***Econometrics II***

clear all
***************STATA ASSIGNMENT CH 7****************

****************EXCERCISE 7.1***********************
*Also I want to add that all answers will be in this format --- *|______|*
** I do not know how to display them any other way to make them more obvious so I will use the bars to distinguish my thought process from my actual answers**

use "/Users/benc/Documents/Stata/birthweight_smoking.dta"

*** #1 ***

reg birthweight smoker, r

*** #2 ***

reg birthweight smoker alcohol nprevist, r 

*** #3 ***

reg birthweight smoker alcohol nprevist unmarried, r 

*** a) ***

*For the regression of birthweight on smoker the estimated effect is |-253.2284|. For birthweight on smoker, alcohol, and nprevist the value is |-217.5801|. For birthweight on smoker, alcohol, nprevist, and unmarried it is |-175.3769|.*

*** b) *** 

*Stata automatically gives the 95% confidence interval as well as the robust standard error.*

*For birthweight on smoker the interval is {-305.797, -200.6597} *
*For birthweight on smoker, alcohol, and nprevist it is {-268.7708, -166.3894}*
*For birthweight on smoker, alcohol, nprevist, and unmarried it is {-227.9777, -122.7761}*

*** c) ***

*It does seem to suffer from omitted variable bias. The R-Squared is usually used to determine the usefullness or effectiveness of a regression and for the first regression excluding alcohol and nprevist the R-Squared was 0.0286. In the second regression including all independent variables the regression was 0.0729. More than double the R-Squared of the first one and much closer to one. It's only explaining 7.3% of the data but that's better than only explaining 2.9%. The R-Squared values are so similar because they have very large n values at n=3000*

*** d) ***

*This regression is also likely to suffer from omitted variable bias because the 'unmaried' variable is likely to be correlated with all the other variables but is being left out.*

*** e) ***

*(i) already constructed the 95% confidence interval, check the answer for (b)*

*(ii) since the p-value is less than 0.05 in the output we can say it is statistically significant.*

*(iii) it is relatively small considering the other values are positive numbers but its absolute value is much larger than the others. It all depends on the data, (i.e depending on if a 0 or 1 represents marrige the coefficient could be positive or negative considering the estimated effect repesents the slope.) So it is relatively larger than the others. *

*(iv) Hypothetically, public policy encouraging marrige could be effected, but there are still other variables at play that could be effecting our results.*

*** f) ***

* Age and Drinks are must adds to the regression. If drinks means amount of alcoholic drinks during pregnancy that is. Education could be included since education level could have an impact on marrige and that is one of the main variables effecting birthweight*

********THIS CONCLUDES STATA ASSIGNMENT 7.1************
******THANK YOU FOR VIEWING*********
