library(shiny)

# Texto -------------------------------------------------------------------


# ui <- fluidPage(
#   textOutput("text"),
#   verbatimTextOutput("print")
# )
# 
# server <- \(input, output, session){
#   output$text <- renderText("Hello!")
#   output$print <- renderPrint("Hello!")
# }


# Tabelas -----------------------------------------------------------------

ui <- fluidPage(
  tableOutput("static"),
  dataTableOutput("dynamic")
)

server <- \(input, output, session){
  output$static <- renderTable(head(mtcars))
  output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
}


shinyApp(ui, server)