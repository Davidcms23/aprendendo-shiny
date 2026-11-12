library(shiny)

ui <- fluidPage(
  sliderInput("x", "Se x é", min = 1, max = 50, value = 30),
  "então x vezes 5 é",
  textOutput("product")
)

server <- \(input, output, session){
    output$product <- renderText({
    input$x * 5
  })
}

shinyApp(ui, server)