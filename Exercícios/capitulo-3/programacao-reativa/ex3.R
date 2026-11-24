var <- reactive(df[[input$var]])
range <- reactive(range(var(), na.rm = TRUE))

# var e range são funções padrão no R


