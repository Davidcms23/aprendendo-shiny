library(shiny)

ui <- fluidPage(
  sliderInput("x", "Se x é", min = 1, max = 50, value = 30),
  sliderInput("y", "e Y é", min = 1, max = 50, value = 5),
  textOutput("product"),
  textOutput("product_plus5"),
  textOutput("product_plus10")
)

server <- \(input, output, sessions){
  product <- reactive({
    input$x * input$y
  })
  
  output$product <- renderText({
    paste0("então, (x * y) é ", product())
  })
  output$product_plus5 <- renderText({
    paste0("e, (x * y) + 5 é ", product() + 5)
  })
  output$product_plus10 <- renderText({
    paste0("e (x * y) + 10 é ", product() + 10)
  })
}

shinyApp(ui, server)