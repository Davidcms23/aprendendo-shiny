library(shiny)

ui <- fluidPage( # front-end
  withMathJax(),
  helpText("$$f(x) = \\frac{1}{\\sigma\\sqrt{2\\pi}} e^{-\\frac{1}{2}\\left(\\frac{x-\\mu}{\\sigma}\\right)^2}$$"),
  p("Onde \\(\\mu\\) é a média e \\(\\sigma^2\\) é a variância.")
)

server <- \(input, output, session){ # back-end
  
}

shinyApp(ui, server)