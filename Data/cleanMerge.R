###############################################################
# Code for Clean the data from GDP and Education
# 
# Case Study 1
# File: cleanMerge.R
# by Gerardo Garza
# Updated 3/21/2017
#
###############################################################

#-------- GDP Data Cleanup --------
newGDP <- dplyr::rename(GDP.Data, CountryCode =V1, Ranking= `Gross domestic product 2012`, Country=V4, GDP=V5)
# Creates a new data frame newGDP with more human readable variables
# Changing V1, Gross domestic product 2012, v4 and V5 for CountryCode, Ranking, Country, and GDP respectively.
newGDP<- subset(newGDP, select = c("CountryCode", "Ranking","Country","GDP"))
#Keep only variables CountryCode, Ranking, Country and GDP.
newGDP[newGDP ==""] <- NA
#turn all empty values into NA
newGDP<-subset(newGDP, !is.na(newGDP$CountryCode))
#select only the records that do not have NA as the CountryCode and subset to newGDP.
newGDP$GDP<-gsub(",","", newGDP$GDP)
#replace the , on GDP in preparation for transformation to numeric.
newGDP$GDP<-as.numeric(newGDP$GDP)
newGDP$Ranking<-as.numeric(newGDP$Ranking)
#Changed GDP and Ranking to numeric to allow for mathematical calculations.
newGDP <-subset(newGDP, !is.na(newGDP$GDP))
newGDP <-subset(newGDP, !is.na(newGDP$Ranking))
#selects records that do not have NA from GDP and Ranking
newGDP<newGDP[order(newGDP$CountryCode),]
#orders by Country code.

# -------- Education Data Cleanup --------
newEducation <- subset(Education.Data, select = c("CountryCode", "Income Group"))
#Selects only Country code and Income Group and assigns Education.Data to a new data frame newEducation.

# -------- Merge of Education and GDP data --------
mergedEducationGDP<- merge (x=newGDP, y=newEducation, by="CountryCode", all=TRUE)
#Creates new data frame mergedEducationGDP with merged data from newGDP and newEducation. 
#Merging of the data is done by using the variable CountryCode as the key. 
#I used All=TRUE so we can keep all records.

# -------- Cleanup of new merged Data --------
mergedEducationGDP<-subset(mergedEducationGDP, !is.na(mergedEducationGDP$GDP))
mergedEducationGDP<-subset(mergedEducationGDP, !is.na(mergedEducationGDP$`Income Group`))
# Subset only records that are not NA from GDP and Income Group.
mergedEducationGDP$`Income Group`<-as.factor(mergedEducationGDP$`Income Group`)
#Changes the Income Group to a Factor instead of Character.
mergedEducationGDP<-mergedEducationGDP[order(mergedEducationGDP$GDP),]
#Data was ordered by GDPin ascending order
# --- END ---
