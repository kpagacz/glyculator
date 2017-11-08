library (shiny)
source(paste0(getwd(), "/scripts/calculator.R"))

shinyServer(function(input, output, session) {
  
# observeEvent reacts to pressing the submit button.
observeEvent(input$button, {
    withProgress(message = "calculation in progress", detail = 'It may take up to a few minutes...',
                 value = 0, {
                   
                  # Here is where the magic happens - listofmeasurements definition
                  d = ListOfMeasurments$new(files.list = unlist(input$files$datapath),
                                        dir = getwd(), max.days = input$maxdays, perday = input$perday,
                                        idrow = input$idrow, 
                                        idcol = input$idcol,
                                        headnrows = input$headnrows, 
                                        datecol = input$datecol,
                                        timecol = input$timecol, 
                                        dtcol = input$dtcol,
                                        glucosecol = input$glucosecol,
                                        separator = input$separator,
                                        extension = input$extension, 
                                        dtformat = input$dtformat
                                        )
                  
                  # getResults invokes calculate class to calculate all indices and returns dataframe of results
                  setProgress(value = 0.5, message = "Done loading and preprocessing", detail = "Now calculating. (up to a couple of minutes)")
                  res = d$getResults()
                  output$table = renderTable(res)
                  setProgress(value = 1, message = "Done calculating", detail = "Your download will soon be ready. Go to 'Output' tab.")
                  Sys.sleep(4)
                  
                  # downloadHandler to handle creating csv files to output. I tried it with write.xlsx, but it didn't work, so I left it as a csv.
                  output$downloadResults = downloadHandler(
                    filename = function() {
                      paste ("Results generated at ", Sys.time(), ".csv", sep = "")
                    },
                    content = function(file) {
                      write.csv(res, file, sep = '\t', eol = '\r\n', dec = '.')
                    }
                  )
    })
  })
})
