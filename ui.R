library (shiny)
library (shinythemes)

Introduction = tabPanel(title = "Introduction")

shinyUI (
    fluidPage(theme = shinytheme("united"),
      titlePanel("GlyCulator2"),
      tabsetPanel(
      tabPanel("Input",
                 fluidRow(
                   column(4, offset = 1,
                    numericInput ("idrow", label = "Identificator's row number", value = 3),
                    numericInput ("idcol", label = "Identificator's column number", value = 2),
                    numericInput ("perday", label = "Number of time points per day", value = 288),
                    numericInput ("headnrows", label = "Number of header rows", value = 13),
                    numericInput ("datecol", label = "Column number of dates", value = 2),
                    numericInput ("timecol", label = "Column number of hours", value = 3),
                    numericInput ("dtcol", label = "Column number of date and hour", value = 4),
                    numericInput ("glucosecol", label = "Column number of glucose values", value = 10)
                    ),
                   column (4, offset = 1,
                     textInput ("dtformat", label = "Date format", value = "dmy_hms"),
                     textInput ("maxdays", label = "Calculate from maximum number of whole days?", value = "F"),
                     textInput ("extension", label = "File extension", value = ".csv"),
                     textInput ("separator", label = "Separator", value = ","),
                     fileInput ('files', label = 'Upload files:', multiple = T),
                     actionButton("button", "Confirm parameters and file input")
                   )
                 )
      ),
      tabPanel(title = "Output",
                 fluidRow(
                   textOutput('complete')
                   ),
                 fluidRow(
                   downloadButton('downloadResults', "Download Results!")
                   ),
                 fluidRow(
                   tableOutput("table")
                 )
      ),
      tabPanel(title = "Instructions - how to use",
                 fluidRow(
                    "Glyculator2 requires user to submit:"
                 )
      ),
      tabPanel(title = "About",
                 fluidRow(
                    "GlyCulator2 was created by Konrad Pagacz to calculate glycaemic variability indices from raw continuous glucose monitoring 
                    (CGM) or flash glucose monitoring (FGM) data. It accepts raw CGM or FGM files in .xls, .xlsx, .csv, .txt formats and calculates
                    the following glycaemic variability indices: mean, standard deviation (SD), median, coefficient of variation, M100 index,
                    J-index, mean amplitude of glycaemic excursion, mean of daily differences, continuous overall net glycaemic action (CONGA)
                    percent of measurements below 70 mg/dl (3.9 mmol), percent of measurements over 180 mg/dl (10 mmol/l), glycaemic risk assessment
                    in diabetes equation (GRADE) and GRADE's appropriate percentages."
                 )
      )
    )
    )
)