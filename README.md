# superblocks
Where could new pedestrian connections in an urban grid connect the most people to each other?

Problem: People in many areas are unable to walk to nearby attractions because of inefficient connectivity of pathways (whether these are sidewalks or something else).

Goal: Identify locations in Austin where additional connectivity in terms of streets, paseos, or paths can connect people to each other.

Process:
  -	Take all people who reside within a given block, all people who work within a given block, and all students enrolled within a given block to estimate the ‘true’ population of each block. A ‘block’ in this sense refers to an area encompassed by roadways, so superblocks and areas of roadway ringing a body of water would be considered a ‘block’. Note that the sum of these people should be higher than the true population count, since individual might be double- or triple-counted where they sleep, work, and/or study.
  -	Distribute all people within a given block randomly. This becomes a new layer.
  -	Snap each dot to the nearest roadway. Alternatively, break each road segment in sections of a given, short length. Count how many points are closer to that mini-segment that to any other, and represent this as a density within the mini road segment.
  -	Using a given distance (for reasonable walking purposes, this could be up to 1km) calculate for each individual how many other people they can reach using the road network, and how many they could reach as the crow flies.
  -	There are two meaningful metrics that can be calculated for each individual:
    -	Relative efficiency: divide the number of people reached within X distance along the road network by the number of people reached with X distance as the crow flies. This metric is useful for measuring general road connectivity.
    -	Absolute efficiency: subtract the number of people reached within X distance along the road network from the number of people reached with X distance as the crow flies. This method is useful for identifying locations where connectivity improvement might have the biggest impact to connect people to each other.

Testing for robustness

Assumptions and limitations:
  -	Attractions can be represented by the sum density of residents, employees, and students in any given block. Note that this does not account for attractors such as retail, community spaces, entertainment, recreation, hotels, or transit, as these do not typically have large populations of residents, employees, or students.
  -	This method does not account for where people might truly be entering or leaving buildings, so there could be some bias in calculating distances to other people, and counts of other people, within a given distance.
  -	Private schools are not counted.
  
Deadline: prior to end of Texas Legislative session (May 2019).

Data sources:
  -	Residential population estimates at the block group level from U.S. Census American Community Survey: https://factfinder.census.gov/
  -	Public and charter K-12 enrollment at the campus level from Texas Education Agency (TEA) PEIMS: https://rptsvr1.tea.texas.gov/adhocrpt/adste.html
  -	Employment data from LEHD LODES Workplace Area Characteristics (WAC) data at the Census block level: https://lehd.ces.census.gov/data/#lodes

Note that FIPS codes are Hays (48209), Travis (48453), and Williamson (48491)
