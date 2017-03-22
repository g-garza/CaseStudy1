###############################################################
# Code for Download the data from the web
# 
# Case Study 1
# File: downloadData.R
# by Gerardo Garza
# Updated 3/21/2017
#
###############################################################

# ------------- Download Gross Domestic Product Data ---------------------

GDPURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
#Assigns the URL for the location of the GDP data to GDPURL
GDP.Data <- repmis::source_data(GDPURL, sha1 = "18dd2f9ca509a8ace7d8de3831a8f842124c533d")
#Downloads the data and stores it in the GDP.Data data frame
#Please note for replication purposes we are using a sha1 hash


# ------------- Download Education Data -------------------

EducationURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
#Assigns the URL for the location of the Education data to EducationURL
Education.Data<- repmis::source_data(EducationURL, sha1 = "20be6ae8245b5a565a815c18a615a83c34745e5e")
#Downloads the data and stores it in the Education.Data data frame
#Please note for replication purposes we are using a sha1 hash


# --- END ---

