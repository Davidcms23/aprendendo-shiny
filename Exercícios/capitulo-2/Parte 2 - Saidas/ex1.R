library(shiny)

ui <- fluidPage(
  verbatimTextOutput("a"),
  textOutput("b"),
  verbatimTextOutput("c"),
  verbatimTextOutput("d")
)

server <- \(input, output, session){
  output$a <- renderPrint(summary(mtcars)) 
  output$b <- renderText("Boa!!!")
  output$c <- renderPrint(t.test(1:5, 2:6))
  output$d <- renderPrint(str(lm(mpg ~ wt, data = mtcars))) # renderText não funciona
}

shinyApp(ui, server)