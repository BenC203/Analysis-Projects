****** STATA ASSIGNMENT 11.2 ******
**** BEN CHIMA ****


clear all
*All answers will be in the format *|______|*

use "/Users/benc/Documents/Stata/Smoking.dta"
*((A))*

*(i)*
sum smoker

* The probability of being a smoker is |2.423|*


*(ii)*
summarize smoker if smkban == 1

*The probability of smoking when there is a smoking ban is |0.2120367|.*


*(iii)*
summarize smoker if smkban == 0

*The probability of smoking when there is a smoking ban is |0.2896|*


*((B))*

reg smoker smkban, r

*If an individual is someone that would be affected by a smoking ban the probability of them not smoking anymore increases by |0.0776|*


*((C))*
*For some reason my dataset doesn't have a variable called age2 so I omitted that one from the regression.
reg smoker smkban female age hsdrop hsgrad colsome colgrad hispanic, r 

*Essentially with all these variables being accounted for the probability of a smoker no longer smoking after the ban would increase by |0.044324 or 4.43%|*


*((D))*

*To compute the t-stat in this case i will just be using the formula

display (-0.047 - 0)/0.009
*|-5.27|*

*Since the absolute value of -5.27 is greater than 1.96 we can say that the data is statistically significant on the 5% level. And therefore we can reject the null hypothesis.


*((E))*
test hsdrop=hsgrad=colsome=colgrad=0

*Since the coefficients for lower levels of education like high school dropouts are higher than that of higher education levels like college graduates we can say that the probability of smoking increases as education levels increase.


*((F))*
probit smoker smkban, r

*Smoking ban reduces chance of smoking by |0.2448|*

probit smoker smkban female age hsdrop hsgrad colsome colgrad hispanic, r 

*Smoking ban reduces chance of smoking by |0.1524|*

display (-0.159-0)/0.029
*|-5.45|*
*Again statistically significant and we reject the null hypothesis.

test hsdrop=hsgrad=colsome=colgrad=0

*Same conclusion as last time. As one gets higher education they are less likely to be a smoker.*



*((G))*
logit smoker smkban, r

*Smoking ban reduces chances of smoking by |0.4153|*

logit smoker smkban female age hsdrop hsgrad colsome colgrad hispanic, r

*Smoking ban reduces chance of smoking by |0.2521|*

display (-0.252-0)/0.049
*|-5.14|*

*Again statistically significant and we reject the null hypothesis.

test hsdrop=hsgrad=colsome=colgrad=0
*Same conclusion as last time. As one gets higher education they are less likely to be a smoker.*



*((H))*

*(i)*

*if no smoking ban:
display (20 * 0.035 - 20 * 0.001 + 1.142 - 1.735) 
*|.464|*

*if smoking ban:
display (20 * 0.035 - 20 * 0.001 + 1.142 - 0.159 - 1.735) 
*|.402|*

*(ii)*
*no ban:
display (-0.11 + 40 * 0.03 - 40 * 0.001 - 0.08 + 0.23 - 1.73)
*|.144|*

*w/ ban:
display (-0.11 + 40 * 0.03 - 40 * 0.001 - 0.08 + 0.23 - 1.73 - 0.159)
*|.111|*


*(iii)*
*A no ban:
display (20 * 0.010 - 20 * 0.001 - 0.014 + 0.323 - 0.014)
*|.449|*

*A w/ ban:
display (20 * 0.10 - 20 *0.001 - 0.014 + 0.323 - 0.047 - .014 )
*|.402|* 

*B no ban:
display (-0.033 - 0.028 + 0.045 +40 * 0.010 - 40 * 0.001 - .014) 
*|.146|*

*B w/ ban:
display (-.033 - .028 + .045 +40 * .010 - 40 * .001 - .014 - .047) 
*|.099|*

*(v)* Logit and Progit models do differ but they produce very similar results.*



