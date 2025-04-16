***Ben Chima***
***Econometrics II***

clear all
**********STATA ASSNMENT CH 10***********************

************EXCERCISE 10.1 and 10.2 C,D,E*************
*Also I want to add that all answers will be in this format --- *|______|*
** I do not know how to display them any other way to make them more obvious so I will use the bars to distinguish my thought process from my actual answers**

use "/Users/benc/Documents/Stata/Guns.dta"

*****10.1*****

*** A ***

reg vio shall, r

reg vio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, r 

*** i ***

*I don't know what shall stands for but the coefficient is relatively big. -92.72125 is a pretty significant decrease in gun violence.*

*** ii ***

*Adding the extra variables helps to reduce the ommitted variable bias. And thereby make the final result a little bit less.*

*** iii ***

*Average income is a simple one since some state may have an lower average income and it may lead some people to choose crime. Another similar one is education which may lead some uneducated folks to commit crime more often.*


*** B ***

xtset stateid year

xtreg vio shall incarc_rate density avginc pop pb1064 pw1064 pm1029, fe

reg vio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.stateid, r 
*I used the other regression (xtset and xtreg) method before class on Wednesday b/c it was what I found online, so I'm including both. The coefficients for both examples were the same but the p-value was significantly higher in the first regresssion.*

*The results definitely look a lot more credible. The coefficient for shall is -18.57508 now instead of the much larger -92.72125.*


*** C ***

xtreg vio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.year, fe vce(cluster stateid) 

reg vio shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.year i.stateid, r 
*Again I'm including both methods because the coefficients are mostly the same*

*I may be more inclined to believe this one after I accounted for both state and time effects and my results were so much smaller at -0.8390586.*


*** D ***

*I don't know if it wnats me to complete each of the steps so I'm just going to compute the last regression to save myself the time.*

xtreg mur shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.year, fe vce(cluster stateid)

xtreg rob shall incarc_rate density avginc pop pb1064 pw1064 pm1029 i.year, fe vce(cluster stateid)  


*** E ***

*The major threats to the validity of this analysis are that I could have ran the regression wrong. But certain variables like education level and income would be nice to include. Although that varriation is being accounted for on a state by state basis. I think overall that would still have an effect on these factors.*


*** F ***

*The increase of concealed weapons would most likely have little to no effect on the crime rate. The crime rate would slightly decrease. But overall there is more testing needed to see if the impact of this policy could make a real change.*



******** 10.2 **********

use "/Users/benc/Documents/Stata/income_democracy.dta"

*** C ***

reg dem_ind log_gdppc, cluster(country)

*** i ***

*The coefficient in the regression is not very big at |.2356731| and it is very significant since the p-value is at 0.00.*

*** ii ***

*If per capita income increased by 20% the dem_ind is not ecpected to increase too much. That is because the difference in the values of our confidence level are small and therefore there would be little to no change on dem_ind.*

*** iii ***

*It is important to cluster the errors because some of the variables in the data set are linked to one another and we want to account for that.*


*** D ***

*** i ***

* A variable that could effect the regression could be religous befliefs, because that in turn could effect the eventual structure of the govenrmnent. Also resource distribution like oil and arable land.*

*** ii ***

*I'm using the code variable instead of country becasue I can't fiigure out how to covert the country variable from to values and not strings. But I realized that the code variable is linked to the names in the country variable

reg dem_ind log_gdppc i.code, r

*The values haven't changed too much, but I could be interpreting the data wrong.*

*** iii ***

preserve

drop if code==11

reg dem_ind log_gdppc i.code, r

*It did not have that much of an effect and you wouldn't expect it to considering it is just one country that only has one value.*

*** iv ***

*One variable that could fit the description is population, although changes from country to country, almost all countries see thier population relatively rise over the years.*

*** v ***

reg dem_ind log_gdppc i.code i.year, r

*The value of the coefficient decreased a bit to |.0535878|. But my answers don't seem to change that much. I don't really understand what I'm supposed to see here.*

*** vi ***

*Education should 100% be included in the regression.*

reg dem_ind log_gdppc i.code i.year educ, r

*After including education in the regression the coefficient decreased even more to |.0185384|. Meaning there seems to be even less correlation.*

*** E ***

*In conclusion there seems to be littlet to no effect between income and democracy... what a surprise.*


*****This concludes my assignment*************
***********THANK YOU FOR VIEWING******************************
