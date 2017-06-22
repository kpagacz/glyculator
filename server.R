library (shiny)
source(paste0(getwd(), "/scripts/calculator.R"))

shinyServer(function(input, output, session) {
  


observeEvent(input$button, {
    withProgress(message = "calculation in progress", detail = 'ít may take up to a few minutes...',
                 value = 0, {
                  d = ListOfMeasurments$new(files.list = unlist(input$files$datapath),
                                        dir = getwd(), max.days = input$maxdays, perday = input$perday,
                                        idrow = input$idrow, idcol = input$idcol,
                                        headnrows = input$headnrows, datecol = input$datecol,
                                        timecol = input$timecol, dtcol = input$dtcol,
                                        glucosecol = input$glucosecol,
                                        separator = input$separator,
                                        extension = input$extension, dtformat = input$dtformat
                                        )
                  setProgress(value = 0.5, message = "Done loading and preprocessing", detail = "Now calculating. (up to a couple of minutes)")
                  res = d$getResults()
                  setProgress(value = 1, message = "Done calculating", detail = "Your download will soon be ready.")
                  Sys.sleep(2)
                  output$downloadResults = downloadHandler(
                    filename = function() {
                      paste ("Results generated at ", Sys.time(), ".csv", sep = "")
                    },
                    content = function(file) {
                      write.csv(res, file, sep = ',', eol = '\r\n', dec = '.')
                    }
                  )
    })
  })
  
  
 

  
})
