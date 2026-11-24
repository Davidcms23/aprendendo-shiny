library(shiny)

ui <- fluidPage(
  textInput("name", "Qual o seu nome?"),
  textOutput("greeting")
)

# server1 <- \(input, output, session){
#   output$greeting <- renderText( # input$greeting
#     paste0("Olá ", input$name)
#   )
# }
# 
# shinyApp(ui, server1)

# server2 <- function(input, output, server) {
#   greeting <- reactive(paste0("Hello ", input$name))
#   output$greeting <- renderText(greeting())
# }
# 
# shinyApp(ui, server2)

server3 <- \(input, output, session){
  output$greeting <- paste0( # greting
    "Hello ", input$name
  )
}

shinyApp(ui, server3)

