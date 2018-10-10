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


# 3. ASSOCIATE POPULATION DATA WITH BLOCKS


# 4. ESTIMATE POPULATION VALUES FOR EACH STREET SEGMENT


# 5. CALCULATE PEDESTRIAN CONNECTIVITY EFFICIENCIES FOR EACH SEGMENT


# 6. LIST OUT STREET SEGMENTS WITH LARGEST EFFICENCY GAP


# 7. MAP OUT STREET SEGMENT BY EFFICIENCY GAP