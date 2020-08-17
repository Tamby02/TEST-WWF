library(shiny)


shinyUI( pageWithSidebar(
  
  headerPanel("Deuxième exemple"), 
  
  sidebarPanel(
    
    textInput(inputId = "affichage du résumé approprié", 
              label = "sexe_single_fct",
              value = "Histogramme"),
    
    sliderInput("n_obs","Nombre d'observations souhaité :", 
                value = 25, 
                min = 1,
                max = 3) 
  ),
  
  mainPanel(
    
    h3("Résultats :"), 
    
    plotOutput("mon_histo")    
  )
  
))