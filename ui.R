library (shiny)
# source(paste0(getwd(), "scripts/calculator.R"))

shinyUI (
    fluidPage(
      titlePanel("Glyculator v2 alpha"),
      fluidRow(
        numericInput ("idrow", label = "idrow", value = 3),
        numericInput ("idcol", label = "idcol", value = 2),
        numericInput ("perday", label = "perday", value = 288),
        numericInput ("headnrows", label = "headnrows", value = 13),
        numericInput ("datecol", label = "datecol", value = 2),
        numericInput ("timecol", label = "timecol", value = 3),
        numericInput ("dtcol", label = "dtcol", value = 4),
        numericInput ("glucosecol", label = "glucosecol", value = 10),
        textInput ("dtformat", label = "Date format", value = "dmy_hms"),
        textInput ("max days", label = "maxdays", value = "F"),
        textInput ("extension", label = "ext", value = ".csv"),
        textInput ("separator", label = "sep", value = ","),
        fileInput ('files', label = 'files', multiple = T)
        ),
      fluidRow(
        tableOutput ('files'),
        # verbatimTextOutput ('debug'),
        textOutput ('datapath'),
        textOutput ('csv'),
        getwd(),
        paste0(getwd(), '/scripts/calculator.R')
      )
      )
  )
