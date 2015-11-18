library(shiny)

# Define UI for application that draws a histogram and options
shinyUI(fluidPage(
  titlePanel("Distribution Histogram Generator"),
  
  # Sidebar with input options
  sidebarLayout(
    sidebarPanel(
      sliderInput("obs",
                  "Number of observations:",
                  min = 10,
                  max = 1000,
                  value = 250),
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30),
      radioButtons("dist", "Distribution type:",
                   c("Normal" = "norm",
                     "Uniform" = "unif",
                     "Log-normal" = "lnorm",
                     "Exponential" = "exp")),
      textInput("col",
                "Color:",
                value = "steelblue2")
      # submitButton("Submit")
    ),
    
    # Show plot
    mainPanel(
      plotOutput("distPlot")
    )
  )
))