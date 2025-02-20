rm(list = ls())

setwd("C:/Users/Admin/Documents/UCT_2025/GIT/Honours-Project")

### !!! NOTE: use Alt + O to close all folded code sections for easy navigation !!! (use Alt + shft + O to open all) ###

#1 Load Packages ---------------------------------------------------------

#Load

library("tidyverse")
library("rio")
library("visreg")
library("gridExtra")



#2 Licencing and Referencing of Source Data ----------------------------------------

#Copyright © 2022 Fish, Wolf, Smeltz, Harris and Planas. This is an open-access article distributed under the terms of the Creative Commons Attribution License (CC BY). The use, distribution or reproduction in other forums is permitted, provided the original author(s) and the copyright owner(s) are credited and that the original publication in this journal is cited, in accordance with accepted academic practice. No use, distribution or reproduction is permitted which does not comply with these terms.

#Reproductive Biology of Female Pacific Halibut (Hippoglossus stenolepis) in the Gulf of Alaska
#T. Fish, N. Wolf, T. S. Smeltz, B. P. Harris and J. V. Planas
#Frontiers in Marine Science 2022 Vol. 9 
#DOI: 10.3389/fmars.2022.801759
#https://www.frontiersin.org/journals/marine-science/articles/10.3389/fmars.2022.801759



#3 Load Data -------------------------------------------------

odat <- import("Halibut_OocyteCycle_Raw.csv")


#4 Data Cleaning Process --------------------------------------------------------------


