rm(list = ls())

utils::sessionInfo() #Info on what was used to create and run this session in R

setwd("C:/Users/Admin/Documents/UCT_2025/GIT/Honours-Project")

### !!! NOTE: use Alt + O to close all folded code sections for easy navigation !!! (use Alt + shft + O to open all) ###

### !!! IF YOU HAVE THIS OPEN IN BINDER PLEASE HIGHLIGHT THE ENTIRE CODE SEGMENT BEFORE PRESSING RUN !!! ###

#1 Install and Load Packages---------------------------------------------------------

#Package Installation for when running on binder

install.packages("rio")
install.packages("tidyverse")

#Load

library("tidyverse")
library("rio")

#2 Licencing and Referencing of Source Data ----------------------------------------

#licensing

#Data provided under Creative Commons: Attribution 4.0 International

#Citation for Data Source

#Composition and Functional Diversity of Juvenile Groundfish Assemblages in the California Current
#R. Gasbarro, J. A. Santora, M. Cimino, A. Schonfeld, S. J. Bograd, E. L. Hazen, et al.
#Journal of Biogeography 2025 
#DOI: 10.1111/jbi.15108
#https://dx.doi.org/10.1111/jbi.15108



#3 Load Data -------------------------------------------------

 #Use of Rio package

odat <- import("YOYGroundfishBiodiv_Data.csv")

#4 Data Cleaning Process --------------------------------------------------------------

#Re-formatiing into Tidy format

#1 - getting the names of the fish spedcies

names <- c(colnames(odat[4:49]))

species_columns <- c("WOLF_EEL", "SABLEFISH", "ARROWTOOTH_FLOUNDER", "PACIFIC_SANDDAB", 
                     "SPECKLED_SANDDAB", "SCULPIN", "REX_SOLE", "GREENLING", "SLENDER_SOLE", 
                     "PACIFIC_HAKE", "DOVER_SOLE", "LINGCOD", "PAINTED_GREENLING", 
                     "RIGHT_EYED_FLATFISH", "TURBOT", "SAND_SOLE", "CABEZON", 
                     "BROWN_ROCKFISH", "DARKBLOTCHED_ROCKFISH", "CALICO_ROCKFISH", 
                     "SPLITNOSE_ROCKFISH", "GREENSTRIPED_ROCKFISH", "WIDOW_ROCKFISH", 
                     "YELLOWTAIL_ROCKFISH", "CHILIPEPPER", "SQUARESPOT_ROCKFISH", 
                     "SHORTBELLY_ROCKFISH", "COWCOD", "BLACK_ROCKFISH", 
                     "BLACKGILL_ROCKFISH", "BLUE_ROCKFISH", "BOCACCIO", "CANARY_ROCKFISH", 
                     "YELLOWMOUTH_ROCKFISH", "YELLOWEYE_ROCKFISH", "BANK_ROCKFISH", 
                     "STRIPETAIL_ROCKFISH", "HALFBANDED_ROCKFISH", "OLIVE_ROCKFISH", 
                     "PYGMY_ROCKFISH", "SHARPCHIN_ROCKFISH", "ROCKFISH", 
                     "ROSY_ROCKFISH_GROUP", "PACIFIC_TOMCOD", "COPPER_ROCKFISH_GROUP", 
                     "IRISH_LORD")

#2 Removing the first Column - redundant
# and setting data into long format so that the names of the fish don't appear as column headings - new variable "Species"

odat.long <- odat %>%
  select(-YEAR_STATION) %>%
  pivot_longer(
    cols = all_of(species_columns),
    names_to = "Species",
    values_to = "Taxon_CPUE(log + 1)"
  )



# GROUPING DATA with Tidyverse functions ----------------------------------

#wolfish CPUE for 2023 for sites and areas

Wcpue.2023 <- odat.long %>% 
  filter(Species == "WOLF_EEL", YEAR == c("2023","1990")) %>%
  select(YEAR,STATION,AREA,cpue) %>%
  mutate(CPUE.Mean.deviation = cpue - mean(cpue, na.rm = TRUE))

#Species diversity per area for 2023

Sd.23 <- odat.long %>% 
  filter(YEAR == c("2023")) %>%
  select(AREA,cpue,sdiv) %>%
  mutate(Dev.MeanSPdiv = sdiv - mean(sdiv) )%>%
  group_by(AREA)%>%
  arrange(desc(Dev.MeanSPdiv))

#Species diversity per area for 1990

Sd.90 <- odat.long %>% 
  filter(YEAR == c("1990")) %>%
  select(AREA,cpue,sdiv) %>%
  mutate(Dev.MeanSPdiv = sdiv - mean(sdiv) )%>%
  group_by(AREA)%>%
  arrange(desc(Dev.MeanSPdiv))

#



