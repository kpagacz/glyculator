library (shiny)
source(paste0(getwd(), "/scripts/calculator.R"))

shinyServer(function(input, output, session) {
  
  output$files = renderTable ({
    input$files
  })
  
  # output$datapath (paste(getwd()))

})
