library(shiny)

# Define UI for application that draws a histogram and options
shinyUI(
  navbarPage("Distribution Histogram Generator",
      tabPanel("Application",
               fluidPage(
                 # Sidebar with input options
                 sidebarLayout(
                   sidebarPanel(
                     radioButtons("dist", "Distribution type:",
                                  c("Normal" = "norm",
                                    "Uniform" = "unif",
                                    "Log-normal" = "lnorm",
                                    "Exponential" = "exp")),
                     sliderInput("obs",
                                 "Number of observations:",
                                 min = 10,
                                 max = 1000,
                                 value = 250),
                     sliderInput("breaks",
                                 "Number of breaks:",
                                 min = 1,
                                 max = 50,
                                 value = 30),
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
               )),
      tabPanel("Help",
                titlePanel("How to use the application"),
                p("This application generates random distributions based in your choices."),
                p("The generation of the distribution is reactive. This means that if you change any of the variables it will generate a new distribution."),          
                p("The available choices are the following:"),
               tags$ul(
                 tags$li("Distribution: Type of distribution to choose."), 
                 tags$li("Observations: number of observations in the random distribution"), 
                 tags$li("Breaks: Decide how many breaks you want to have in the figure."),
                 tags$li("Color: Type the color you want in the figure. The Default color is steelblue2. If the color typed does not exist it will throw an error.")
               )
               )
             )
  )