library(shiny)

ui <- fluidPage(
  textInput("name", "Qual o seu nome?"),
  textOutput("greeting")
)

library(shiny)

ui <- fluidPage(
  textInput("name", "Qual o seu nome?"),
  textOutput("greeting")
)

# server1 <- \(input, output, session){
#   input$greeting <- renderText(
#     paste0("Olá ", input$name)
#   )
# }

server2 <- \(input, output, session){
  greeting <- reactive(paste0("Hello ", input$name))
  output$greeting <- renderText(greeting())
}

# server3 <- \(input, output, session){
#   output$greeting <- paste0( # greting
#     "Hello", input$name
#   )
# }


shinyApp(ui, server)
