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
  titlePanel("ICU patient lab event"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      selectInput("Bicarbonate", "Bicarbonate level:",
                  choices = data),
      sliderInput("Bicarbonate",
                  "Bicarbonate level:",
                  min = 0,  max = 40, value = 2)
    ),
    
    mainPanel(
      plotOutput("aplot")
    )
  )
)
# Define a server for the Shiny app
server <- function(input, output) {
  
  # Fill in the spot we created for a plot
  output$aplot <- renderPlot({
    
    # Render a barplot
    data %>%
      select(Bicarbonate, thirty_day_mort) %>%
      group_by(Bicarbonate) %>%
      filter(Bicarbonate == input$Bicarbonate) %>%
      count(thirty_day_mort, name = 'number') %>%
      ggplot(aes(x = Bicarbonate, y= number, fill = thirty_day_mort)) +
      geom_bar(stat = "identity") +
      labs(x = "Bicarbonate", y = "numbers of death in patients for 30 days",
           title = "The 30 Day Mortality By Bicarbonate measurement") +
      scale_y_continuous(
        breaks = c(0, 1000, 2000, 3000, 4000, 5000, 6000),
        labels = c(0, 1000, 2000, 3000, 4000, 5000, 6000),
        limits = c(0, 6000)) +
      theme(
        axis.text.x = element_text(
          angle = 340, vjust = 0.5, hjust = 0.5),
        legend.position = "right")
    
  })
}
shinyApp(ui = ui, server = server)