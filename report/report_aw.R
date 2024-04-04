# arid west report panel

aw_report <- function(){
    fluidRow(
        column(1),
        column(7,

            ## General Information----
            HTML('<hr style="color: black; height: 6px; background-color: black;">'),
            h2(HTML("Arid West SDAM Report")),
            h4(HTML("* Maximum file upload size is 30MB.")),
            h3(HTML(
            "Step 3: Enter additional information (optional)")
            ),
            h5('Enter information about the assessment. Indicators required for classification are filled in from entries above'),
            br(),
            h4(HTML(
            "<b>General Site Information</b>")
            ),

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
                width = '300px',
                height = '300px',
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
                inputId = "boundary",
                label = "Describe reach boundaries:" ,
                value = "",
                width = '300px',
                height = '300px',
                placeholder = NULL
            ),

            numericInput(
                inputId = "actreach",
                label = "Assessment reach length (m):",
                value = "",
                min = 0,
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
                width = '300px',
                height = '300px',
                placeholder = NULL
            ),
            
            ## Observed Hydrology----
            HTML('<hr style="color: black; height: 3px; background-color: black;">'),
            h4(HTML(
            "<b>Observed Hydrology</b>")
            ),

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
                width = '300px',
                height = '300px',
                placeholder = NULL
            ),
            
            ## Indicators----
            HTML('<hr style="color: black; height: 3px; background-color: black;">'),
            h4(HTML("<b>Add photos and notes about indicators</b>")),
            
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

            # Biological----
            h4(HTML("<b>Aquatic Benthic Macroinvertebrates</b>")),

            textAreaInput(
                inputId = "notes_totalAbundance",
                label = "Notes about aquatic benthic macroinvertebrates:",
                value = "",
                width = '300px',
                height = '300px',
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

            # Hydrophytes ----
            h4(HTML("<b>Hydrophytes</b>")),

            textAreaInput(
                inputId = "notes_hydro",
                label = "Notes about hydrophytic vegetation:",
                value = "",
                width = '300px',
                height = '300px',
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
            br(),

            ### Upland Rooted-----
            h4(HTML("<b>Absence of upland rooted plants in the streambed.</b>")),

            textAreaInput(
                inputId = "notes_rooted", 
                label = "Notes about upland rooted vegetation:", 
                value = "", 
                width = '300px',
                height = '300px',
                placeholder = NULL
            ),

            slatesFileInput(
                "ur1", 
                HTML("Upland Rooted Plants Photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "ur1_cap", 
                label = HTML("<span style='font-weight:normal'>Upland Rooted Plants Photo #1 caption:</span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),
            
            slatesFileInput(
                "ur2", 
                HTML("Upland Rooted Plants Photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "ur2_cap", 
                label = HTML("<span style='font-weight:normal'>Upland Rooted Plants Photo #2 caption:</span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),

            slatesFileInput(
                "ur3", 
                HTML("Upland Rooted Plants Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "ur3_cap", 
                label = HTML("<span style='font-weight:normal'>Upland Rooted Plants Photo #3 caption: </span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),
            
            ### Algal Cover----
            h4(HTML("<b>Algal Cover</b>")),
            
            textAreaInput(
                inputId = "notes_algal",
                label = "Notes about algal cover:",
                value = "",
                width = '300px',
                height = '300px',
                placeholder = NULL
            ),

            slatesFileInput(
                "algal1",
                HTML("Algal Cover Photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"),
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "algal1_cap",
                label = HTML("<span style='font-weight:normal'>Algal Cover Photo #1 caption:</span>"),
                value = "",
                width = NULL,
                placeholder = NULL
            ),

            slatesFileInput(
                "algal2",
                HTML("Algal Cover Photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "algal2_cap",
                label = HTML("<span style='font-weight:normal'>Algal Cover Photo #2 caption:</span>"),
                value = "",
                width = NULL,
                placeholder = NULL
            ),

            slatesFileInput(
                "algal3",
                HTML("Algal Cover Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"),
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "algal3_cap",
                label = HTML("<span style='font-weight:normal'>Algal Cover Photo #3 caption: </span>"),
                value = "",
                width = NULL,
                placeholder = NULL
            ),

            ### Difference in Vegetation----
            h4(HTML("<b>Differences in Vegetation</b>")),

            textAreaInput(
                inputId = "notes_veg", 
                label = "Notes about vegetation:", 
                value = "", 
                width = '300px',
                height = '300px',
                placeholder = NULL
            ),

            slatesFileInput(
                "veg1", 
                HTML("Vegetation Photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "veg1_cap", 
                label = HTML("<span style='font-weight:normal'>Vegetation Photo #1 caption:</span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),
            
            slatesFileInput(
                "veg2", 
                HTML("Vegetation Photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "veg2_cap", 
                label = HTML("<span style='font-weight:normal'>Vegetation Photo #2 caption:</span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),

            slatesFileInput(
                "veg3", 
                HTML("Vegetation Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "veg3_cap", 
                label = HTML("<span style='font-weight:normal'>Vegetation Photo #3 caption: </span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),

            ### Riffle----
            h4(HTML("<b>Riffle Pool Sequence</b>")),

            textAreaInput(
                inputId = "notes_riff", 
                label = "Notes about the riffle pool sequence:", 
                value = "", 
                width = '300px',
                height = '300px',
                placeholder = NULL
            ),

            slatesFileInput(
                "riff1", 
                HTML("Riffle Pool Photo #1<br/><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "riff1_cap", 
                label = HTML("<span style='font-weight:normal'>Riffle Pool Photo #1 caption:</span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),
            
            slatesFileInput(
                "riff2", 
                HTML("Riffle Pool Photo #2<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "riff2_cap", 
                label = HTML("<span style='font-weight:normal'>Riffle Pool Photo #2 caption:</span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),

            slatesFileInput(
                "riff3", 
                HTML("Riffle Pool Photo #3<br /><span style='font-weight:normal'>Upload photo file here:</span>"), 
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "riff3_cap", 
                label = HTML("<span style='font-weight:normal'>Riffle Pool Photo #3 caption: </span>"), 
                value = "", 
                width = NULL, 
                placeholder = NULL
            ),
            
            ### Slope----
            h4(HTML("<b>Slope</b>")),
            
            textAreaInput(
                inputId = "notes_slope",
                label = "Notes about slope:",
                value = "",
                width = '300px',
                height = '300px',
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
                HTML("slope Photo #1<br /> <span style='font-weight:normal'>Upload photo file here: </span>"),
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "slope1_cap",
                label = HTML("<span style='font-weight:normal'>slope Photo #1 caption: </span>"),
                value = "",
                width = NULL,
                placeholder = NULL
            ),

            slatesFileInput(
                "slope2",
                HTML("slope Photo #2<br /> <span style='font-weight:normal'> Upload photo file here: </span>"),
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "slope2_cap",
                label = HTML("<span style='font-weight:normal'>slope Photo #2 caption: </span>"),
                value = "",
                width = NULL,
                placeholder = NULL
            ),

            slatesFileInput(
                "slope3",
                HTML("slope Photo #3<br /> <span style='font-weight:normal'>Upload photo file here:</span>"),
                accept = c('image/png', 'image/jpeg')
            ),
            textInput(
                inputId = "slope3_cap",
                label = HTML("<span style='font-weight:normal'>slope Photo #3 caption:</span>"),
                value = "",
                width = NULL,
                placeholder = NULL
            ),
            
            ## Notes and Photos----
            h4(HTML("<b>Supplemental Information</b>")),
            HTML(
            "Note if assessment was also conducted on different dates, historical photo interpretation, etc "
            ),
            
            textAreaInput(
                inputId = "notes_supplemental_information",
                label = "Additional notes about the assessment:",
                value = "",
                width = '300px',
                height = '300px',
                placeholder = NULL
            ),
            
            HTML('<hr style="color: black; height: 3px; background-color: black;">'),    
            h4(HTML("<b>Additional Photos</b>")),

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
            
            downloadButton("report", "Generate report"),
            br(),
            br(),
            br()
        )
    )
}