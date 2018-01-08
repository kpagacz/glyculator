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
                    tags$div(
                      list (
                        tags$p ("GlyCulator2 was created by Konrad Pagacz to calculate glycaemic variability indices from raw continuous glucose monitoring 
                        (CGM) or flash glucose monitoring (FGM) data. It accepts raw CGM or FGM files in .xls, .xlsx, .csv, .txt formats and calculates
                        the following glycaemic variability indices:"),
                        tags$ul (
                          tags$li("mean"),
                          tags$li("standard deviation (SD)"),
                          tags$li("median, coefficient of variation (CV), M100 index"),
                          tags$li("J-index"),
                          tags$li("mean amplitude of glycaemic excursion (MAGE)"),
                          tags$li("mean of daily differences (MODD)"),
                          tags$li("continuous overall net glycaemic action (CONGA)"),
                          tags$li("percent of measurements below 70 mg/dl (3.9 mmol)"),
                          tags$li("percent of measurements over 180 mg/dl (10 mmol/l)"), 
                          tags$li("glycaemic risk assessment in diabetes equation (GRADE) and GRADE's appropriate percentages.")
                        )
                      )
                    ),
                    tags$div (
                      tags$p ("M100, J-index were calculated using formulas provided by F. John Service in:
                              Service, F. J. (2013). Glucose Variability. Diabetes, 62(5), 1398–1404. http://doi.org/10.2337/db12-1396."),
                      tags$p ("MAGE algorithm was adapted from: Baghurst, P. A. (2011). Calculating the mean amplitude of 
                              glycemic excursion from continuous glucose monitoring data: an automated algorithm. Diabetes 
                              Technology & Therapeutics, 13(3), 296–302. https://doi.org/10.1089/dia.2010.0090."),
                      tags$p ("MODD and CONGA algorithms were implemented after: McDonnell, C. M., Donath, S. M., Vidmar, 
                              S. I., Werther, G. a, & Cameron, F. J. (2005). A novel approach to continuous glucose 
                              analysis utilizing glycemic variation. Diabetes Technology & Therapeutics, 7(2), 253–63.
                              https://doi.org/10.1089/dia.2005.7.253."),
                      tags$p ("GRADE calculations follow: Hill, N. R., Hindmarsh, P. C., Stevens, R. J., 
                              Stratton, I. M., Levy, J. C., & Matthews, D. R. (2007). A method for assessing quality 
                              of control from glucose profiles. Diabetic Medicine : A Journal of the British
                              Diabetic Association, 24(7), 753–8. https://doi.org/10.1111/j.1464-5491.2007.02119.x.")
                    )
                )
    )
    )
  )
)