library(shiny)

ui <- fluidPage(
  sliderInput("x", "Se x é", min = 1, max = 50, value = 30),
  sliderInput("y", "Se y é", min = 1, max = 50, value = 30),
  "então x vezes y é",
  textOutput("product")
)

server <- \(input, output, session){
  output$product <- renderText({
    input$x * input$y
  })
}

shinyApp(ui, server)