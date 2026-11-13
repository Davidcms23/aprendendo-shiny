library(tidyverse)

ui <- fluidPage(
  fluidRow(
    column(
      width = 6, # largura
      offset=3,  # deslocamento
      align = "center",
      wellPanel(
        sliderInput(
          "data", "Quando devemos entregar?",
          value=as.Date("2020-09-16"),
          min=as.Date("2020-09-17"),
          max=as.Date("2020-09-23"),
          timeFormat="%Y-%m-%d"
        )
      )
    )
  )
)

server <- \(input, output, session){
  
}

shinyApp(ui, server)