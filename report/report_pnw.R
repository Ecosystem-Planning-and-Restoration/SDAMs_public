# PNW report panel

pnw_report <- function(){
    fluidRow(
        column(1),
        column(10,

            br(), br(),
            h2(HTML(
                "Step 3: Enter additional information (optional)")
                ),
            div(
                style = 'background-color: white;
                        width: 100%;
                        border: 1px solid black;
                        padding: 10px;
                        margin: 0px;',

                ## General Information----
                h3(
                    style = 'text-align:center;',
                    HTML(
                    "Pacific Northwest SDAM Report"
                    )
                ),
                h4(HTML("* Maximum file upload size is 30MB.")),
                
                h5('Enter information about the assessment. Indicators required for classification are filled in from entries above'),

                div(
                    
                    h4(HTML(
                    "General Site Information</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textInput(
                        "project",
                        label = "Project Name or Number:" ,
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    textInput(
                        "code",
                        label = "Site Code or Identifier:",
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    textInput(
                        "assessor",
                        label = "Assessor(s):",
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    textInput(
                        "waterway",
                        label = "Waterway Name:",
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    textInput(
                        "date",
                        label = "Visit Date:",
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    radioButtons(
                        inputId = "radio_weather",
                        label = "Current Weather Conditions (check one):",
                        choices = c(
                            "Storm/Heavy Rain" = 'heavyrain',
                            "Steady Rain" = 'steadyrain',
                            "Intermittent Rain" = 'intermittentrain',
                            "Snowing" = 'snowing',
                            "Cloudy" = 'cloudy',
                            "Clear/Sunny" = 'clearsunny'
                        ),
                        selected = NULL
                    ),

                    textAreaInput(
                        "weather",
                        label = "Notes on current or recent weather conditions:" ,
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    checkboxGroupInput(
                        inputId = "check_use",
                        label = "Surrounding land-use within 100 m (check one or two):",
                        choices = c(
                            "Urban, industrial, or residential" = 'urban',
                            "Agricultural" = 'agricultural',
                            "Developed open-space (e.g., golf course, parks, lawn grasses)" = 'openspace',
                            "Forested" = 'forested',
                            "Other Natural" = 'othernatural',
                            "Other" = 'other'
                        ),
                        selected = NULL
                    ),

                    textAreaInput(
                        inputId = "notes_landuse",
                        label = "Comments on observed land-use:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    numericInput(
                        inputId = "actreach",
                        label = "Assessment reach length (m):",
                        value = "",
                        min = 0,
                    ),

                    textAreaInput(
                        inputId = "boundary",
                        label = "Describe reach boundaries:" ,
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    checkboxGroupInput(
                        inputId = "radio_situation",
                        label = "Disturbed or difficult conditions (check all that apply):",
                        choices = c(
                            "Recent flood or debris flow" = 'flood',
                            "Stream modifications (e.g., channelization)" = 'stream_modifications',
                            "Diversions" = 'diversions',
                            "Water discharges" = 'discharges',
                            "Drought" = 'drought',
                            "Vegetation removal/limitations" = 'vegetation',
                            "Other (explain in notes)" = 'other',
                            "None" = 'none'
                        ),
                        selected = NULL
                    ),

                    textAreaInput(
                        inputId = "situation",
                        label = "Site disturbances/difficulties:" ,
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                
                ## Observed Hydrology----
                
                div(
                    h4(
                        HTML(
                        "<b><u>Observed Hydrology</u></b>"
                        )
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    numericInput(
                        inputId = "surfflow",
                        label = "Percent of reach with surface flows:",
                        value = 0,
                        min = 0,
                    ),

                    numericInput(
                        inputId = "subflow",
                        label = "Percent of reach with surface and sub-surface flows:",
                        value = 0,
                        min = 0,
                    ),

                    numericInput(
                        inputId = "pool",
                        label = "Number of isolated pools:",
                        value = 0,
                        min = 0,
                    ),

                    textAreaInput(
                        inputId = "notes_observed_hydrology",
                        label = "Comments on observed hydrology:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                
                ## Indicators----
                div(
                    h4(
                        HTML("<b><u>General Photos</u></b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),
                
                    ### General Photos----
                    slatesFileInput(
                        "tld",
                        "Top of reach looking downstream:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                    
                    slatesFileInput(
                        "mlu",
                        "Middle of reach looking upstream:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                    
                    slatesFileInput(
                        "mld",
                        "Middle of reach looking downstream:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                    
                    slatesFileInput(
                        "blu",
                        "Bottom of reach looking upstream:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                    
                    slatesFileInput(
                        "sketch",
                        "Site Sketch:",
                        accept = c('image/png', 'image/jpeg')
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                br(),

                HTML('<hr style="color: black; height: 5px; background-color: black;">'),

                br(),
                h3(HTML("<b>Add photos and notes about indicators</b>")),

                # Invertebrates----
                div(
                    h4(HTML("<b>Aquatic Benthic Macroinvertebrates</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_totalAbundance",
                        label = "Notes about aquatic benthic macroinvertebrates:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv1",
                        HTML("Invertebrate Photo #1<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv1_cap",
                        label = HTML("<span style='font-weight:normal'> Invertebrate Photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv2",
                        HTML("Invertebrate Photo #2<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),   
                    textInput(
                        inputId = "inv2_cap",
                        label = HTML("<span style='font-weight:normal'>Invertebrate Photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv3",
                        HTML("Invertebrate Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv3_cap",
                        label = HTML("<span style='font-weight:normal'>Invertebrate Photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv4",
                        HTML("Invertebrate Photo #4<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv4_cap",
                        label = HTML("<span style='font-weight:normal'> Invertebrate Photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv5",
                        HTML("Invertebrate Photo #5<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv5_cap",
                        label = HTML("<span style='font-weight:normal'>Invertebrate Photo #5 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "inv6",
                        HTML("Invertebrate Photo #6<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "inv6_cap",
                        label = HTML("<span style='font-weight:normal'>Invertebrate Photo #6 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                # Hydrophytes ----
                div(
                    h4(HTML("<b>Hydrophytes</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_hydro",
                        label = "Notes about hydrophytic vegetation:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro1",
                        HTML("Hydrophyte Photo #1<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro1_cap",
                        label = HTML("<span style='font-weight:normal'> Hydrophyte Photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro2",
                        HTML("Hydrophyte Photo #2<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),   
                    textInput(
                        inputId = "hydro2_cap",
                        label = HTML("<span style='font-weight:normal'>Hydrophyte Photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro3",
                        HTML("Hydrophyte Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro3_cap",
                        label = HTML("<span style='font-weight:normal'>Hydrophyte Photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro4",
                        HTML("Hydrophyte Photo #4<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro4_cap",
                        label = HTML("<span style='font-weight:normal'> Hydrophyte Photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro5",
                        HTML("Hydrophyte Photo #5<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro5_cap",
                        label = HTML("<span style='font-weight:normal'>Hydrophyte Photo #5 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "hydro6",
                        HTML("Hydrophyte Photo #6<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "hydro6_cap",
                        label = HTML("<span style='font-weight:normal'>Hydrophyte Photo #6 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                ### Perennial Taxa-----
                div(
                    h4(HTML("<b>Perennial Taxa.</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_per", 
                        label = "Notes about perennial taxa:", 
                        value = "", 
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "per1", 
                        HTML("Perennial Taxa Photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "per1_cap", 
                        label = HTML("<span style='font-weight:normal'>Perennial Taxa Photo #1 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "per2", 
                        HTML("Perennial Taxa Photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "per2_cap", 
                        label = HTML("<span style='font-weight:normal'>Perennial Taxa Photo #2 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "per3", 
                        HTML("Perennial Taxa Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "per3_cap", 
                        label = HTML("<span style='font-weight:normal'>Perennial Taxa Photo #3 caption: </span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                
                ### Fish----
                div(
                    h4(HTML("<b>Fish</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),
                    
                    textAreaInput(
                        inputId = "notes_fish",
                        label = "Notes about fish:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "fish1",
                        HTML("Fish Photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "fish1_cap",
                        label = HTML("<span style='font-weight:normal'>Fish Photo #1 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "fish2",
                        HTML("Fish Photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "fish2_cap",
                        label = HTML("<span style='font-weight:normal'>Fish Photo #2 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "fish3",
                        HTML("Fish Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "fish3_cap",
                        label = HTML("<span style='font-weight:normal'>Fish Photo #3 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                ### Amphibians----
                div(
                    h4(HTML("<b>Amphibians</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    textAreaInput(
                        inputId = "notes_amph", 
                        label = "Notes about amphibians:", 
                        value = "", 
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "amph1", 
                        HTML("Amphibians Photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "amph1_cap", 
                        label = HTML("<span style='font-weight:normal'>Amphibians Photo #1 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "amph2", 
                        HTML("Amphibians Photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "amph2_cap", 
                        label = HTML("<span style='font-weight:normal'>Amphibians Photo #2 caption:</span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "amph3", 
                        HTML("Amphibians Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "amph3_cap", 
                        label = HTML("<span style='font-weight:normal'>Amphibians Photo #3 caption: </span>"), 
                        value = "", 
                        width = NULL, 
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                ### Slope----
                div(
                    h4(HTML("<b>Slope</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),
                    
                    textAreaInput(
                        inputId = "notes_slope",
                        label = "Notes about slope:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),
                    # numericInput(
                    #   inputId = "valley_length",
                    #   label = "Valley length (m):",
                    #   value = 0,
                    #   min = 0,
                    # ),
                    slatesFileInput(
                        "slope1",
                        HTML("Slope Photo #1<br /> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "slope1_cap",
                        label = HTML("<span style='font-weight:normal'>Slope Photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "slope2",
                        HTML("Slope Photo #2<br /> <span style='font-weight:normal'> Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "slope2_cap",
                        label = HTML("<span style='font-weight:normal'>Slope Photo #2 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "slope3",
                        HTML("Slope Photo #3<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "slope3_cap",
                        label = HTML("<span style='font-weight:normal'>Slope Photo #3 caption:</span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),

                
                ## Notes and Photos----
                div(
                    h4(HTML("<b>Supplemental Information</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),
                    HTML(
                    "Note if assessment was also conducted on different dates, historical photo interpretation, etc "
                    ),
                    
                    textAreaInput(
                        inputId = "notes_supplemental_information",
                        label = "Additional notes about the assessment:",
                        value = "",
                        width = '100%',
                        height = '75px',
                        placeholder = NULL
                    ),
                    
                    HTML('<hr style="color: black; height: 3px; background-color: black;">'),    
                    h4(HTML("<b>Additional Photos</b>")
                    ) %>% tagAppendAttributes(class = 'center-div-text'),

                    slatesFileInput(
                        "add1",
                        HTML("Additional Photo #1<br/> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "add1_cap",
                        label = HTML("<span style='font-weight:normal'>Additional Photo #1 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "add2",
                        HTML("Additional Photo #2<br/> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "add2_cap",
                        label = HTML("<span style='font-weight:normal'>Additional Photo #2 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                    
                    slatesFileInput(
                        "add3",
                        HTML("Additional Photo #3<br /> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "add3_cap",
                        label = HTML("<span style='font-weight:normal'>Additional Photo #3 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),

                    slatesFileInput(
                        "add4",
                        HTML("Additional Photo #4<br /> <span style='font-weight:normal'>Upload photo file here: </span>"),
                        accept = c('image/png', 'image/jpeg')
                    ),
                    textInput(
                        inputId = "add4_cap",
                        label = HTML("<span style='font-weight:normal'>Additional Photo #4 caption: </span>"),
                        value = "",
                        width = NULL,
                        placeholder = NULL
                    ),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                
                div(
                    downloadButton("report", "Generate report"),
                ) %>% tagAppendAttributes(class = 'question_box'),
                br(),
                br(),
                br(),
                br()
            )
        )
    )
}