library (shiny)

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
        textInput ("max days", label = "maxdays", value = "F"),
        textInput ("extension", label = "ext", value = ".csv"),
        textInput ("separator", label = "sep", value = ","),
        fileInput ('files', label = 'files', multiple = F, accept = c(
          "text/csv",
          "text/comma-separated-values,text/plain",
          ".csv"))
        ),
      fluidRow(
        tableOutput ('print'),
        verbatimTextOutput ('debug'),
        tableOutput ('csv')
      )
      )
  )
