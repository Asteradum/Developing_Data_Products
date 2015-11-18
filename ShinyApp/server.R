library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    
    dist <- {
      if (input$dist == "norm")
        rnorm(input$obs) 
      else if(input$dist == "unif")
        runif(input$obs)
      else if (input$dist == "lnorm") 
        rlnorm(input$obs)
      else rexp(input$obs)
      }
    if (input$col == '') col <- "steelblue2" else col <- input$col
    
    # draw the histogram with the specified number of bins
    bins <- seq(min(dist), max(dist), length.out = input$bins + 1)
    hist(dist, breaks = bins, col = col, border = 'white')
  })
})