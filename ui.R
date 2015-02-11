# ui file
# STAT 420
# app for simple linear regression

shinyUI(
     fluidPage(
          title = 'Stat 420: Simple Linear Regression',
          
          sidebarPanel(
               
               # For LaTeX
               tags$head(tags$script(src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML-full", type = 'text/javascript'),
                         tags$script("MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});", type='text/x-mathjax-config')),
               # message
               h3('Demonstration of simple linear regression', align = 'center'),
               br(), 
               p('The outcome variable is University GPA. Choose the explanatory variable of your choice. The data are observed on', 
                 HTML('$n=105$'), 'students who graduated from a state university with a bachelor of science in computer 
                 science. More details about the data can be found ', a('here', target = '_blank',
                                                                        href = 'http://onlinestatbook.com/2/regression/intro.html')),
               
               br(), 
               
               # explanatory variable
               selectInput('xvar', 'Explanatory Variable', c('High School GPA' = 'high_GPA', 
                                                             'Mathematics SAT' = 'math_SAT', 
                                                             'Verbal SAT' = 'verb_SAT', 
                                                             'Total SAT' = 'total_SAT'))
               
               
               
          ),
          
          mainPanel(
               
               plotOutput('scatter')
               
               )
          
     )
)
