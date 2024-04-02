# download handler for creating the exported PDF report

general_params <- list(
    # -------------------Classification
    stream_class = classification(),
    region = region_class()$region,
    precip = precip(),
    drain_area = input$user_DRNAREA,



    # -------------------General Site Information
    a = input$project,
    b = input$assessor,
    c = input$code,
    d = input$waterway,
    e = input$date,
    bm = case_when(input$radio_weather == 'heavyrain' ~ "Storm/heavy rain",
                    input$radio_weather == 'steadyrain' ~ "Steady rain",
                    input$radio_weather == 'intermittentrain' ~ "Intermittent rain",
                    input$radio_weather == 'snowing' ~ "Snowing",
                    input$radio_weather == 'cloudy' ~ "Cloudy",
                    input$radio_weather == 'clearsunny' ~ "Clear/Sunny"),


    j = input$weather,
    g = as.numeric(input$lat),
    h = as.numeric(input$lon),
    l = plyr::mapvalues(
        input$check_use,
        from = c(
        "urban","agricultural", "Developed open-space (e.g., golf course, parks, lawn grasses)",
        "forested","othernatural","other"),
        to = c(
        "Urban, industrial, or residential", "Agricultural","Developed open-space",
        "Forested","Other Natural","Other")
    ) %>% as.character() %>% paste0(collapse = ", "),
    f = input$boundary,
    fff = input$actreach,
    bn = plyr::mapvalues(
        input$radio_situation,
        from = c(
        "flood","stream_modifications", "diversions",
        "Water discharges","drought","vegetation",
        "other","none"),
        to = c(
        "Recent flood or debris flow","Stream modifications (e.g., channelization)","Diversions",
        "Water discharges","Drought","Vegetation removal/limitations",
        "Other (explain in notes)","None")
    ) %>% as.character() %>% paste0(collapse = ", "),
    k = input$situation,

    # ------------------- Site Photos
    v = fig4(),
    u = fig3(),
    t = fig2(),
    s = fig1(),

    # ------------------- Observed Hydrology
    m = input$surfflow,
    n = input$subflow,
    o = input$pool,
    r = input$notes_observed_hydrology,

    # ------------------- Site Sketch
    w = fig5(),

    # ------------------- Supplemental Information
    notes_supplemental_information = input$notes_supplemental_information,
    f24 = fig24(),
    f24_cap = input$add1_cap,
    f25 = fig25(),
    f25_cap = input$add2_cap,
    f26 = fig26(),
    f26_cap = input$add3_cap,
    f27 = fig27(),
    f27_cap = input$add4_cap
)

