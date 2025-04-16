
****Ben Chima****
***Econometrics II***


clear all
******STATA ASSINGNMENT*****
******EXCERCISE 12.1********

*All answers will be in the format *|______|*

use "/Users/benc/Documents/Stata/fertility.dta"

*(A)*
rename weeksm1 weeksworked

reg weeksworked morekids, r 

*On average women with more than two kids do tend to work less, about |-5.386996| weeks less than women with less than 2 kids.*

*(B)*

*It is becasue we want A1 to hold. That is that there is strict causality between our x variable(amount of kids), and our u variable(# of weeks worked).*

*(C)*

reg morekids samesex, r

*The effect doesnt seem to be large since the coefficient is |.0675253|, but is very significant since the t-stat is |35.19|.*

*(D)*

*Well samesex seems to meet the two requirements of a good instrument. For one it is clearly correlated strongly with the x variable we want to use in our equation(morekids). The second reason is that it only effects our u variable (weeksworked) through the x variable since you will already have to have two kids, whether they are same sex or not, to have more than two kids. If that makes sense*

*(E)*

*You could say that samesex could be classified as a weak instrument since it has a very small effect, although significant.*

*(F)*

ivreg weeksworked (morekids = samesex), first

*It seems very clear that if you have more than 2 kids you are likely to work |-6.313685| less weeks than others that have less than 3 kids.*


*(G)*

ivreg weeksworked (morekids = samesex agem1 black hispan othrace), first

*I feel that I may have ran the regression wrong becuase it seems that the coefficienct is now very positive at |28.73109|. Meaning they would work more weeks than other mothers. Unless this is implying that this specific instrument isn't very effective.*


*******THANK YOU FOR VIEWING************



