library(shiny)

# Parte do usuario
ui <- fluidPage(
  selectInput("dataset", "Escolha um conjunto de dados", choices = c("iris", "mtcars", "cars")),
  verbatimTextOutput("s"), # reservando espaço vazio para summary
  tableOutput("t") # reservando espaço vazio para table
) # ID: dataset

# Parte do app
server <- \(input, output, session) {
  
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
  
  output$s <- renderPrint({
    summary(dataset())
  })
  
  output$t <- renderTable({
    dataset()
  })
  
  # output$s <- renderPrint({
  #   dataset <- get(input$dataset, "package:datasets")
  #   summary(dataset)
  # })
  # 
  # output$t <- renderTable({
  #   dataset <- get(input$dataset, "package:datasets")
  #   dataset
  # })
}

shinyApp(ui, server)

