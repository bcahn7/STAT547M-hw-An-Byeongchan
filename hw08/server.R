library(tidyverse)

server <- function(input, output) {
  bcl_data <- read_csv("Data/bcl-data.csv")

  Filtered_bcl <- reactive({

    if (is.null(input$typeIn)) return(NULL)    
    bcl_data %>%
    filter(Price >= input$priceIn[1],
           Price <= input$priceIn[2],
           Type == input$typeIn)
  })

      
  output$Hist_AlcCont <- renderPlot({
    if(is.null(Filtered_bcl())) return(NULL)
    Filtered_bcl() %>% 
      ggplot() +
      aes(x = Alcohol_Content) +
      geom_histogram()
  })
  
  output$table <- DT::renderDataTable({  #instead of renderTable
    Filtered_bcl()
  }) 
  
  output$summary_text <- renderText({
    count_result <- Filtered_bcl() %>% 
      nrow()
    if(is.null(count_result)) count_result <- 0
    paste0("We found ", count_result, " options for you")
  })
  
  output$download <- downloadHandler(
    filename = function() {
      "bcl-results.csv"
      },
    content = function(con) {
      write.csv(Filtered_bcl(), con)
    })
}