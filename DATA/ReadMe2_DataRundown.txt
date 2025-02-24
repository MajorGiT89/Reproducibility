# Data from: Composition and functional diversity of juvenile groundfish assemblages in the California current

[https://doi.org/10.5061/dryad.w0vt4b92x](https://doi.org/10.5061/dryad.w0vt4b92x)

## Description of the data and file structure

### Files and variables

#### File: YOYGroundfishBiodiv\_Data.csv

**Description:** 

##### Variables

* YEAR_STATION: Unique identifier for each sample representing year & station of sampling
* YEAR: Sample Year
* STATION: Sample station number
* WOLF_EEL: Taxon CPUE (log + 1)
* SABLEFISH: Taxon CPUE (log + 1)
* ARROWTOOTH_FLOUNDER: Taxon CPUE (log + 1)
* PACIFIC_SANDDAB: Taxon CPUE (log + 1)
* SPECKLED_SANDDAB: Taxon CPUE (log + 1)
* SCULPIN: Taxon CPUE (log + 1)
* REX_SOLE: Taxon CPUE (log + 1)
* GREENLING: Taxon CPUE (log + 1)
* SLENDER_SOLE: Taxon CPUE (log + 1)
* PACIFIC_HAKE: Taxon CPUE (log + 1)
* DOVER_SOLE: Taxon CPUE (log + 1)
* LINGCOD: Taxon CPUE (log + 1)
* PAINTED_GREENLING: Taxon CPUE (log + 1)
* RIGHT_EYED_FLATFISH: Taxon CPUE (log + 1)
* TURBOT: Taxon CPUE (log + 1)
* SAND_SOLE: Taxon CPUE (log + 1)
* CABEZON: Taxon CPUE (log + 1)
* BROWN_ROCKFISH: Taxon CPUE (log + 1)
* DARKBLOTCHED_ROCKFISH: Taxon CPUE (log + 1)
* CALICO_ROCKFISH: Taxon CPUE (log + 1)
* SPLITNOSE_ROCKFISH: Taxon CPUE (log + 1)
* GREENSTRIPED_ROCKFISH: Taxon CPUE (log + 1)
* WIDOW_ROCKFISH: Taxon CPUE (log + 1)
* YELLOWTAIL_ROCKFISH: Taxon CPUE (log + 1)
* CHILIPEPPER: Taxon CPUE (log + 1)
* SQUARESPOT_ROCKFISH: Taxon CPUE (log + 1)
* SHORTBELLY_ROCKFISH: Taxon CPUE (log + 1)
* COWCOD: Taxon CPUE (log + 1)
* BLACK_ROCKFISH: Taxon CPUE (log + 1)
* BLACKGILL_ROCKFISH: Taxon CPUE (log + 1)
* BLUE_ROCKFISH: Taxon CPUE (log + 1)
* BOCACCIO: Taxon CPUE (log + 1)
* CANARY_ROCKFISH: Taxon CPUE (log + 1)
* YELLOWMOUTH_ROCKFISH: Taxon CPUE (log + 1)
* YELLOWEYE_ROCKFISH: Taxon CPUE (log + 1)
* BANK_ROCKFISH: Taxon CPUE (log + 1)
* STRIPETAIL_ROCKFISH: Taxon CPUE (log + 1)
* HALFBANDED_ROCKFISH: Taxon CPUE (log + 1)
* OLIVE_ROCKFISH: Taxon CPUE (log + 1)
* PYGMY_ROCKFISH: Taxon CPUE (log + 1)
* SHARPCHIN_ROCKFISH: Taxon CPUE (log + 1)
* ROCKFISH: Taxon CPUE (log + 1)
* ROSY_ROCKFISH_GROUP: Taxon CPUE (log + 1)
* PACIFIC_TOMCOD: Taxon CPUE (log + 1)
* COPPER_ROCKFISH_GROUP: Taxon CPUE (log + 1)
* IRISH_LORD: Taxon CPUE (log + 1)
* sdiv: Shannon-Weiner Diversity Index
* nspec: Species Richness
* eve: Pielou's Evenness (J); NA values present where <2 taxa are present. 
* LCBD: Local Contributions to Beta Diversity
* LONDD: Longitude in decimal degrees
* LATDD: Latitude in decimal degrees
* PROVINCE: California Current biogeographic province (North, Central, or South)
* SURVEY: Survey on which the sample occurred (RREAS or NWFSC)
* CRUISE: Unique cruise identifier
* STATION_BOTTOM_DEPTH: Bottom depth of station
* AREA: Geographic area of station
* ACTIVE: Binary; is station active (1) or not (0)
* clust_6: Assemblage cluster assigned to sample
* core: Binary; is sample inside 'Core' region (1) or not (0)
* cpue: Total CPUE across species
* MDS1: Sample location on first axis of compositional NMDS
* MDS2: Sample location on second axis of compositional NMDS
* MDS3: Sample location on third axis of compositional NMDS
* centroid_distance: Euclidean distance in NMDS space of sample to the regional (by Province) climatological centroid
* rar50: Rarefied (50 individuals) species richness 
* fMDS1: Sample location on first axis of functional trait NMDS; NA values present in samples with <5 taxa.
* fMDS2: Sample location on second axis of functional trait NMDS; NA values present in samples with <5 taxa.
* fMDS3: Sample location on third axis of functional trait NMDS; NA values present in samples with <5 taxa.
* centroid_distance_fd: Euclidean distance in functional NMDS space of sample to the regional (by Province) climatological centroid; NA values present in samples with <5 taxa.
* feve: Functional Evenness; NA values present in samples with <5 taxa.
* fric: Functional Richness; NA values present in samples with <5 taxa.
* fdiv: Functional Divergence; NA values present in samples with <5 taxa.

## Access information

Raw trawl data from RREAS is available on ERRDAP ([https://coastwatch.pfeg.noaa.gov/erddap/tabledap/FED_Rockfish_Catch.html](https://coastwatch.pfeg.noaa.gov/erddap/tabledap/FED_Rockfish_Catch.html)) and can be accessed using the ‘RREAS’ R package ([https://github.com/tanyalrogers/RREAS](https://github.com/tanyalrogers/RREAS)). Raw trawl data from the NOAA Northwest Fisheries Science Center’s pre-recruit survey is available upon reasonable request. Functional trait data from the Pelagic Species Traits database (Glieber et al. 2024a) can be accessed at the following URL: [https://borealisdata.ca/dataset.xhtml?persistentId=doi:10.5683/SP3/0YFJED](https://borealisdata.ca/dataset.xhtml?persistentId=doi:10.5683/SP3/0YFJED).
