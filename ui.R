#final_project ui.r
library(shiny)

#Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Petal length predictor for Iris"),

  # Sidebar with options selectors
  sidebarLayout(
    sidebarPanel(
      helpText("This application is a predictor for the petal length of the iris based on its sepal length, sepal width and species"),
      h3(helpText("Select:")),
      numericInput("Sepall", label = h4("Sepal length"), step = 0.1, value = 4),
      selectInput("Species", label = h4("Species"),
                  choices = list("Unknown" = "*", "setosa" = "setosa", "versicolor" = "versicolor",
                                 "virginica " = "virginica "))
    ),

    # Show a plot with new iris and regression line
    mainPanel(
      plotOutput("distPlot"),
      h4("Predicted value of this petal length is:"),
      h3(textOutput("result"))
    )
  )
))