rm(list = ls())
library(stringr)

# What is a valid postcode?

postcodes_amended = c("DL98 1A",
                      "TN290NA",
                      "SO21 1PN",	
                      "L31BB",
                      "gu31 4lh",
                      "CH45 4RT",
                      "RG 9DH",
                      "PL35 OAT",
                      "GU10 56EQ",
                      "SG13 9BD")
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

pattern = r"()"

postcodes_amended_valid = stringr::str_detect(string = postcodes_amended,
                                           pattern = pattern)
postcodes_original_valid = stringr::str_detect(string = postcodes_original,
                                            pattern = pattern)
df = data.frame(postcodes_amended, postcodes_amended_valid, postcodes_original, postcodes_original_valid)
print(df)


