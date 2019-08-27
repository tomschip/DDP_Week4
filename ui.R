#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#'
#'
#'The goal of this shiny web application is to predict the rating of a breakfast cereal based on the inputs of 
#'grams of fat, sugar, protein and fiber
#'
#'The prediction is based off of the reviews of 80 cereals and can be found here:
#'https://www.kaggle.com/crawford/80-cereals/downloads/80-cereals.zip/2
#'
#'



library(shiny)

# Define UI for application that predicts the rating of a breakfast cereal based on 4 nutrional factors
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Cereal Rating From Fat, Sugar, Protein and Fiber Content"),
  
  # Sidebar with sliders to choose the grams of 4 different nutritional factors used to predict cereal rating 
  sidebarLayout(
    sidebarPanel(
       sliderInput("fat_grams","Grams of Fat", min = 0, max = 5, value = 3),
       sliderInput("sugar_grams","Grams of Sugar", min = 0, max = 15, value = 8),
       sliderInput("protein_grams","Grams of Protein", min = 0, max = 6, value = 3),
       sliderInput("fiber_grams","Grams of Fiber", min = 0, max = 14, value = 7)
    ),
    
    # Show a plot of the regression model and predicted rating
    mainPanel(
       h3("The predicted cereal rating is:"),
       textOutput("rating_prediction"),
       plotOutput("fat_plot"),
       plotOutput("sugar_plot"),
       plotOutput("protein_plot"),
       plotOutput("fiber_plot")
       
    )
  )
))
