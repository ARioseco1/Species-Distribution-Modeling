data=read.csv("data/cleandata.csv")

library(leaflet)
library(mapview)

map = leaflet() %>%
  addProviderTiles("Esri.WorldTopoMap") %>%
  addCircleMarkers(data=data, 
                   lat= ~decimalLatitude,
                   lng= ~decimalLongitude, 
                   radius = 3, 
                   color= "hotpink") %>%
  addLegend(position = "topright",
            title= "species occurence from gbif", 
            labels ="habronaticus americanus", 
            colors = "hotpink")
    
          
  #save the map

mapshot2(map, file = "output/leaflettest.png")
