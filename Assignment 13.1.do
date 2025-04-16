*** Ben Chima ***
*** Econometrics II ***

clear all

********** STATA ASSIGNMENT 13.1 **************

*Also I want to add that all answers will be in this format --- *|______|*
** I do not know how to display them any other way to make them more obvious so I will use the bars to distinguish my thought process from my actual answers**

use "/Users/benc/Documents/Stata/Names.dta"

*(A)*

ttest call_back, by(black)

*The callback rate for whites is 0.0097 and for blacks it is 0.0064. The 95% confidence interval for the difference is [0.0167708, 0.0472949]* 


*(B)*

gen femalexblack = female*black

reg call_back black femalexblack, r 

*The coefficient is not statistically different from 0, so the call back differential is not different for men and women.*

*(C)*

ttest call_back, by(high)

*The difference is not too much.*

gen highxblack = high*black

reg call_back black highxblack high, r

*The high/low difference for whites is 2.2%. For blacks it is the coefficient for high + highxblack which is 0.5%. The coefficient for whites vs blacks is the coefficient on highxblack which is 1.7%.

*(D)*

* Need to find the F-Statistic with the previous regression, which is still insignificant, so the data is most likely still random.*






