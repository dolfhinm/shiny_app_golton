library(shiny)
library(datasets)
library(UsingR)
library(dplyr)

shinyServer(  
  function(input, output) {    
    output$table <- renderDataTable({
      #parent_seq <- seq(from = input$parent[1], to = input$parent[2], by = 1)
      #child_seq <- seq(from = input$child[1], to = input$child[2], by = 1)
      #parent<-input$parent
      #child<-input$child
      data <- transmute(Galton, Parent = parent, Child = child,
                        Difference = round(Galton$parent - Galton$child,0)
                        )
      
      data <- filter(data, Difference <= input$difference)
      #data <- filter(data, Parent %in% parent_seq, Child %in% child_seq)
      #data<-Galton
      #data <- arrange(data, Difference)
      data
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 5)
  
    )
    output$newHist1 <- renderPlot({      
      hist(galton$child, xlab='child height', col='lightblue',main='Histogram')      
      mu <- input$mu     
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)      
      mse <- mean((galton$child - mu)^2)      
      text(63, 150, paste("mu = ", mu))      
      text(63, 140, paste("MSE = ", round(mse, 2)))      
    })
    output$newHist2 <- renderPlot({      
      hist(galton$parent, xlab='parent height', col='lightblue',main='Histogram')      
      mu2 <- input$mu2     
      lines(c(mu2, mu2), c(0, 200),col="red",lwd=5)      
      mse <- mean((galton$parent - mu2)^2)      
      text(63, 150, paste("mu = ", mu2))      
      text(63, 140, paste("MSE = ", round(mse, 2)))      
    })
})

#head(Galton$parent-Galton$child)
