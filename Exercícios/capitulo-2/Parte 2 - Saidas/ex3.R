library(shiny)
library(DT)

ui <- fluidPage(
  DTOutput("table")
)

server <- \(input, output, session){
  output$table <- renderDT(mtcars, options = list(
    pageLength = 5,
    searching = F,
    ordering = F,
    lengthChange = F
    ),
                                  )
}

shinyApp(ui, server)