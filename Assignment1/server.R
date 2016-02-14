##Fire Application## 
#This application is to get the information on fire cases according to state
#The data is available from 2011 - 2014

#User just need to select a state
#The histogram will give the result

library(shiny)
library(ggplot2)

server <- function(input, output) {
  fire <- read.csv("fire.csv")
  output$inputValuestate <- renderPrint({input$state})
  output$plot1 <- renderPlot({
    fire[1==input$state,]
    ggplot(data=fire, aes(x=fire$Year, y=fire$Cases)) +
      geom_bar(fill="orange", stat = "identity")+ labs(x="Year", y="Total Cases")
  }) 
}