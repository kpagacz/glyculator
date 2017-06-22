library (shiny)
# source(paste0(getwd(), "scripts/calculator.R"))

Introduction = tabPanel(title = "Introduction")

shinyUI (
    fluidPage(
      titlePanel("Glyculator2"),
      tabsetPanel(
        tabPanel(title = "Introduction"
        ),
        tabPanel("Input",
                 fluidRow(
                   column(4, offset = 1,
                    numericInput ("idrow", label = "Row number of ID", value = 3),
                    numericInput ("idcol", label = "Column number of ID", value = 2),
                    numericInput ("perday", label = "Number of time points per day", value = 288),
                    numericInput ("headnrows", label = "Number of header rows", value = 13),
                    numericInput ("datecol", label = "Column number of dates", value = 2),
                    numericInput ("timecol", label = "Column number of times", value = 3),
                    numericInput ("dtcol", label = "Column number of date and time", value = 4),
                    numericInput ("glucosecol", label = "Column number of glucose values", value = 10)
                    ),
                   column (4, offset = 1,
                     textInput ("dtformat", label = "Date format", value = "dmy_hms"),
                     textInput ("maxdays", label = "Calculate maximum number of whole days?", value = "F"),
                     textInput ("extension", label = "Extension", value = ".csv"),
                     textInput ("separator", label = "Separator", value = ","),
                     fileInput ('files', label = 'files', multiple = T),
                     actionButton("button", "Confirm parameters and file input")
                   )
                 )
        ),
        tabPanel(title = "Output",
                 textOutput('complete'),
                 downloadButton('downloadResults', "Download Results!"),
                 tableOutput("table")
        ),
        tabPanel(title = "Instructions"
        )
      )
    )
)

