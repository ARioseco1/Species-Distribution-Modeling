#GBIF.r 
#query species occurrences data from GBIF
#clean up the data
#save it to a .csv file
#create a map to display the species occurrence points

#List of packages to install
packages=c("tidyverse", "rgbif", "usethis", "CoordinateCleaner", "leaflet", "mapview")

#install packages not yet installed
installed_packages=packages %in% rownames(installed.packages())
if(any(installed_packages==FALSE)){
  install.packages(packages[!installed_packages])
}

#packages loading, with library function
invisible(lapply(packages, library, character.only=TRUE))

usethis::edit_r_environ()


spiderBackbone=name_backbone(name="Habronattus americanus")
speciesKey=spiderBackbone$usageKey

occ_download(pred("taxonKey", speciesKey), format="SIMPLE_CSV")

#<<gbif download>>
#Your download is being processed by GBIF:
 # https://www.gbif.org/occurrence/download/0012221-240202131308920
#Most downloads finish within 15 min.
#Check status with
#occ_download_wait('0012221-240202131308920')
#After it finishes, use
#d <- occ_download_get('0012221-240202131308920') %>%
 # occ_download_import()
#to retrieve your download.
#Download Info:
 # Username: arioseco
#E-mail: antoniok.rioseco@gmail.com
#Format: SIMPLE_CSV
#Download key: 0012221-240202131308920
#Created: 2024-02-13T20:19:03.601+00:00
#Citation Info:  
#  Please always cite the download DOI when using this data.
#https://www.gbif.org/citation-guidelines
#DOI: 10.15468/dl.s8e74h
#Citation:
 # GBIF Occurrence Download https://doi.org/10.15468/dl.s8e74h Accessed from R via rgbif (https://github.com/ropensci/rgbif) on 2024-02-13

d <- occ_download_get('0012221-240202131308920', paths="data/") %>%
   occ_download_import()

write_csv(d, "data/rawData.csv")
