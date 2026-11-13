library(shiny)

lista <- c(1, 2, 3, 4, 5)
ui <- fluidPage(
  selectInput("lista", "Alguma coisa", choices = lista)
)

server <- \(input, output, session){
  
}

shinyApp(ui, server)