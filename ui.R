library(shiny)


shinyUI( pageWithSidebar(
  
  headerPanel("Deuxi�me exemple"), 
  
  sidebarPanel(
    
    textInput(inputId = "affichage du r�sum� appropri�", 
              label = "sexe_single_fct",
              value = "Histogramme"),
    
    sliderInput("n_obs","Nombre d'observations souhait� :", 
                value = 25, 
                min = 1,
                max = 3) 
  ),
  
  mainPanel(
    
    h3("R�sultats :"), 
    
    plotOutput("mon_histo")    
  )
  
))