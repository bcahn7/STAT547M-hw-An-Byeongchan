library(tidyverse)

server <- function(input, output) {
  bcl_data <- read_csv("Data/bcl-data.csv")
  
  Filtered_bcl <- reactive({
    
    if (is.null(input$typeIn)) return(NULL)    
    Filtered_bcl <- bcl_data %>%
      filter(Price >= input$priceIn[1],
             Price <= input$priceIn[2],
             Type %in% input$typeIn)
    
    if(input$sortprc)
      Filtered_bcl <- arrange(Filtered_bcl, desc(Price))
    else Filtered_bcl <- Filtered_bcl
    
    
    if(input$typeIn != "WINE")
      Filtered_bcl <- Filtered_bcl
    else{
      if(input$wantsweetness){
        Filtered_bcl <- Filtered_bcl %>% 
          filter(Sweetness == input$sweetIn)
      }
      else Filtered_bcl <- Filtered_bcl
    }
    
    if(input$wantsubtype && !is.null(input$subtypeIn)){
      Filtered_bcl <- Filtered_bcl %>% 
        filter(Subtype %in% input$subtypeIn)
    }
    else Filtered_bcl <- Filtered_bcl
    
    
    if(input$countryIn != "***ALL COUNTRIES***"){
      Filtered_bcl <- Filtered_bcl %>%
      filter(Country == input$countryIn)
    }
    else Filtered_bcl <- Filtered_bcl
  })
  
#  subtype_list <- reactive({
#    subtype_list_temp <- bcl_data %>% 
#      filter(Price >= input$priceIn[1],
#             Price <= input$priceIn[2],
#             Type %in% input$typeIn)
#    
#    subtype_list <- sort(unique(subtype_list_temp$Subtype))
#    return(subtype_list)
#  })
  

  output$sweetchoicer <- renderUI({
    checkboxInput("wantsweetness", "Do you want to choose the sweetness of Wine?")
    
  })
  output$sweetofWine <- renderUI({
    sliderInput("sweetIn", "The sweetness of Wine",
                sort(unique(bcl_data$Sweetness)),
                selected= 5, multiple = TRUE)
    
  })
  
  output$subtypeOut <- renderUI({
    selectInput("subtypeIn", "Choose subtype",
                unique(filter(bcl_data, Price >= input$priceIn[1],
                                        Price <= input$priceIn[2],
                                        Type %in% input$typeIn)$Subtype),
                multiple = TRUE)

  })

  
  output$countryselOutput <- renderUI({
      selectInput("countryIn", "Choose country",
                  c("***ALL COUNTRIES***", sort(unique(bcl_data$Country))),
                  selected = "***ALL COUNTRIES***")
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