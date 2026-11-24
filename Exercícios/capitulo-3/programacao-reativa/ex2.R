library(shiny)

ui <- fluidPage(
  textInput("name", "Qual o seu nome?"),
  textOutput("greeting")
)

server1 <- function(input, output, session) {
  c <- reactive(input$a + input$b)
  e <- reactive(c() + input$d)
  output$f <- renderText(e())
}; shinyApp(ui, server1)

# server2 <- function(input, output, session) {
#   x <- reactive(input$x1 + input$x2 + input$x3)
#   y <- reactive(input$y1 + input$y2)
#   output$z <- renderText(x() / y())
# }; shinyApp(ui, server2)

# server3 <- function(input, output, session) {
#   d <- reactive(c() ^ input$d)
#   a <- reactive(input$a * 10)
#   c <- reactive(b() / input$c)
#   b <- reactive(a() + input$b)
# }; shinyApp(ui, server3)


