#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

data <-readRDS("icu_cohort.rds")
# Use a fluid Bootstrap layout
ui <- fluidPage(    
  
  # Give the page a title
  titlePanel("ICU Patient Data Summary"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("ethnicity", "ethnicity", 
                  c("WHITE" = "WHITE",
                    "OTHER" = "OTHER",
                    "BLACK/AFRICAN AMERICAN" = "BLACK/AFRICAN AMERICAN",
                    "HISPANIC/LATINO" = "HISPANIC/LATINO",
                    "ASIAN" = "ASIAN")),	
      hr(),
      helpText("ICU Patient Ethnicity")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("demoplot")  
    )
    
  )
)
# Define a server for the Shiny app
server <- function(input, output) {

  # Fill in the spot we created for a plot
  output$demoPlot <- renderPlot({
    
    # Render a barplot
    data %>%
      select(ethnicity, thirty_day_mort) %>%
      group_by(ethnicity) %>%
      # filter(ethnicity == "WHITE" | ethnicity == "BLACK/AFRICAN AMERICAN" |
      #          ethnicity == "ASIAN" |
      #          ethnicity == "OTHER" | ethnicity == "HISPANIC/LATINO" |
      #          ethnicity == "AMERICAN INDIAN/ALASKA NATIVE") %>%
      filter(ethnicity == input$ethnicity) %>%
      count(thirty_day_mort, name = 'number') %>%
      ggplot(aes(x = ethnicity, y= number, fill = thirty_day_mort)) +
      geom_bar(stat = "identity") +
      labs(x = "Ethnicity", y = "numbers of death in patients for 30 days",
           title = "The 30 Day Mortality By Ethnicity") +
      scale_y_continuous(
        breaks = c(0, 3000, 6000, 9000, 12000, 15000, 18000, 21000, 24000, 
                   27000, 30000, 33000, 36000, 39000), 
        labels = c(0, 3000, 6000, 9000, 12000, 15000, 18000, 21000, 24000, 
                   27000, 30000, 33000, 36000, 39000), 
        limits = c(0, 39000)) +
      theme(
        axis.text.x = element_text(angle = 340, vjust = 0.5, hjust = 0.5),
        legend.position = "right")
    
  })
}
shinyApp(ui = ui, server = server)