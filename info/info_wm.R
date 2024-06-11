# gp additional resources tab

wm_info <- function(region){

    fluidRow(
        column(10,
            tagList(
            br(),
            tags$p(
                HTML(paste0("For additional information, please refer to the user manual developed 
                        for the Beta Streamflow Duration Assessment Method for the ", region, ". 
                        Information about this method can be found on the 
                        <a
                        href=\"
                        https://www.epa.gov/streamflow-duration-assessment\">
                        Environmental Protection Agency's Beta Streamflow Duration Assessment Methods 
                        website.</a>"
                    )
                )
            ),
            
            tags$p("Training Videos:"),
            
            
            tags$p(HTML(
                "R code used to develop this application is available  
                <a href =\"https://github.com/Ecosystem-Planning-and-Restoration/SDAMs_public\" 
                > here. </a>"
                )
                )

            )
        )
    )
}