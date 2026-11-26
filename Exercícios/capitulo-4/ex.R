library(shiny)
library(DT)

#source("chama.R")

count_top <- function(df, var, n = 5) {
  df %>%
    mutate({{ var }} := fct_lump(fct_infreq({{ var }}), n = n)) %>%
    group_by({{ var }}) %>%
    summarise(n = as.integer(sum(weight)))
}

prod_codes <- setNames(products$prod_code, products$title)

ui <- fluidPage(
  fluidRow(
    column(6,
           selectInput("code", "Product", choices = prod_codes, width = "100%")
    ),
    column(2,
           selectInput("y", "Y axis", c("rate", "count"))
    ),
    column(2,
           numericInput("mm", "N rows", value=1, min=1, max=10))
  ),
  fluidRow(
    column(4, tableOutput("diag")),
    column(4, tableOutput("body_part")),
    column(4, tableOutput("location"))
  ),
  fluidRow(
    column(12, plotOutput("age_sex"))
  ),
  fluidRow(
    column(2, actionButton("story", "Conte-me uma historia")),
    column(10, textOutput("narrative"))
  ),
  fluidRow(
    column(2, actionButton("a", "anterior"), actionButton("p", "proximo")),
    column(8, textOutput("historinha"))
  )
)

server <- \(input, output, session) {
  
  selected <- reactive(injuries |> filter(prod_code == input$code))
  summary <- reactive({
    selected() |>
      count(age, sex, wt = weight) |>
      left_join(population, by = c("age", "sex")) |>
      mutate(rate = n / population * 1e4)
  })
  
  output$age_sex <- renderPlot({
    if (input$y == "count") {
      summary() |>
        ggplot(aes(age, n, colour = sex)) +
        geom_line() +
        labs(y = "Número estimado de lesões")
    } else {
      summary() |>
        ggplot(aes(age, rate, colour = sex)) +
        geom_line(na.rm = TRUE) +
        labs(y = "Lesões por 10.000 pessoas")
    }
  }, res = 96)
  output$diag <- renderTable(
    count_top(selected(), diag),
    width = "100%"
  )
  output$body_part <- renderTable(
    count_top(selected(), body_part),
    width = "100%"
  )
  output$location <- renderTable(
    count_top(selected(), location),
    width = "100%"
  )
  
  narrative_sample <- eventReactive(
    list(input$story, selected()),
    selected() |> 
      pull(narrative) |> 
      sample(1)
  )
  
  indice <- reactiveVal(1)
  
  observeEvent(selected(), indice(1))
  observeEvent(input$a, indice(max(1, indice() - 1)))
  observeEvent(input$p, indice(min(nrow(selected()), indice() + 1)))
  
  output$narrative <- renderText(narrative_sample())
  output$historinha <- renderText(selected()$narrative[indice()])
  
}

shinyApp(ui, server)
