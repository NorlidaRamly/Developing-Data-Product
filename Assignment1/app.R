##Fire Application## 
#This application is to get the information on fire cases according to state
#The data is available from 2011 - 2014

#User just need to select a state
#The histogram will give the result


library(shiny)
library(ggplot2)

ui <- fluidPage(
  #Title
  titlePanel("Malaysia Fire Cases By State 2011-2014"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "state",label = "Select State",
                  choices = c("Perlis","Kedah", "Pulau_Pinang", "Perak", "Selangor", "WP_Kuala_Lumpur", 
                              "Negeri_Sembilan", "Melaka", "Johor", "Pahang", "Terengganu", 
                              "Kelantan", "Sabah", "Sarawak", "WP_Labuan", "WP_Putrajaya"), selected = "Perlis")),
    mainPanel(
      h2("Fire Case By State 2011-2014"),
      h3("You choose"),
      verbatimTextOutput("inputValuestate"),
      plotOutput("plot1")
    ))
)

server <- function(input, output) {
  fire <- read.csv("fire.csv")
  output$inputValuestate <- renderPrint({input$state})
  output$plot1 <- renderPlot({
    fire[1==input$state,]
    ggplot(data=fire, aes(x=fire$Year, y=fire$Cases)) +
      geom_bar(fill="orange", stat = "identity")+ labs(x="Year", y="Total Cases")
      }) 
}

shinyApp(ui = ui, server = server)