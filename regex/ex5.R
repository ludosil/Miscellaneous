rm(list = ls())
library(stringr)

numbers = readLines("numbers.txt")


stringr::str_detect(string = numbers,
                    pattern = "07[0-9]{9}")

stringr::str_extract(string = numbers,
                    pattern = "07[0-9]{9}")

stringr::str_extract_all(string = numbers,
                     pattern = "07[0-9]{9}")

stringr::str_match(string = numbers,
                     pattern = "07([0-9]{3})([0-9]{3})([0-9]{3})")

stringr::str_match_all(string = numbers,
                   pattern = "07([0-9]{3})([0-9]{3})([0-9]{3})")

stringr::str_match_all(string = numbers,
                       pattern = "07([0-9]{3}){3}")
