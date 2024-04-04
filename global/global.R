# app packages
library(tidyverse)
library(randomForest)
library(sf)
library(rgdal)
library(shiny)
library(shinycssloaders)
library(shinycustomloader)
library(shinyWidgets)
library(formatR)
library(shinyjs)
library(magrittr)
library(rslates)
library(leaflet)
library(leaflet.extras)
library(dataRetrieval)

# app code inputs
#-----------------------------------------

## data processing and model imports
source('./models/sdam_models.R')
source('./models/model_inputs.R')

## additional information panel
source('./R/additionalinfo.R')
# source('./R/background.R')

## regional data entry panels
source('./panels/panels_aw.R')
source('./panels/panels_gp.R')
source('./panels/panels_pnw.R')
source('./panels/panels_wm.R')

## regional report panels
source('./report/report_aw.R')
source('./report/report_gp.R')
source('./report/report_pnw.R')
source('./report/report_wm.R')
# source('./report/report_params.R')

## spatial funtions
source('./spatial/region_check.R')
# source('./panels.R')
# source('./R/report.R')


# Load shapefile with regions
regions_leaflet <- read_sf("./spatial/regions_simp_noPRVI.shp")

  
point_region <- function(
  user_lat = 0,
  user_lon = 0
){
  df <- tibble(lat = user_lat,
               lon = user_lon)
  pnts_df <- sf::st_as_sf(df, coords = c("lon", "lat"), crs = 4326, remove = FALSE)
  pnts_join_df <- sf::st_join(pnts_df, regions_leaflet) 

  pnts_join_df
}
