#'
#' This is the server logic of a Shiny web application. You can run the 
#' application by clicking 'Run App' above.
#'
#' Find out more about building applications with Shiny here:
#' 
#'    http://shiny.rstudio.com/
#'
#'The goal of this shiny web application is to predict the rating of a breakfast cereal based on the inputs of 
#'grams of fat, sugar, protein and fiber
#'
#'The prediction is based off of the reviews of 80 cereals and can be found here:
#'https://www.kaggle.com/crawford/80-cereals/downloads/80-cereals.zip/2
#'
#'

library(shiny)

#' creates a linear regression model to predict cereal rating based on
#' fat, sugar, protein and fiber content.  
#'
#' Outputs the predicted cereal rating based on the values in the sliders
#' 

shinyServer(function(input, output) {
        
        library(httr)
        cereal_data <- read.csv("https://raw.githubusercontent.com/tomschip/DDP_Week4/master/cereal.csv",header=T, sep = ",")
        model <- lm(rating ~ fat + sugars + protein + fiber, data = cereal_data)
        
        model1pred <- reactive({
                fatinput <- input$fat_grams
                sugarinput <- input$sugar_grams
                proteininput <- input$protein_grams
                fiberinput <- input$fiber_grams
                
                predict(model, newdata = data.frame(fat = fatinput, sugars = sugarinput, 
                                                    protein = proteininput, fiber=fiberinput))
                
                        
        })
  output$rating_prediction <- renderText({
        model1pred()       
  })
          
  output$fat_plot <- renderPlot({
    
    #  Creates a plots of the ratings vs fat content
        fatinput <- input$fat_grams
        plot(cereal_data$fat, cereal_data$rating, xlab = "Grams of Fat", ylab = "Rating")
        points(fatinput, model1pred(), col = "red", pch = 16, cex = 3)
        
  })
  output$sugar_plot <- renderPlot({
          
          #  Creates a plots of the ratings vs sugar content
          sugarinput <- input$sugar_grams
          plot(cereal_data$sugars, cereal_data$rating, xlab = "Grams of Sugar", ylab = "Rating")
          points(sugarinput, model1pred(), col = "red", pch = 16, cex = 3)
          
  })
  output$protein_plot <- renderPlot({
          
          #  Creates a plots of the ratings vs protein content
          proteininput <- input$protein_grams
          plot(cereal_data$protein, cereal_data$rating, xlab = "Grams of Protein", ylab = "Rating")
          points(proteininput, model1pred(), col = "red", pch = 16, cex = 3)
          
  })
  output$fiber_plot <- renderPlot({
          
          #  Creates a plots of the ratings vs fiber content
          fiberinput <- input$fiber_grams
          plot(cereal_data$fiber, cereal_data$rating, xlab = "Grams of Fiber", ylab = "Rating")
          points(fiberinput, model1pred(), col = "red", pch = 16, cex = 3)
          
  })
  
  
  
})
