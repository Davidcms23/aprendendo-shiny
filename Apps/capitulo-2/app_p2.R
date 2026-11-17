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

# ui <- fluidPage(
#   tableOutput("static"),
#   dataTableOutput("dynamic")
# )
# 
# server <- \(input, output, session){
#   output$static <- renderTable(head(mtcars))
#   output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
# }


# Gráficos ----------------------------------------------------------------

ui <- fluidPage(
  plotOutput("plot", width = "400px")
)

server <- \(input, output, session){
  output$plot <- renderPlot(plot(1:5), res = 96)
}


# Downloads ---------------------------------------------------------------

# Com funções downloadButton() ou downloadLink(), só no Capítulo 9

shinyApp(ui, server)