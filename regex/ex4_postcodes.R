rm(list = ls())
library(stringr)

# 1. Look at pattern vs. pattern_with_groups: 
#    can you see how the groupings have been applied?
# 2. Recall the general structure of a postcode
#    use the output from match (variable x) 
#    to construct the elements of a postcode
#    the outcode is given as an example


postcodes_original = c("DL98 1AD",
                       "TN29 0NA",
                       "SO21 1PN",
                       "L31 0BB",
                       "GU31 4LH",
                       "CH45 4RT",
                       "RG27 9DH",
                       "PL35 0AT",
                       "GU10 5EQ",
                       "SG13 9BD")

# write regex patterns with and without groups
pattern             = r"([A-Z]{1,2}[1-9][0-9]? [0-9][A-Z]{2})"
pattern_with_groups = r"(([A-Z]{1,2})([1-9][0-9]?) ([0-9])([A-Z]{2}))"

# detect returns vector of TRUE/FALSE values
stringr::str_detect(string = postcodes_original,
                    pattern = pattern)

# extract returns vector of the valid postcodes 
stringr::str_extract(string = postcodes_original,
                     pattern = pattern)

# match returns the valid postcode plus any groupings in array format
# first column is valid postcode
# subsequnt colummns are groupings
# original patter - no groupings so no additional columns
stringr::str_match(string = postcodes_original,
                   pattern = pattern)

# ....if we add groupings, we see extra colummns
x = stringr::str_match(string = postcodes_original,
                       pattern = pattern_with_groups)
x

# how can we construct the postcode components?
outcode           = paste0(x[,2], x[,3])
#incode            = ...
#postcode_area     = ...
#postcode_district = ...
#postcode_sector   = ...
#unit_postcode     = ...




