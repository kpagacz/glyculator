library (shiny)

shinyServer(function(input, output, session) {
  
  output$print = renderTable(file())
  
  # output$debug = renderPrint ({
  #   # str (file()$datapath)
  #   # paste0(file()$datapath[1], '/', file()$name[1])
  #   readLines(con = file(file()$datapath[1], encoding = "UTF-8"))
  # })
  
  output$csv = renderTable ({
    inFile = input$files
    
    if (is.null(inFile)) return (NULL)
    
    read.csv (inFile$datapath, sep = ';', header = T)
  })
})
