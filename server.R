library(shiny)

shinyServer( function(input, output) { 
  
  output$mon_histo <- renderPlot({ 
    
    set.seed(123) 
    x = rnorm(input$n_obs) 
    hist(x, xlab = "x", ylab = "Fr�quence",
         testdata1 = input$SEXE_SINGLE_FCT, 
         col = "skyblue", border = "white")
  })
  
})