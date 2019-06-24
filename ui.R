#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Prediction of iris sepal length"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("petal_length",
                   "Enter petal length",
                   min = 1,
                   max = 8,
                   value = 4),
       radioButtons("species","Select iris species", c("setosa","versicolor", "virginica"))),
    
    # Show a plot of the generated distribution
    mainPanel(
       h2("Predicted sepal length"),
       h3(textOutput("prediction")),
       h2("Documentation:"),
       h3("Just enter the petal length and click the iris species and you get a prediction of sepal length.")
    )
  )
))
