###############################################################
# Code for Clean the data from GDP and Education
# 
# Case Study 1
# File: Plots.R
# by Gerardo Garza
# Updated 3/21/2017
#
###############################################################
library(ggplot2)
#=== plots ==
PlotAllCountries<-ggplot(mergedEducationGDP) +
  aes(x=Country, y= GDP, colour = `Income Group`) +
  geom_point() +
  scale_y_continuous(labels = scales::comma) +
  theme(axis.text.x = element_blank())

PlotAllCountriesbyIGroup<-ggplot(mergedEducationGDP) +
  aes(x=Country, y= GDP, colour = `Income Group`) +
  geom_point() +
  facet_grid(`Income Group`~., scales = "free_y") +
  scale_y_continuous(labels = scales::comma) +
  theme(strip.text = element_blank()) +
  theme(axis.text.x = element_blank())

# --- END ---