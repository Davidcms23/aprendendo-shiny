library(shiny)

ui <- fluidPage(
  textInput("name", "Como é o seu nome?"), # caixa de dialogo
  textOutput("s"),
)
  
server <- \(input, output, session){
  name <- reactive({
    get(input$dataset, "name") # pega name de textInput
  })
  
  output$s <- renderText({
    paste0("Olá ", input$name, ", como vai?")
  })
}

shinyApp(ui, server)