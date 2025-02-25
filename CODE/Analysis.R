
utils::sessionInfo()  # Info on what was used to create and run this session in R

rm(list = ls())

setwd("C:/Users/Admin/Documents/UCT_2025/GIT/Reproducibility/CODE")

### !!! NOTE: use Alt + O to close all folded code sections for easy navigation !!! 
### (use Alt + Shift + O to open all) ###

### !!! IF YOU HAVE THIS OPEN IN BINDER (without R studio) PLEASE HIGHLIGHT THE ENTIRE CODE SEGMENT BEFORE PRESSING RUN !!! ###

# 1. Install and Load Packages ---------------------------------------------------------
# Package Installation for when running on binder
install.packages("patchwork")
install.packages("tidyverse")

# Load Packages
library("tidyverse")
library("patchwork")

# 2. Licensing and Referencing of Source Data ----------------------------------------
# Licensing
# Data provided under Creative Commons: Attribution 4.0 International

# Citation for Data Source:
# Composition and Functional Diversity of Juvenile Groundfish Assemblages in the California Current
# R. Gasbarro, J. A. Santora, M. Cimino, A. Schonfeld, S. J. Bograd, E. L. Hazen, et al.
# Journal of Biogeography 2025
# DOI: 10.1111/jbi.15108
# https://dx.doi.org/10.1111/jbi.15108

# 3. Load Data -------------------------------------------------
# Use of Rio package
odat <- read_csv("YOYGroundfishBiodiv_Data.csv")  # USE THIS WHEN IN R DESKTOP
odat <- read_csv("CODE/YOYGroundfishBiodiv_Data.csv")  # USE THIS WHEN IN BINDER

# 4. Data Cleaning Process ------------------------------------------------------------
# Re-formatting into Tidy format

# 1 - Getting the names of the fish species
names <- c(colnames(odat[4:49]))

# 2 - Removing the first column (redundant) and setting data into long format
# so that the names of the fish don't appear as column headings (new variable "Species")
odat.long <- odat %>%
  select(-YEAR_STATION) %>%
  pivot_longer(
    cols = all_of(names),
    names_to = "Species",
    values_to = "Taxon_CPUE(log + 1)"
  )

# 5. GROUPING DATA to create tibbles with Tidyverse functions ----------------------------------

# Wolfish CPUE for 2023 for sites and areas
Wcpue.2023 <- odat.long %>%
  filter(Species == "WOLF_EEL", YEAR == c("2023", "1990")) %>%
  select(YEAR, STATION, AREA, cpue) %>%
  mutate(CPUE.Mean.deviation = cpue - mean(cpue, na.rm = TRUE))

# Species diversity per area for 2023
Sd.23 <- odat.long %>%
  filter(YEAR == "2023") %>%
  select(AREA, cpue, sdiv) %>%
  group_by(AREA) %>%
  summarise(
    "Mean cpue" = mean(cpue),
    "SD cpue" = sd(cpue),
    "Mean sdiv" = mean(sdiv),
    "SD sdiv" = sd(sdiv)
  )

# Species diversity per area for 1990
Sd.90 <- odat.long %>%
  filter(YEAR == "1990") %>%
  select(AREA, cpue, sdiv) %>%
  group_by(AREA) %>%
  summarise(
    "Mean cpue" = mean(cpue),
    "SD cpue" = sd(cpue),
    "Mean sdiv" = mean(sdiv),
    "SD sdiv" = sd(sdiv)
  )

# Un-summarized data for 2023 CPUE and sdiv by area
Sd.23.unsum <- odat.long %>%
  filter(YEAR == "2023") %>%
  select(AREA, cpue, sdiv) %>%
  group_by(AREA) %>%
  arrange(cpue)

# Re-ordering by highest to lowest median CPUE
sd.23.cpueord <- Sd.23.unsum
sd.23.cpueord$AREA <- reorder(sd.23.cpueord$AREA, sd.23.cpueord$cpue, FUN = median, decreasing = TRUE)

# Re-ordering by highest to lowest median sdiv
sd.23.sdivord <- Sd.23.unsum
sd.23.sdivord$AREA <- reorder(sd.23.sdivord$AREA, sd.23.sdivord$sdiv, FUN = median, decreasing = TRUE)

# Un-summarized data for 1990 CPUE and sdiv by area
Sd.90.unsum <- odat.long %>%
  filter(YEAR == "1990") %>%
  select(AREA, cpue, sdiv) %>%
  group_by(AREA) %>%
  arrange(cpue)

# Re-ordering by highest to lowest median CPUE
sd.90.cpueord <- Sd.90.unsum
sd.90.cpueord$AREA <- reorder(sd.90.cpueord$AREA, sd.90.cpueord$cpue, FUN = median, decreasing = TRUE)

# Re-ordering by highest to lowest median sdiv
sd.90.sdivord <- Sd.90.unsum
sd.90.sdivord$AREA <- reorder(sd.90.sdivord$AREA, sd.90.sdivord$sdiv, FUN = median, decreasing = TRUE)

# 6. Plots from grouped data ---------------------------------------------------

# Plot 1: CPUE for 2023
bp1.Avcpue23 <- ggplot(sd.23.cpueord, aes(x = AREA, cpue)) +
  geom_boxplot(fill = "slateblue", alpha = 0.2) +
  xlab("AREA") + ylab("CPUE") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

# Plot 2: Species Diversity Index for 2023
bp2.Avsdiv23 <- ggplot(sd.23.sdivord, aes(x = AREA, sdiv)) +
  geom_boxplot(fill = "slateblue", alpha = 0.2) +
  xlab("AREA") + ylab("Species Diversity Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

# Plot 3: CPUE for 1990
bp3.Avcpue90 <- ggplot(sd.90.cpueord, aes(x = AREA, cpue)) +
  geom_boxplot(fill = "slateblue", alpha = 0.2) +
  xlab("AREA") + ylab("CPUE") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

# Plot 4: Species Diversity Index for 1990
bp4.Avsdiv90 <- ggplot(sd.90.sdivord, aes(x = AREA, sdiv)) +
  geom_boxplot(fill = "slateblue", alpha = 0.2) +
  xlab("AREA") + ylab("Species Diversity Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

# Display plots for 2023 and 1990
bp1.Avcpue23 + bp2.Avsdiv23  # 2023 CPUE and sdiv
bp3.Avcpue90 + bp4.Avsdiv90  # 1990 CPUE and sdiv

# 7. Mean SDI / year ------------------------------

# Create tibble for plot
Sd.year <- odat.long %>%
  select(YEAR, sdiv) %>%
  group_by(YEAR)

# Plot for Species Diversity Index across years
Avgsdiv.year <- ggplot(Sd.year, aes(x = YEAR, sdiv, group = YEAR)) +
  geom_boxplot(fill = "slateblue", alpha = 0.2) +
  xlab("YEAR") + ylab("Species Diversity Index") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(panel.grid.major = element_blank())

Avgsdiv.year
