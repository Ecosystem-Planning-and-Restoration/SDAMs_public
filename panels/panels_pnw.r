
# panels containing model features for Pacific Northwest

pnw_panel <- function(){
    fluidRow(
        column(1),
        column(
            7,
            h2(HTML('<b><u>Pacific Northwest SDAM</u></b>')),
            h3(HTML("Step 2: Enter required indicator data")),
            
            ##  indicators----
            h4(HTML("<b><u>Indicators</u></b>")),
            
            fluidRow(
                column(
                    12,
                    radioButtons(
                        "user_aquatic_presence", 
                        HTML("<b><i>Are aquatic macroinvertebrates present?</b></i>"),
                        c(
                            "Yes" = "Yes",
                            "No" = "No"
                        ),
                        inline = T
                    )
                )
            ),

            fluidRow(
                column(
                    12,
                    radioButtons(
                        "user_ephemeroptera", 
                        HTML("<b><i>Are 6 or more individuals of the Order Ephemeroptera present?</b></i>"),
                        c(
                            "Yes" = "Yes",
                            "No" = "No"
                        ),
                        inline = T
                    )
                )
            ),

            fluidRow(
                column(
                    12,
                    radioButtons(
                        "user_per_taxa", 
                        HTML("<b><i>Are perennial indicator taxa present?</b></i>"),
                        c(
                            "Yes" = "Yes",
                            "No" = "No"
                        ),
                        inline = T
                    )
                )
            ),

            fluidRow(
                column(
                    12,
                    radioButtons(
                        "user_plants", 
                        HTML("<b><i>Are FACW, OBL, or SAV plants present? (Within ½ channel width)</b></i>"),
                        c(
                            "Yes" = "Yes",
                            "No" = "No"
                        ),
                        inline = T
                    )
                )
            ),
            
            fluidRow(
                column(
                    12,
                    numericInputIcon("user_slope",
                                     "Enter the percent slope to the nearest 1/2 percent.",
                                     min = 0,
                                     max = 500,
                                     value = 3,
                                     step = 0.01,
                                     icon = icon("hashtag"))
                )
            ),

            h4(HTML("<b><u>Single Indicators</u></b>")),

            fluidRow(
                column(
                    12,
                    radioButtons(
                        "user_fish", 
                        HTML("<b><i>Are fish present?</b></i>"),
                        c(
                            "Yes" = "Yes",
                            "No" = "No"
                        ),
                        inline = T
                    )
                )
            ),

            fluidRow(
                column(
                    12,
                    radioButtons(
                        "user_amphibians", 
                        HTML("<b><i>Are amphibians present?</b></i>"),
                        c(
                            "Yes" = "Yes",
                            "No" = "No"
                        ),
                        inline = T
                    )
                )
            ),

            fluidRow(
                
                HTML('<hr style="color: black; height: 3px; background-color: black;">'),
                tags$head(
                    tags$style(HTML('#runmodel {background-color:#94d9f2;
                                                                padding: 8px;
                                                                font-size: 110%;
                                                                font-weight: bold;
                                                                border-style: outset;
                                                                
                                                                box-shadow: 0 8px 12px 0 rgba(0,0,0,0.24), 0 1px 1px 0 rgba(0,0,0,0.19);
                                                                transition-duration: 0.1s;
                                                                }',
                                    '#runmodel:hover {
                                                                background-color:#5d8b9c;
                                                                color: black;
                                                                border-style: solid;
                                                                border-color: black;
                                                                border-width: px;
                                                                
                                                                }'))
                ),
                column(
                    6,
                    actionButton("runmodel", div("Run Model", icon('long-arrow-right')))
                ),
                column(
                    6,
                    conditionalPanel(
                        condition = "input.runmodel != 0",
                        uiOutput("class_out") %>%
                            tagAppendAttributes(class = 'border-my-class')
                    )
                ),
            ),
            fluidRow(
                column(
                    12,
                    br(), br(), br(), br(), br(), br()
                    
                )
            )
        )
    )
}

