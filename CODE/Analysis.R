utils::sessionInfo() #Info on what was used to create and run this session in R

rm(list = ls())

setwd("C:/Users/Admin/Documents/UCT_2025/GIT/Reproducibility/CODE")

### !!! NOTE: use Alt + O to close all folded code sections for easy navigation !!! (use Alt + shft + O to open all) ###

### !!! IF YOU HAVE THIS OPEN IN BINDER (without R studio) PLEASE HIGHLIGHT THE ENTIRE CODE SEGMENT BEFORE PRESSING RUN !!! ###

#1 Install and Load Packages---------------------------------------------------------

#Package Installation for when running on binder

install.packages("patchwork")
install.packages("rio")
install.packages("tidyverse")

#Load

library("tidyverse")
library("rio")
library("patchwork")

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

#2 Removing the first Column - redundant
# and setting data into long format so that the names of the fish don't appear as column headings - new variable "Species"

odat.long <- odat %>%
  select(-YEAR_STATION) %>%
  pivot_longer(
    cols = all_of(names),
    names_to = "Species",
    values_to = "Taxon_CPUE(log + 1)"
  )



#5 GROUPING DATA to create tibbles with Tidyverse functions ----------------------------------

#wolfish CPUE for 2023 for sites and areas

Wcpue.2023 <- odat.long %>% 
  filter(Species == "WOLF_EEL", YEAR == c("2023","1990")) %>%
  select(YEAR,STATION,AREA,cpue) %>%
  mutate(CPUE.Mean.deviation = cpue - mean(cpue, na.rm = TRUE))

#Species diversity per area for 2023

Sd.23 <- odat.long %>% 
  filter(YEAR == c("2023")) %>%
  select(AREA,cpue,sdiv) %>%
  group_by(AREA)%>%
  summarise("Mean cpue" = mean(cpue),
            "SD cpue" = sd(cpue),
            "Mean sdiv" = mean(sdiv),
            "SD sdiv" = sd(sdiv))

#Species diversity per area for 1990

Sd.90 <- odat.long %>% 
  filter(YEAR == c("1990")) %>%
  select(AREA,cpue,sdiv) %>%
  group_by(AREA)%>%
  summarise("Mean cpue" = mean(cpue),
            "SD cpue" = sd(cpue),
            "Mean sdiv" = mean(sdiv),
            "SD sdiv" = sd(sdiv))

#un-summarized data for 2023 cpue and sdiv by area

Sd.23.unsum <- odat.long %>% 
  filter(YEAR == c("2023")) %>%
  select(AREA,cpue,sdiv) %>%
  group_by(AREA)%>%
  arrange(cpue)
#re-rodering by highest to lowest median cpue
sd.23.cpueord <- Sd.23.unsum 

sd.23.cpueord$AREA <- reorder(sd.23.cpueord$AREA, sd.23.cpueord$cpue, FUN = median, decreasing = TRUE)
#
#re-rodering by highest to lowest median sdiv
sd.23.sdivord <- Sd.23.unsum 

sd.23.sdivord$AREA <- reorder(sd.23.sdivord$AREA, sd.23.sdivord$sdiv, FUN = median, decreasing = TRUE)
#

#un-summarized data for 1990 cpue and sdiv by area

Sd.90.unsum <- odat.long %>% 
  filter(YEAR == c("1990")) %>%
  select(AREA,cpue,sdiv) %>%
  group_by(AREA)%>%
  arrange(cpue)
#re-rodering by highest to lowest median cpue
sd.90.cpueord <- Sd.90.unsum 

sd.90.cpueord$AREA <- reorder(sd.90.cpueord$AREA, sd.90.cpueord$cpue, FUN = median, decreasing = TRUE)
#
#re-rodering by highest to lowest median sdiv
sd.90.sdivord <- Sd.90.unsum 

sd.90.sdivord$AREA <- reorder(sd.90.sdivord$AREA, sd.90.sdivord$sdiv, FUN = median, decreasing = TRUE)
#
#6 plots from grouped data  ---------------------------------------------------

bp1.Avcpue23 <- ggplot(sd.23.cpueord,aes(x=AREA,cpue))+
  geom_boxplot(fill="slateblue", alpha=0.2)+ 
  xlab("AREA") + ylab("CPUE") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

bp2.Avsdiv23 <- ggplot(sd.23.sdivord,aes(x=AREA,sdiv))+
  geom_boxplot(fill="slateblue", alpha=0.2)+ 
  xlab("AREA") + ylab("Species Diversity Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

##

  
bp3.Avcpue90 <-  ggplot(sd.90.cpueord,aes(x=AREA,cpue))+
  geom_boxplot(fill="slateblue", alpha=0.2)+ 
  xlab("AREA") + ylab("CPUE") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())


bp4.Avsdiv90 <- ggplot(sd.90.sdivord,aes(x=AREA,sdiv))+
  geom_boxplot(fill="slateblue", alpha=0.2)+ 
  xlab("AREA") + ylab("Species diversity Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

#Plotting 

bp1.Avcpue23 + bp2.Avsdiv23 #2023 cpue and sdiv

bp3.Avcpue90 + bp4.Avsdiv90 #1990 cpue and sdiv


#7 Mean SDI / yeaar ------------------------------

#create tibble for plot

Sd.year <- odat.long %>% 
  select(YEAR,sdiv) %>%
  group_by(YEAR)
 

#plot

Avgsdiv.year <- ggplot(Sd.year,aes(x=YEAR,sdiv, group = YEAR))+
  geom_boxplot(fill="slateblue", alpha=0.2)+ 
  xlab("YEAR") + ylab("Species Diversity Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

Avgsdiv.year

