# server file
# STAT 420
# app for simple linear regression

library(ggplot2)

shinyServer(
     function(input, output) {    
          
          # read in sat dataset
          gpa = read.csv('sat.csv')
          gpa$total_SAT = gpa$math_SAT + gpa$verb_SAT
          
          # explanatory variable 
          xvar <- reactive({
               input$xvar
          })
          
          # bring in and subset dataset
          gpa2 <- reactive({
               return(data.frame(y = gpa$univ_GPA, x = gpa[,xvar()]))
          })
          
          xlabel <- reactive({
               return(c('High School GPA', 'Mathematics SAT', 'Verbal SAT',
                        'Total SAT')[which(xvar() == c('high_GPA', 'math_SAT', 'verb_SAT', 'total_SAT'))])
          })
          
          
          # scatterplot
          output$scatter <- renderPlot({
               
               # scatterplot
               scatterplot = 
                    ggplot(gpa2(), aes(x = x, y = y)) +
                    geom_point(size = 2) +
                    scale_y_continuous(name = 'University GPA') +
                    scale_x_continuous(name = xlabel()) +
                    theme(axis.title.x = element_text(size = 17), axis.title.y = element_text(size = 17)) +
                    ggtitle('Simple Linear Regression') + 
                    theme(plot.title = element_text(lineheight = .8, face = 'bold', size = 25)) + 
                    geom_smooth(method = 'lm')
              
               print(scatterplot)
               
          })
      
          
     })
