library(shiny)

ui <- fluidPage(
  textInput("name", "", placeholder = "Seu nome")
)

server <- \(input, output, session){
  
}

shinyApp(ui, server)