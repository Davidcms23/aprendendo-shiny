library(shiny)
library(ggplot2)

datasets <- c("economics", "faithfuld", "seals")
ui <- fluidPage(
  selectInput("dataset", "Dataset", choices = datasets),
  verbatimTextOutput("summary"),
  plotOutput("plot")
)

server <- \(input, output, session){
  dataset <- reactive({
    get(input$dataset, "package:ggplot2") # 2 erro
  })
  
  output$summary <- renderPrint({
    summary(dataset())
  })
  output$plot <- renderPlot({
    plot(dataset()) # 1 erro
  }, res = 96)
}

shinyApp(ui, server)