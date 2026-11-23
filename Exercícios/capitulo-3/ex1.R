library(shiny)

ui <- fluidPage(
  textInput("name", "Qual o seu nome?"),
  textOuput("greeting")
)
# 
# server1 <- \(input, output, session){
#   input$greeting <- renderText(
#     paste0("Olá ", name)
#   )
# }
# 
# server2 <- \(input, output, session){
#   greeting <- paste0("Hello ", input$name)
#   output$greeting <- renderText(greeting)
# }

server3 <- \(input, output, session){
  output$greeting <- paste0( # greting
    "Hello", input$name
  )
}


shinyApp(ui, server)