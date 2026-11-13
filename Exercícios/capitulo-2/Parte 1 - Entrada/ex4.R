library(shiny)

lista <- c(1, 2, 3, 4, 5)
ui <- fluidPage(
  selectInput("lista", "Alguma coisa",
              choices = list(
                "Pais" = c("Brasil", "Espanha", "EUA"),
                "Comidas" = c("Maçã", "Banana", "Ovo frito")))
)

server <- \(input, output, session){
  
}

shinyApp(ui, server)