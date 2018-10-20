# Nick Eubank's GIS in R: http://www.nickeubank.com/gis-in-r/
# Claudia Engel's mapping and spatial analysis in R: http://www.rpubs.com/cengel248


# 1. IMPORT STREETS DATA

# we will use streets to define the pedestrian network since in Austin the sidewalk network is limited,
# the existing sidewalk data layer does not include street crossings (precluding block creation)
# and most (though not all) road segments lacking sidewalks are still traverseable by pedestrians

install.packages("rgdal")
library("rgdal", lib.loc="~/R/win-library/3.3")

# import streets layer
streets <- readOGR(dsn="C:/Users/nicmo/OneDrive/Data projects/Superblocks - Network connectivity efficiency map Mar 2018/Austin street center lines 2018 Mar 28", layer="geo_export_331c6fce-a3a4-4c4a-a4cb-118405c321fa")

# check if layer is projected yet
is.projected(streets)
# nope

# set correct map projection for layer
# in central Texas, NAD83 projection code is EPSG:2277
# for other geographies, find appropriate projection code at spatialreference.org
centxProjection <- CRS("+init=EPSG:2277")
spTransform(streets,centxProjection)

# check layer to make sure it looks right
plot(streets)


# 2. DEFINE BLOCKS

# pull in block groups
# these come from the US Census: https://www.census.gov/geo/maps-data/data/cbf/cbf_blkgrp.html
blockGroups <- readOGR(dsn="C:/Users/nicmo/OneDrive/Data projects/Superblocks - Network connectivity efficiency map Mar 2018/Texas block groups for 2016 from 2018 Oct 20", layer="cb_2016_48_bg_500k")

# set projection for blockGroups layer
spTransform(blockGroups,centxProjection)

# filter block groups down to relevant counties
# county codes are based off FIPS codes
# 209 is Hays, 453 is Travis, 491 is Williamson
# note that this isn't a single command using 'c' to define a list of all three counties
#  because for some reason that corrupts the data
Hays <- subset(blockGroups, COUNTYFP == "209")
Travis <- subset(blockGroups, COUNTYFP == "453")
WillCo <- subset(blockGroups, COUNTYFP == "491")

# combine counties into one file
blockGroups <- rbind(Hays,Travis,WillCo)

# check layer to make sure it looks right
plot(blockGroups)

# remove extra block group data frames
rm(Hays,Travis,WillCo)


# 3. ASSOCIATE POPULATION DATA WITH BLOCK GROUPS

# import population estimates (2016 ACS 5-year) for each block group
acsPopData <- read_csv("C:/Users/nicmo/OneDrive/Data projects/Superblocks - Network connectivity efficiency map Mar 2018/ACS 5-year residential population estimates 2016 by block group/ACS_16_5YR_B01003_with_ann.csv", skip = 1)

# merge population estimates into blockGroups spatial data frame
blockGroups <- merge(blockGroups, acsPopData, by.x = "GEOID", by.y = "Id2")


# 4. ESTIMATE POPULATION VALUES FOR EACH STREET SEGMENT


# 5. CALCULATE PEDESTRIAN CONNECTIVITY EFFICIENCIES FOR EACH SEGMENT


# 6. LIST OUT STREET SEGMENTS WITH LARGEST EFFICENCY GAP


# 7. MAP OUT STREET SEGMENT BY EFFICIENCY GAP