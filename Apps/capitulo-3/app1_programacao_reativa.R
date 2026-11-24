library(shiny)


# Programação reativa -----------------------------------------------------

ui <- fluidPage(
  textInput("name", "What's your name?"),
  textOutput("greeting")
)

server <- function(input, output, session) {
    string <- reactive(paste0("Hello ", input$name, "!")) # expressão reativa
    output$greeting <- renderText(string())
}



shinyApp(ui, server)

