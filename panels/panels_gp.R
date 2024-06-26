
# panels containing model features for northeast and southeast regions

gp_panel <- function(){
  fluidRow(
    column(1),
    column(
      10,
      HTML(
        '<h3 style="margin-top:5px; margin-bottom:-5px">
          <span class="badge badge-primary" 
            style="font-size:1.3rem;
                    background-color:#1a4480;
                    margin-right:8px;">Step 2
          </span>
          Enter required indicator data.
        </h3>'
      ),

      div(
        style = 'background-color: white;
                width: 100%;
                border: 1px solid black;
                padding: 10px;
                margin: 0px;',
        h3(
          style = 'text-align:center;',
          HTML('<b><u>Great Plains SDAM</u></b>',
            )),
        
        ## biological indicators----
        HTML('<hr style="color: black; height: 2px; background-color: black;">'),
        h4(HTML("<b><u>Biological Indicators</u></b>")),
        div(
          fluidRow(
            column(
              12,
              radioButtons(
                "user_total_abundance", 
                HTML("<b><i>Total abundance of aquatic macroinvertebrates.</b></i>"),
                c(
                                "0" = 0,
                                "1 to 9" = 1,
                                "10 or greater" = 2
                            ),
                width = '100%',
                inline = F
              )

            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
              
        div(
          fluidRow(
            column(
              12,
              radioButtons(
                "user_hydrophyte", 
                HTML("<b><i>Number of hydrophytic plant species (OBL or FACW) within the channel or up to one half-channel width outside the channel not having an odd distribution pattern.</b></i>"),
                c(
                                "Less than 2" = 0,
                                "Greater than or equal to 2" = 1
                            ),
                width = '100%',
                inline = F
              )
            )

          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),

        div(
          fluidRow(
            # HTML('<hr style="color: black; height: 1px; background-color: black;">'),
            column(
              12,
              radioButtons(
                "user_upland_rooted", 
                HTML("<b><i>Absence of upland rooted plants in the streambed.</b></i><br>
                                    Note, upland plants include FAC species for the purposes of this indicator."),
                c(
                                "Absent" = 1,
                                "Present" = 0
                            ),
                width = '100%',
                inline = F
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
        
        div(
          fluidRow(
            # HTML('<hr style="color: black; height: 1px; background-color: black;">'),
            column(
              12,
              radioButtons(
                "user_diff_veg", 
                HTML("<b><i>Differences in vegetation score.</b></i>"),
                c(
                                "0 (Poor)" = 0,
                                "0.5" = 0.5,
                                "1 (Weak)" = 1,
                                "1.5" = 1.5,
                                "2 (Moderate)" = 2,
                                "2.5" = 2.5,
                                "3 (Strong)" = 3
                            ),
                inline = F,
                width = '100%'
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
        
        ## geomorphic Indicators----
        HTML('<hr style="color: black; height: 2px; background-color: black;">'),
        h4(HTML("<b><u>Geomorphic Indicators</u></b>")),
        div(
          fluidRow(
            column(
              12,
              radioButtons(
                "user_substrate", 
                HTML("<b><i>Substrate sorting score.</b></i>"),
                c(
                  "0 (Weak)" = 0,
                  "0.75" = 0.75,
                  "1.5 (Moderate)" = 1,
                  "2.25" = 2.25,
                  "3 (Strong)" = 3
                ),
                inline = F,
                width = '100%'
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
        
        div( 
          fluidRow(
            # HTML('<hr style="color: black; height: 1px; background-color: black;">'),
            column(
              12,
              radioButtons(
                "user_riff_pool", 
                HTML("<b><i>Riffle pool sequence score.</b></i>"),
                c(
                  "0 (Poor)" = 0,
                  "0.5" = 0.5,
                  "1 (Weak)" = 1,
                  "1.5" = 1.5,
                  "2 (Moderate)" = 2,
                  "2.5" = 2.5,
                  "3 (Strong)" = 3
                ),
                inline = F,
                width = '100%'
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
        
        div(
          fluidRow(
            # HTML('<hr style="color: black; height: 1px; background-color: black;">'),
            column(
              12,
              radioButtons(
                "user_sediment_plants", 
                HTML("<b><i>Presence of sediment on plants.</b></i>"),
                c(
                  "0 (Poor)" = 0,
                  "0.25" = 0.25,
                  "0.5 (Weak)" = 0.5,
                  "0.75" = 0.75,
                  "1 (Moderate)" = 1,
                  "1.25" = 1.25,
                  "1.5 (Strong)" = 1.5
                ),
                inline = F,
                width = '100%'
              )
            )
          ),
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),
      
        div(
          fluidRow(
            # HTML('<hr style="color: black; height: 1px; background-color: black;">'),
            column(width = 12,
              HTML("<b><i>Enter the Number of Bankfull Measurements (m) <br>(min. 1, max. 3)</b></i>"),
              numericInputIcon("select_bank",
                label = NULL,
                width = "325px",
                min = 1,
                max = 3,
                value = 3,
                step = 1,
                icon = icon("hashtag")
              )
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
        ) %>% tagAppendAttributes(class = 'question_box'),
        br(),

        div(
          fluidRow(
            
            # HTML('<hr style="color: black; width: 100%; height: 3px; background-color: black;">'),
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
              actionButton("runmodel", div("Run Model"))
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
        ) %>% tagAppendAttributes(class = 'question_box'),

        fluidRow(
          column(
            12,
            br(), br()
            
          )
        )
      )
    )
  )
}

