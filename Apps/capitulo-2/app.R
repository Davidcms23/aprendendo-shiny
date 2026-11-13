library(shiny)


# Texto -------------------------------------------------------------------

# ui <- fluidPage(
#   textInput("name", "Qual o seu nome?"),
#   passwordInput("senha", "Qual sua senha?"),
#   textAreaInput("story", "Fale sobre você", row = 3)
# )


# Números -----------------------------------------------------------------

# ui <- fluidPage(
#   numericInput("num", "Numero um", value = 0, min=0, max=100),
#   sliderInput("num2", "Numero dois", value = 50, min=0, max=100),
#   sliderInput("rng", "Range", value=c(0, 0), min=0, max=100)
# )


# Datas -------------------------------------------------------------------

# ui <- fluidPage(
#   dateInput("dob", "Quando você nasceu?"),
#   dateRangeInput("Feriado", "Para onde você quer ir no próximo feriado?")
# )

# Opções ------------------------------------------------------------------

# animals <- c("dog", "cat", "mouse", "bird", "other", "Odeio aos animais")
# ui <- fluidPage(
#   selectInput("state", "Qual o seu estado favorito?", state.name),
#   radioButtons("animal", "Qual o seu animal favorito", animals),
#   radioButtons("rb", "Choose one:",
#                choiceNames = list(
#                  icon("angry"),
#                  icon("smile"),
#                  icon("sad-tear")
#                ),
#                choiceValues = list("angry", "happy", "sad")),
#   selectInput("states", "Quais os seus estados favoritos", state.name,
#               multiple = T),
#   checkboxGroupInput("animal0", "Quais animais você gosta?", animals),
#   checkboxInput("cleanup", "Clean up?", value = T),
#   checkboxInput("shutdown", "Shutdown?")
# )

# Envios de arquivos ------------------------------------------------------

# ui <- fluidPage(
#   fileInput("upload", NULL)
# )

# Botões de ação ----------------------------------------------------------

ui <- fluidPage(
  fluidRow(
    actionButton("click", "clique em mim!", class = "btn-danger",
                 icon = icon("smile")),
    actionButton("drink", "Beba-me!", class = "btn-lg btn-success",
                 icon = icon("cocktail"))
  ),
  fluidRow(
    actionButton("eat", "Coma-me!", class="btn-block btn-primary")
  )
)

server <- \(input, output, session) {
  
}

shinyApp(ui, server)