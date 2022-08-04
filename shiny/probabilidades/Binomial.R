library(shiny)

# Define la Interface de Usuario (front end)
ui <- fluidPage(
  titlePanel("Variables Aleatorias Discretas: Binomial (n,p)"),
  
  sidebarLayout(
    sidebarPanel(h4("Parámetros:"),
                 fluidRow(
                   sliderInput("p", "Selecciona la probabilidad de éxito (p)",
                               min = 0, max = 1, value = 0.5),
                   sliderInput("n", "Selecciona el número de experimentos (n)",
                               min = 1, max = 100, value = 20)
                 )),
    mainPanel(
              plotOutput("plot"))
  )
)

# Define el Servidor (back end)
server <- function(input, output) {
  
  output$plot <- renderPlot({ 
    x <- rbinom(1000, input$n, input$p)
    hist(x, col = rainbow(8),
         main=paste("Histograma de Frecuencia para una Binomial (",
                    input$n, ",", 
                    input$p, ")"), 
         probability = TRUE,
         ylab = "Probabilidad",
         xlab = "Número de Experimentos"
         )
  })
  
}

# Ejecuta la aplicación
shinyApp(ui = ui, server = server)