# combine the general parameters and region specific parameters for markdown; knits the report document for download
generate_report <- function(region){
    if (region == 'Arid West'){
        export <- downloadHandler(
                filename = glue::glue("SDAM Report ({format(Sys.time(), '%B %d, %Y')}).pdf"),
                content = function(file) {
                  
                    ### Report----
                    tryCatch({
        
                        showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                        tempReport <- file.path("markdown/report.Rmd")
                        file.copy("report.Rmd", tempReport, overwrite = TRUE)
        
                        # Set up parameters to pass to Rmd document
                        region_params <- list(
                          
                            # ------------------- Biological indicators
                            # EPT Taxa----
                            aqua_inv = input$user_TotalAbundance,
                            bmi_value = bmi_score(),
                            f6 = fig6(),
                            f6_cap = input$inv1_cap,
                            f7 = fig7(),
                            f7_cap = input$inv2_cap,
                            f8 = fig8(),
                            f8_cap = input$inv3_cap,
                            f6_1 = fig6_1(),
                            f6_1cap = input$inv4_cap,
                            f7_1 = fig7_1(),
                            f7_1cap = input$inv5_cap,
                            f8_1 = fig8_1(),
                            f8_cap = input$inv6_cap,
                            notes_aquainv = input$notes_totalAbundance,
                            

            
            
                            # Richness----
                            richness = input$user_richness,
                            
                            # drain area----
                            drain_value = da_score(),
                            notes_da = input$notes_drainage,
                            f9 = fig9(),
                            f9_cap = input$da1_cap,
                            f10 = fig10(),
                            f10_cap = input$da2_cap,

                            # Upland Rooted----
                            upland_rooted = input$user_UplandRootedPlants,
                            # upland_checkbox = input$upland_checkbox,
                            notes_rooted = input$notes_rooted,
                            f15 = fig15(),
                            f15_cap = input$veg1_cap,
                            f16 = fig16(),
                            f16_cap = input$veg2_cap,
                            f17 = fig17(),
                            f17_cap = input$veg3_cap,
            
                            # Bank Width----
                            bankwidth = bank_mean(),
            
                            # Percent Shade----
                            shade = densi_shade_perc(),
            
            
                            # Natural Valley----
                            nv = case_when(input$user_NaturalValley_score == '0' ~ "0 (Absent)",
                                            input$user_NaturalValley_score == '0.25' ~ "0.25",
                                            input$user_NaturalValley_score == '0.5' ~ "0.5 (Weak)",
                                            input$user_NaturalValley_score == '0.75' ~ "0.75",
                                            input$user_NaturalValley_score == '1.0' ~ "1 (Moderate)",
                                            input$user_NaturalValley_score == '1.25' ~ "1.25",
                                            input$user_NaturalValley_score == '1.5' ~ "1.5 (Strong)"
                            ),
                            notes_nv = input$notes_nv,
                            val_length = input$valley_length,
                            f18 = fig18(),
                            f18_cap = input$nv1_cap,
                            f19 = fig19(),
                            f19_cap = input$nv2_cap,
                            f20 = fig20(),
                            f20_cap = input$nv3_cap,
            
                            # Slope----
                            slope = input$user_Slope,
                            notes_slope = input$notes_slope,
                            bank2x = input$bankfull_2x,
                            fpw = input$floodprone,
                            entrenchment = input$entrench,
                            f21 = fig21(),
                            f21_cap = input$slope1_cap,
                            f22 = fig22(),
                            f22_cap = input$slope2_cap,
                            f23 = fig23(),
                            f23_cap = input$slope3_cap,

                        )

                        params <- c(general_params, region_params)
        
                        # Knit the document, passing in the `params` list, and eval it in a
                        # child of the global environment (this isolates the code in the document
                        # from the code in this app).
                        rmarkdown::render(
                        tempReport,
                        output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
                        )
                        removeModal()
                    },
                    warning = function(cond){
                        showModal(
                        modalDialog(
                            "There was an error while generating the report.
                        Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                            footer = modalButton("Ok")
                        )
                        )
                        return(NULL)
                    })
                } 
                
            )

    } else if (region == 'East'){
        # reserved for future final East SDAM

    } else if (region == 'Great Plains'){

         export <- downloadHandler(
                filename = glue::glue("SDAM Report ({format(Sys.time(), '%B %d, %Y')}).pdf"),
                content = function(file) {
                  
                    ### Report----
                    tryCatch({
        
                        showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                        tempReport <- file.path("markdown/report.Rmd")
                        file.copy("report.Rmd", tempReport, overwrite = TRUE)
        
                        # Set up parameters to pass to Rmd document
                        region_params <- list(
                          
                            # ------------------- Biological indicators
                            # EPT Taxa----
                            aqua_inv = input$user_TotalAbundance,
                            bmi_value = bmi_score(),
                            f6 = fig6(),
                            f6_cap = input$inv1_cap,
                            f7 = fig7(),
                            f7_cap = input$inv2_cap,
                            f8 = fig8(),
                            f8_cap = input$inv3_cap,
                            f6_1 = fig6_1(),
                            f6_1cap = input$inv4_cap,
                            f7_1 = fig7_1(),
                            f7_1cap = input$inv5_cap,
                            f8_1 = fig8_1(),
                            f8_cap = input$inv6_cap,
                            notes_aquainv = input$notes_totalAbundance,
                            

            
            
                            # Richness----
                            richness = input$user_richness,
                            
                            # drain area----
                            drain_value = da_score(),
                            notes_da = input$notes_drainage,
                            f9 = fig9(),
                            f9_cap = input$da1_cap,
                            f10 = fig10(),
                            f10_cap = input$da2_cap,

                            # Upland Rooted----
                            upland_rooted = input$user_UplandRootedPlants,
                            # upland_checkbox = input$upland_checkbox,
                            notes_rooted = input$notes_rooted,
                            f15 = fig15(),
                            f15_cap = input$veg1_cap,
                            f16 = fig16(),
                            f16_cap = input$veg2_cap,
                            f17 = fig17(),
                            f17_cap = input$veg3_cap,
            
                            # Bank Width----
                            bankwidth = bank_mean(),
            
                            # Percent Shade----
                            shade = densi_shade_perc(),
            
            
                            # Natural Valley----
                            nv = case_when(input$user_NaturalValley_score == '0' ~ "0 (Absent)",
                                            input$user_NaturalValley_score == '0.25' ~ "0.25",
                                            input$user_NaturalValley_score == '0.5' ~ "0.5 (Weak)",
                                            input$user_NaturalValley_score == '0.75' ~ "0.75",
                                            input$user_NaturalValley_score == '1.0' ~ "1 (Moderate)",
                                            input$user_NaturalValley_score == '1.25' ~ "1.25",
                                            input$user_NaturalValley_score == '1.5' ~ "1.5 (Strong)"
                            ),
                            notes_nv = input$notes_nv,
                            val_length = input$valley_length,
                            f18 = fig18(),
                            f18_cap = input$nv1_cap,
                            f19 = fig19(),
                            f19_cap = input$nv2_cap,
                            f20 = fig20(),
                            f20_cap = input$nv3_cap,
            
                            # Slope----
                            slope = input$user_Slope,
                            notes_slope = input$notes_slope,
                            bank2x = input$bankfull_2x,
                            fpw = input$floodprone,
                            entrenchment = input$entrench,
                            f21 = fig21(),
                            f21_cap = input$slope1_cap,
                            f22 = fig22(),
                            f22_cap = input$slope2_cap,
                            f23 = fig23(),
                            f23_cap = input$slope3_cap,

                        )

                        params <- c(general_params, region_params)
        
                        # Knit the document, passing in the `params` list, and eval it in a
                        # child of the global environment (this isolates the code in the document
                        # from the code in this app).
                        rmarkdown::render(
                        tempReport,
                        output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
                        )
                        removeModal()
                    },
                    warning = function(cond){
                        showModal(
                        modalDialog(
                            "There was an error while generating the report.
                        Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                            footer = modalButton("Ok")
                        )
                        )
                        return(NULL)
                    })
                } 
                
            )


    } else if (region == 'Pacific Northwest'){

         export <- downloadHandler(
                filename = glue::glue("SDAM Report ({format(Sys.time(), '%B %d, %Y')}).pdf"),
                content = function(file) {
                  
                    ### Report----
                    tryCatch({
        
                        showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                        tempReport <- file.path("markdown/report.Rmd")
                        file.copy("report.Rmd", tempReport, overwrite = TRUE)
        
                        # Set up parameters to pass to Rmd document
                        region_params <- list(
                          
                            # ------------------- Biological indicators
                            # EPT Taxa----
                            aqua_inv = input$user_TotalAbundance,
                            bmi_value = bmi_score(),
                            f6 = fig6(),
                            f6_cap = input$inv1_cap,
                            f7 = fig7(),
                            f7_cap = input$inv2_cap,
                            f8 = fig8(),
                            f8_cap = input$inv3_cap,
                            f6_1 = fig6_1(),
                            f6_1cap = input$inv4_cap,
                            f7_1 = fig7_1(),
                            f7_1cap = input$inv5_cap,
                            f8_1 = fig8_1(),
                            f8_cap = input$inv6_cap,
                            notes_aquainv = input$notes_totalAbundance,
                            

            
            
                            # Richness----
                            richness = input$user_richness,
                            
                            # drain area----
                            drain_value = da_score(),
                            notes_da = input$notes_drainage,
                            f9 = fig9(),
                            f9_cap = input$da1_cap,
                            f10 = fig10(),
                            f10_cap = input$da2_cap,

                            # Upland Rooted----
                            upland_rooted = input$user_UplandRootedPlants,
                            # upland_checkbox = input$upland_checkbox,
                            notes_rooted = input$notes_rooted,
                            f15 = fig15(),
                            f15_cap = input$veg1_cap,
                            f16 = fig16(),
                            f16_cap = input$veg2_cap,
                            f17 = fig17(),
                            f17_cap = input$veg3_cap,
            
                            # Bank Width----
                            bankwidth = bank_mean(),
            
                            # Percent Shade----
                            shade = densi_shade_perc(),
            
            
                            # Natural Valley----
                            nv = case_when(input$user_NaturalValley_score == '0' ~ "0 (Absent)",
                                            input$user_NaturalValley_score == '0.25' ~ "0.25",
                                            input$user_NaturalValley_score == '0.5' ~ "0.5 (Weak)",
                                            input$user_NaturalValley_score == '0.75' ~ "0.75",
                                            input$user_NaturalValley_score == '1.0' ~ "1 (Moderate)",
                                            input$user_NaturalValley_score == '1.25' ~ "1.25",
                                            input$user_NaturalValley_score == '1.5' ~ "1.5 (Strong)"
                            ),
                            notes_nv = input$notes_nv,
                            val_length = input$valley_length,
                            f18 = fig18(),
                            f18_cap = input$nv1_cap,
                            f19 = fig19(),
                            f19_cap = input$nv2_cap,
                            f20 = fig20(),
                            f20_cap = input$nv3_cap,
            
                            # Slope----
                            slope = input$user_Slope,
                            notes_slope = input$notes_slope,
                            bank2x = input$bankfull_2x,
                            fpw = input$floodprone,
                            entrenchment = input$entrench,
                            f21 = fig21(),
                            f21_cap = input$slope1_cap,
                            f22 = fig22(),
                            f22_cap = input$slope2_cap,
                            f23 = fig23(),
                            f23_cap = input$slope3_cap,

                        )

                        params <- c(general_params, region_params)
        
                        # Knit the document, passing in the `params` list, and eval it in a
                        # child of the global environment (this isolates the code in the document
                        # from the code in this app).
                        rmarkdown::render(
                        tempReport,
                        output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
                        )
                        removeModal()
                    },
                    warning = function(cond){
                        showModal(
                        modalDialog(
                            "There was an error while generating the report.
                        Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                            footer = modalButton("Ok")
                        )
                        )
                        return(NULL)
                    })
                } 
                
            )

    } else if (region == 'Western Mountains'){

         export <- downloadHandler(
                filename = glue::glue("SDAM Report ({format(Sys.time(), '%B %d, %Y')}).pdf"),
                content = function(file) {
                  
                    ### Report----
                    tryCatch({
        
                        showModal(modalDialog("Please wait while the report is being generated.....", footer=NULL))
                        tempReport <- file.path("markdown/report.Rmd")
                        file.copy("report.Rmd", tempReport, overwrite = TRUE)
        
                        # Set up parameters to pass to Rmd document
                        region_params <- list(
                          
                            # ------------------- Biological indicators
                            # EPT Taxa----
                            aqua_inv = input$user_TotalAbundance,
                            bmi_value = bmi_score(),
                            f6 = fig6(),
                            f6_cap = input$inv1_cap,
                            f7 = fig7(),
                            f7_cap = input$inv2_cap,
                            f8 = fig8(),
                            f8_cap = input$inv3_cap,
                            f6_1 = fig6_1(),
                            f6_1cap = input$inv4_cap,
                            f7_1 = fig7_1(),
                            f7_1cap = input$inv5_cap,
                            f8_1 = fig8_1(),
                            f8_cap = input$inv6_cap,
                            notes_aquainv = input$notes_totalAbundance,
                            

            
            
                            # Richness----
                            richness = input$user_richness,
                            
                            # drain area----
                            drain_value = da_score(),
                            notes_da = input$notes_drainage,
                            f9 = fig9(),
                            f9_cap = input$da1_cap,
                            f10 = fig10(),
                            f10_cap = input$da2_cap,

                            # Upland Rooted----
                            upland_rooted = input$user_UplandRootedPlants,
                            # upland_checkbox = input$upland_checkbox,
                            notes_rooted = input$notes_rooted,
                            f15 = fig15(),
                            f15_cap = input$veg1_cap,
                            f16 = fig16(),
                            f16_cap = input$veg2_cap,
                            f17 = fig17(),
                            f17_cap = input$veg3_cap,
            
                            # Bank Width----
                            bankwidth = bank_mean(),
            
                            # Percent Shade----
                            shade = densi_shade_perc(),
            
            
                            # Natural Valley----
                            nv = case_when(input$user_NaturalValley_score == '0' ~ "0 (Absent)",
                                            input$user_NaturalValley_score == '0.25' ~ "0.25",
                                            input$user_NaturalValley_score == '0.5' ~ "0.5 (Weak)",
                                            input$user_NaturalValley_score == '0.75' ~ "0.75",
                                            input$user_NaturalValley_score == '1.0' ~ "1 (Moderate)",
                                            input$user_NaturalValley_score == '1.25' ~ "1.25",
                                            input$user_NaturalValley_score == '1.5' ~ "1.5 (Strong)"
                            ),
                            notes_nv = input$notes_nv,
                            val_length = input$valley_length,
                            f18 = fig18(),
                            f18_cap = input$nv1_cap,
                            f19 = fig19(),
                            f19_cap = input$nv2_cap,
                            f20 = fig20(),
                            f20_cap = input$nv3_cap,
            
                            # Slope----
                            slope = input$user_Slope,
                            notes_slope = input$notes_slope,
                            bank2x = input$bankfull_2x,
                            fpw = input$floodprone,
                            entrenchment = input$entrench,
                            f21 = fig21(),
                            f21_cap = input$slope1_cap,
                            f22 = fig22(),
                            f22_cap = input$slope2_cap,
                            f23 = fig23(),
                            f23_cap = input$slope3_cap,

                        )

                        params <- c(general_params, region_params)
        
                        # Knit the document, passing in the `params` list, and eval it in a
                        # child of the global environment (this isolates the code in the document
                        # from the code in this app).
                        rmarkdown::render(
                        tempReport,
                        output_file = file,
                        params = params,
                        envir = new.env(parent = globalenv())
                        )
                        removeModal()
                    },
                    warning = function(cond){
                        showModal(
                        modalDialog(
                            "There was an error while generating the report.
                        Please contact Will Saulnier (wsaulnier@eprusa.net) for more details.",
                            footer = modalButton("Ok")
                        )
                        )
                        return(NULL)
                    })
                } 
                
            )

    }

    export


}