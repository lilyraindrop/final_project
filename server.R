#new porject server.r
library(shiny)
library(ggplot2)
library(dplyr)
library(rsconnect)
library(plotly)
# # Select columns to be used in the analysis
# diam <- diamonds[,c(1:4,7)]
# # Define server logic required to draw a plot
# shinyServer(function(input, output) {
#   output$distPlot <- renderPlot({
#     # Select diamonds depending of user input
#     diam <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
#     # build linear regression model
#     fit <- lm( price~carat, diam)
#     # predicts the price
#     pred <- predict(fit, newdata = data.frame(carat = input$car,
#                                               cut = input$cut,
#                                               color = input$col,
#                                               clarity = input$clar))
#     # Draw the plot using ggplot2
#     plot <- ggplot(data=diam, aes(x=carat, y = price))+
#       geom_point(aes(color = cut), alpha = 0.3)+
#       geom_smooth(method = "lm")+
#       geom_vline(xintercept = input$car, color = "red")+
#       geom_hline(yintercept = pred, color = "green")
#     plot
#   })
#   output$result <- renderText({
#     # Renders the text for the prediction below the graph
#     diam <- filter(diamonds, grepl(input$cut, cut), grepl(input$col, color), grepl(input$clar, clarity))
#     fit <- lm( price~carat, diam)
#     pred <- predict(fit, newdata = data.frame(carat = input$car,
#                                               cut = input$cut,
#                                               color = input$col,
#                                               clarity = input$clar))
#     res <- paste(round(pred, digits = 1.5),"$" )
#     res
#   })
#   
# })
#####################################################
data <- iris
# Define server logic required to draw a plot
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    # Select pedal depending of user input
    data <- filter(iris, grepl(input$Species, Species))
    # build linear regression model
    fit <- lm( Sepal.Length~Sepal.Length, data)
    # predicts the Petal Length
    pred <- predict(fit, newdata = data.frame(Sepal.Length = input$Sepall,
                                              Species = input$Species))
    # Draw the plot using ggplot2
    # plot <- ggplot(data=diam, aes(x=carat, y = price))+
    #   geom_point(aes(color = cut), alpha = 0.3)+
    #   geom_smooth(method = "lm")+
    #   geom_vline(xintercept = input$car, color = "red")+
    #   geom_hline(yintercept = pred, color = "green")
    # plot
    
    # plot <- plot_ly(data, x = ~Sepal.Length, y = ~Petal.Length, type = 'scatter', alpha = 0.65, mode = 'markers', name = 'Iris')
    # plot
    #Draw the plot using ggplot2
    plot <- ggplot(data=data, aes(x=Sepal.Length, y = Sepal.Length))+
      geom_point(aes(color = Species), alpha = 0.3, size = 10)+
      geom_smooth(method = "lm")+
      geom_vline(xintercept = input$Sepall, color = "red")+
      geom_hline(yintercept = pred, color = "green")
    plot
    
  })
  
  
  output$result <- renderText({
    # Renders the text for the prediction below the graph
    data <- filter(iris, grepl(input$Species, Species))
    fit <- lm( Petal.Length~Sepal.Length, data)
    pred <- predict(fit, newdata = data.frame(Sepal.Length = input$Sepall,
                                              Species = input$Species))
    res <- paste(round(pred, digits = 1.5),"$" )
    res
  })

})
