library(shiny)
library(vroom)
library(tidyverse)

# dir.create("neiss")
# download <- function(name) {
#   url <- "https://raw.github.com/hadley/mastering-shiny/main/neiss/"
#   download.file(paste0(url, name), paste0("neiss/", name), quiet = TRUE)
# }
# download("injuries.tsv.gz")
# download("population.tsv")
# download("products.tsv")

(injuries <- vroom::vroom("C:/Users/f210304/Documents/aprendendo/aprendendo-shiny/apps/capitulo-4/neiss/injuries.tsv.gz"))
(products <- vroom::vroom("C:/Users/f210304/Documents/aprendendo/aprendendo-shiny/apps/capitulo-4/neiss/products.tsv"))
(population <- vroom::vroom("C:/Users/f210304/Documents/aprendendo/aprendendo-shiny/apps/capitulo-4/neiss/population.tsv"))