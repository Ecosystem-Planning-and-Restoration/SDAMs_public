library(tidyverse)
# library(prism)
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


# Load shapefile with regions
regions_shp <- read_sf("./spatial/simplified_regions.shp")

# Run the pretrained random forest model based on region; returns the stream classification
run_sdam <- function(
        df = NA,
        var_input_reg = NA
        ){
                if (var_input_reg == 'No Region'){
                        pnts_df <- sf::st_as_sf(df, 
                                coords = c("lon", "lat"), 
                                crs = 4326, 
                                remove = FALSE)
                        pnts_join_df <- sf::st_join(pnts_df, regions_shp) %>%
                                rename(Strata_UNC = region)

                        if (is.na(pnts_join_df$Strata_UNC)){
                                spatial_msg <- paste0(
                                "<h5>",
                                "<p>The location of your site is outside of the SDAM Study areas.<p><br>",
                                "<p>Please check your latitude and longitude coordinates to ensure they are entered correctly.<p><br>"
                                )
                                print(spatial_msg)

                        } else if (pnts_join_df$Strata_UNC == 'East'){
                                show_alert(
                                        title = "Location Error!",
                                        text = tagList(
                                        tags$p(HTML(paste0("This site is located in the East Beta SDAM study area.",
                                                                "Please visit the <a href=\"https://ecosystemplanningrestoration.shinyapps.io/beta_sdam_nese\">East Beta SDAM application</a>  for the Northeast and Southeast."
                                                        ))
                                        )
                                        ),
                                        type = "error"
                                )

                        } else if (pnts_join_df$Strata_UNC == 'Great Plains'){
                                RF <- readRDS("RF_NoGIS_Unstrat_4.rds")
                                ClassProbs <- predict(RF, newdata = df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                                output_df <- bind_cols(pnts_join_df, ClassProbs) %>%
                                        mutate(ALI = I + P,
                                                Class = case_when(P>=.5~"perennial",
                                                                I>=.5~"intermittent",
                                                                E>=0.5~"ephemeral",
                                                                P>E ~ "at least intermittent",
                                                                E>P ~ "less than perennial",
                                                                P==E & I>P ~ "Need more information",
                                                                P==E & I<=P ~ "Need more information",
                                                                T~"Other")
                                        )
                                paste0("This reach is classified as ", output_df$Class)

                        } else if (pnts_join_df$Strata_UNC == 'Western Mountains'){
                                load("NotForGit/Step5/all_refined_rf_mods.Rdata")
                                RF <- all_refined_rf_mods[[3]]
                                ClassProbs <- predict(RF, newdata = pnts_join_df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                                output_df <- bind_cols(df, ClassProbs) %>%
                                        mutate(ALI = I + P,
                                                Class = case_when(P>=.5~"perennial",
                                                                I>=.5~"intermittent",
                                                                E>=0.5~"ephemeral",
                                                                P>E ~ "at least intermittent",
                                                                E>P ~ "less than perennial",
                                                                P==E & I>P ~ "Need more information",
                                                                P==E & I<=P ~ "Need more information",
                                                                T~"Other")
                                        )
                                paste0("This reach is classified as ", output_df$Class)

                        } else if (pnts_join_df$Strata_UNC == 'Arid West'){
                                load("NotForGit/Step5/all_refined_rf_mods.Rdata")
                                RF <- all_refined_rf_mods[[1]]
                                ClassProbs <- predict(RF, newdata = df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                                output_df <- bind_cols(pnts_join_df, ClassProbs) %>%
                                        mutate(ALI = I + P,
                                                Class = case_when(P>=.5~"perennial",
                                                                I>=.5~"intermittent",
                                                                E>=0.5~"ephemeral",
                                                                P>E ~ "at least intermittent",
                                                                E>P ~ "less than perennial",
                                                                P==E & I>P ~ "Need more information",
                                                                P==E & I<=P ~ "Need more information",
                                                                T~"Other")
                                        )
                                paste0("This reach is classified as ", output_df$Class)

                        } else if (pnts_join_df$Strata_UNC == 'Pacific Northwest'){
                        
                                if (df$aqua_presence == 'Yes'){
                                        if (df$ephemeroptera == 'Yes'){
                                                if (df$peren_taxa == 'Yes'){
                                                                df$Class = 'perennial'
                                                } else if (df$peren_taxa == 'No'){
                                                                if (df$slope < 16){
                                                                        df$Class = 'intermittent'
                                                                } else if (df$slope >= 16){
                                                                        df$Class = 'perennial'
                                                                }
                                                } 

                                        } else if (df$ephemeroptera == 'No'){
                                                df$Class = 'intermittent'
                                        }
                                } else if (df$aqua_presence == 'No'){
                                        if (df$plants == 'Yes'){
                                                if (df$slope < 10.5){
                                                        df$Class = 'intermittent'
                                                } else if (df$slope >= 10.5){
                                                        df$Class = 'ephemeral'
                                                }
                                        } else if (df$plants == 'No'){
                                                df$Class = 'ephemeral'
                                        }
                                }

                                if (df$Class == 'ephemeral'){
                                        if (df$fish == 'Yes'){
                                                df$Class == 'at least intermittent'
                                        } else if (df$amphibians == 'Yes'){
                                                df$Class == 'at least intermittent'
                                        }
                                }

                                paste0("This reach is classified as ", df$Class)
                        }

                } else if (var_input_reg == 'East'){
                        show_alert(
                                title = "Location Error!",
                                text = tagList(
                                        tags$p(HTML(paste0("This site is located in the East Beta SDAM study area.",
                                                        "Please visit the <a href=\"https://github.com/WSaulnier/beta_sdam_nese\">East Beta SDAM application</a>  for the Northeast and Southeast."
                                                        ))
                                        )
                                ),
                                type = "error"
                                )

                } else if (var_input_reg == 'Great Plains'){
                        RF <- readRDS("./models/rf_models/RF_NoGIS_Unstrat_4.rds")
                        ClassProbs <- predict(RF, newdata = df, type="prob") 
                                # assign appropriate class based on probabilities
                        output_df <- bind_cols(df, ClassProbs) %>%
                                mutate(ALI = I + P,
                                        Class = case_when(P>=.5~"perennial",
                                                        I>=.5~"intermittent",
                                                        E>=0.5~"ephemeral",
                                                        P>E ~ "at least intermittent",
                                                        E>P ~ "less than perennial",
                                                        P==E & I>P ~ "Need more information",
                                                        P==E & I<=P ~ "Need more information",
                                                        T~"Other")
                                )
                        paste0("This reach is classified as ", output_df$Class)

                } else if (var_input_reg == 'Western Mountains'){
                        load("./models/rf_models/all_refined_rf_mods.Rdata")
                        RF <- all_refined_rf_mods[[3]]
                        ClassProbs <- predict(RF, newdata = df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                        output_df <- bind_cols(df, ClassProbs) %>%
                                mutate(ALI = I + P,
                                        Class = case_when(P>=.5~"perennial",
                                                        I>=.5~"intermittent",
                                                        E>=0.5~"ephemeral",
                                                        P>E ~ "at least intermittent",
                                                        E>P ~ "less than perennial",
                                                        P==E & I>P ~ "Need more information",
                                                        P==E & I<=P ~ "Need more information",
                                                        T~"Other")
                                )
                        paste0("This reach is classified as ", output_df$Class)

                } else if (var_input_reg == 'Arid West'){
                        load("./models/rf_models/all_refined_rf_mods.Rdata")
                        RF <- all_refined_rf_mods[[1]]
                        ClassProbs <- predict(RF, newdata = df, type="prob") %>% as.data.frame()
                                # assign appropriate class based on probabilities
                        output_df <- bind_cols(df, ClassProbs) %>%
                                mutate(ALI = I + P,
                                        Class = case_when(P>=.5~"perennial",
                                                        I>=.5~"intermittent",
                                                        E>=0.5~"ephemeral",
                                                        P>E ~ "at least intermittent",
                                                        E>P ~ "less than perennial",
                                                        P==E & I>P ~ "Need more information",
                                                        P==E & I<=P ~ "Need more information",
                                                        T~"Other")
                                )
                        paste0("This reach is classified as ", output_df$Class)

                } else if (var_input_reg == 'Pacific Northwest'){

                        if (df$aqua_presence == 'Yes'){
                                if (df$ephemeroptera == 'Yes'){
                                        if (df$peren_taxa == 'Yes'){
                                                df$Class = 'perennial'
                                        } else if (df$peren_taxa == 'No'){
                                                if (df$slope < 16){
                                                        df$Class = 'intermittent'
                                                } else if (df$slope >= 16){
                                                        df$Class = 'perennial'
                                                }
                                        } 

                                } else if (df$ephemeroptera == 'No'){
                                        df$Class = 'intermittent'
                                }

                        } else if (df$aqua_presence == 'No'){
                                if (df$plants == 'Yes'){
                                        if (df$slope < 10.5){
                                                df$Class = 'intermittent'
                                        } else if (df$slope >= 10.5){
                                                df$Class = 'ephemeral'
                                        }
                                } else if (df$plants == 'No'){
                                        df$Class = 'ephemeral'
                                }
                        }

                        if (df$Class == 'ephemeral'){
                                print('checking fish')
                                if (df$fish == 'Yes'){
                                        df$Class = 'at least intermittent'
                                } else if (df$amphibians == 'Yes'){
                                        df$Class = 'at least intermittent'
                                }
                        }


                        paste0("This reach is classified as ", df$Class)
                        
        }
}




point_region <- function(
        user_lat = 0,
        user_lon = 0
){
        df <- tibble(lat = user_lat,
                     lon = user_lon)
        # check to see if user supplied lat/long is in Great Plains regions
        pnts_df <- sf::st_as_sf(df, coords = c("lon", "lat"), crs = 4326, remove = FALSE)
        pnts_join_df <- sf::st_join(pnts_df, regions_shp) 
        # if (is.na(pnts_join_df$region)){
        #         spatial_msg <- paste0(
        #                 "<h5>",
        #                 "<p>The location of your site is outside of the SDAM study areas.<p><br>",
        #                 "<p>Please check your latitude and longitude coordinates to ensure they are entered correctly.<p><br>"
        #         )
        #         print(spatial_msg)
        # } else {
        # 
        #         pnts_join_df
        # }
        pnts_join_df
        
}




        
        


        
        