# Developer Data Product Assignment
# server.R
# York Huang

library(shiny)
library(UsingR)
library(caret)

# Load Data
data("kid.weights")

#C onvert inch to cm, pound to kg
kid.weights$height = 2.54 * kid.weights$heigh
kid.weights$weight = kid.weights$weight * 0.4536

# Train a linear model
model <- train(weight ~ ., data=kid.weights, method='lm')

# predict weight function
predictWeight <- function(age, height, gender) {
  newdata = data.frame(age=age, height=height, gender=gender)
  paste("Your kid is estimated to weigh",
        round(predict(model, newdata = newdata)[[1]],2),
        "kg.")
}
  
shinyServer(
  function(input, output) {
    output$WeightMessage <- renderText({predictWeight(input$age, input$height, input$gender)})
  }
)