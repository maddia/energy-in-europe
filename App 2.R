energy<- read.table(file="cons.csv",head=TRUE,sep=",")
library(shiny)
ui <- fluidPage(
  
  
  
    
    # Give the page a title
    titlePanel("Consumption of Renewables by YEAR in %"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("country", "Country:", 
                    choices=colnames(energy)),
        hr(),
        helpText("Data from European Commisioners")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("energyPlot")  
      )
      
    )
  )

server <- function(input, output) {
  # Fill in the spot we created for a plot
  output$energyPlot <- renderPlot({
    
    # Render a barplot
    barplot(energy[,input$country], 
            main=input$country,
            ylab="% of Renewables",
            xlab="Year 2010 - 2016")
  })
}

shinyApp(ui = ui, server = server)