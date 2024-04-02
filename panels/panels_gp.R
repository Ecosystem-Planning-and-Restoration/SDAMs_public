
# panels containing model features for northeast and southeast regions

gp_panel <- function(){
  fluidRow(
    column(1),
    column(
      7,
      h2(HTML('<b><u>Great Plains SDAM</u></b>')),
      h3(HTML("Step 2: Enter required indicator data")),
      
      ## biological indicators----
      h4(HTML("<b><u>Biological Metrics</u></b>")),
      fluidRow(
        column(
          4,
          numericInput("user_total_abundance", label = NULL, value = 0, min = 0, max = 100, step = 1)
        ),
        column(
          4,
          h6("Total abundance of aquatic benthic macroinvertebrates.")
        )
      ),
      
      fluidRow(
        column(
          4,
          numericInput("user_hydrophyte", label = NULL, value = 0, min = 0, step = 1)
        ),
        column(
          4,
          h6("Number of hydrophytic plant species not having an odd distribution pattern (e.g., <2% of assessment area) from the assessment.")
        )
      ),
      
      
      fluidRow(
        column(
          4,
          numericInput("user_eph_isa", label = NULL, value = 0, min = 0, step = 1)
        ),
        column(
          4,
          h6("Total abundance of Indicator Species Analysis-based ephemeral
             indicator taxa observed in the reach.")
        )
      ),
      
      fluidRow(
        column(
          12,
          radioButtons(
            "user_upland_rooted", 
            HTML("<b><i>Absence of upland rooted plants in the streambed</b></i><br>
                 Note, upland plants include FAC species for the purposes of this method and a higher score is given for the absence of rooted upland plants."),
            # HTML("Note, upland plants include FAC species for the purposes of this method and a higher score is given for the absence of rooted upland plants."),
            c(
              "0" = 0,
              "0.5" = 0.5,
              "1" = 1,
              "1.5" = 1.5,
              "2" = 2,
              "2.5" = 2.5,
              "3" = 3
            ),
            inline = T
          )
        )
      ),
      
      fluidRow(
        column(
          12,
          radioButtons(
            "user_diff_veg", 
            HTML("<b><i>Differences in vegetation score.</b></i>"),
            # HTML("Note, upland plants include FAC species for the purposes of this method and a higher score is given for the absence of rooted upland plants."),
            c(
              "0" = 0,
              "0.5" = 0.5,
              "1" = 1,
              "1.5" = 1.5,
              "2" = 2,
              "2.5" = 2.5,
              "3" = 3
            ),
            inline = T
          )
        )
      ),
      
      fluidRow(
        column(
          12,
          radioButtons(
            "user_sediment_plants", 
            HTML("<b><i>Presence of sediment on plants.</b></i>"),
            # HTML("Note, upland plants include FAC species for the purposes of this method and a higher score is given for the absence of rooted upland plants."),
            c(
              "0" = 0,
              "0.25" = 0.25,
              "0.5" = 0.5,
              "0.75" = 0.75,
              "1" = 1,
              "1.25" = 1.25,
              "1.5" = 1.5
            ),
            inline = T
          )
        )
      ),

      ## geomorphic Metrics----
      
      h4(HTML("<b><u>Geomorphic Metrics</u></b>")),
      
      fluidRow(
        column(
          12,
          radioButtons(
            "user_substrate", 
            HTML("<b><i>Substrate sorting score.</b></i>"),
            c(
              "0" = 0,
              "0.25" = 0.25,
              "0.5" = 0.5,
              "0.75" = 0.75,
              "1" = 1,
              "1.25" = 1.25,
              "1.5" = 1.5
            ),
            inline = T
          )
        )
      ),
      
      fluidRow(
        column(
          12,
          radioButtons(
            "user_riff_pool", 
            HTML("<b><i>Riffle pool sequence score.</b></i>"),
            # HTML("Note, upland plants include FAC species for the purposes of this method and a higher score is given for the absence of rooted upland plants."),
            c(
              "0" = 0,
              "0.5" = 0.5,
              "1" = 1,
              "1.5" = 1.5,
              "2" = 2,
              "2.5" = 2.5,
              "3" = 3
            ),
            inline = T
          )
        )
      ),
      
    
      fluidRow(
        HTML('<hr style="color: black; height: 1px; background-color: black;">'),
        column(width = 12,
               numericInputIcon("select_bank",
                                HTML("Enter the Number of Bankfull Measurements (m) <br>(min. 1, max. 3)"),
                                width = "325px",
                                min = 1,
                                max = 3,
                                value = 3,
                                step = 1,
                                icon = icon("hashtag"))
        )
      ),
      fluidRow(
        column(
          width = 6,
          uiOutput("bankUI")
        ),
        column(
          width = 6,
          uiOutput(outputId = "bank_text") %>%
            tagAppendAttributes(class = 'border-my-text')
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

