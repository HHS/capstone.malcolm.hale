x <- c("ggmap", "rgdal", "rgeos", "maptools", "dplyr", "tidyr", "tmap")
install.packages(x) # warning: uncommenting this may take a number of minutes
lapply(x, library, character.only = TRUE) # load the required packages

install.packages("ggplot2")
install.packages("leaflet")
install.packages("ggmap")
install.packages("tidyverse")
install.packages("tmap")
install.packages("tmaptools")
install.packages("sf")

library("tmap")
library("tmaptools")
library("sf")
library("leaflet")
library(ggplot2)
library(ggmap)
library(leaflet)
library(tidyverse) 


setwd("C:/Users/malcolm.hale/Desktop/Learning/DATA_COLAB/capstone.malcolm.hale")

MapDataDir = "C:/Users/malcolm.hale/Desktop/Learning/DATA_COLAB/capstone.malcolm.hale/Data"

usshapefile = "C:/Users/malcolm.hale/Desktop/Learning/DATA_COLAB/capstone.malcolm.hale/Data/cb_2017_us_county_5m.shp"
usgeo <- read_shape("C:/Users/malcolm.hale/Desktop/Learning/DATA_COLAB/capstone.malcolm.hale/Data/cb_2017_us_county_5m.shp")

qtm(usgeo)
nhgeo <- usgeo[usgeo@data$STATEFP=="01",]
#nhgeo <- filter(usgeo, STATEFP=="33")
qtm(nhgeo)

nhpopup <- paste0("County: ", nhgeo$GEOID)
                
leaflet(nhgeo) %>%
  addProviderTiles("CartoDB.Positron") %>%
  addPolygons(stroke=FALSE, 
              smoothFactor = 0.2,
              fillOpacity = .8,
              popup=nhpopup)
              