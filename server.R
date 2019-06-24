#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# generating the linear models for the different iris species
#iris <- data("iris")
model_setosa <- lm(Sepal.Length ~ Petal.Length, data = iris[iris$Species == "setosa",])
model_versicolor <- lm(Sepal.Length ~ Petal.Length, data = iris[iris$Species == "versicolor",])
model_virginica <- lm(Sepal.Length ~ Petal.Length, data = iris[iris$Species == "virginica",])

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$prediction <- renderText({
    
    if (input$species == "setosa"){
            pred <- predict(model_setosa, data.frame(Petal.Length = input$petal_length))
    }
    if (input$species == "versicolor"){
            pred <- predict(model_versicolor, data.frame(Petal.Length = input$petal_length))
    }
    if (input$species == "virginica"){
            pred <- predict(model_virginica, data.frame(Petal.Length = input$petal_length))
    }
    pred
  })
  
})
