library(shiny)
library(markdown)

shinyUI(navbarPage("Galton's height data for parents and children",
                   tabPanel("Home",
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Filter of data:"),
                                sliderInput('difference', 'Difference',value =c(-7,7) , min = -7, max = 7, step = 1),
                                sliderInput('mu', 'Guess hieght of child',value = 70, min = 60, max = 80, step = 0.1), 
                                sliderInput('mu2', 'For parent',value = 70, min = 60, max = 80, step = 0.1), 
                                submitButton("Submit")
                              ),
                              mainPanel(
                                dataTableOutput('table'),
                                plotOutput('newHist1'), 
                                plotOutput('newHist2') 
                              )
                            )
                   )

))   


