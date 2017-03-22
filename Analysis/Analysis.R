###############################################################
# Code for Clean the data from GDP and Education
# 
# Case Study 1
# File: Analysis.R
# by Gerardo Garza
# Updated 3/21/2017
#
###############################################################

# ---- Analysiss to obtain the average GDP ranking based on High income group ----
highIncome<-mergedEducationGDP[grep("High income:", mergedEducationGDP$`Income Group`),]
OECD <- subset(highIncome, `Income Group`=="High income: OECD")
noOECD <- subset(highIncome, `Income Group`=="High income: nonOECD")
# creates new dataframes "highIncome", "OECD", and "noOECD" from a subset based on the Income group

# ---- GDP ranking grouping into quantiles (5) ----

RankGroupLabels<-c("Group 1","Group 2","Group 3","Group 4","Group 5")
#to create labels (this is just so the table in Knitr looks a little better)
mergedEducationGDP$RankGroup<- cut(mergedEducationGDP$Ranking, 5, labels = RankGroupLabels)
#this will add a column names Rank Group with the number of quantiles based on Ranking
tablebyRankGroup<-table(mergedEducationGDP$RankGroup, mergedEducationGDP$`Income Group`)
#this will create a table with for the number of each Income Groups listed by Ranked Group