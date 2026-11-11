library(shiny)

ui <- fluidPage(
  selectInput("dataset", label = "Conjunto de dados", choices = ls("package:datasets")),
  verbatimTextOutput("summary"),
  tableOutput("table")
)

server <- \(input, output, session) {
  output$summary <- renderPrint({
    dataset <- iris #get(input$dataset, "package:datasets")
    summary(dataset)
  })
  
  output$table <- renderTable({
    dataset <- iris #get(input$dataset, "package:datasets")
    dataset
  })
}

shinyApp(ui, server)

