library(shiny)

ui <- fluidPage(
  sliderInput("control", "Controle deslizante",
              value=5,
              min=0,
              max=100,
              animate=T)
)

server <- \(input, output, session){
  
}

shinyApp(ui, server)