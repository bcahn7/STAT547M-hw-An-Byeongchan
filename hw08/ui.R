ui <- fluidPage(
  
  # Application title
  titlePanel("My liquor webpage (STAT547M hw08)"),
  
  sidebarPanel(h4("This is my sidebar"),
               
               sliderInput("priceIn", "Price of booze",
                           min = 0, max = 300, 
                           value = c(10,30), pre = "CAD"),
               checkboxGroupInput("typeIn", "What kind of booze?",
                                  choices = c("BEER","SPIRITS", "WINE", "REFRESHMENT"),
                                  selected = "SPIRITS"),
               br(),
               conditionalPanel(condition = "input.typeIn=='WINE'",
                                uiOutput("sweetchoicer")),
               conditionalPanel(condition = "input.wantsweetness && input.typeIn=='WINE'",
                                uiOutput("sweetofWine")),
               br(), br(),
               checkboxInput("wantsubtype", "Subtype Detail"),
               conditionalPanel(condition = "input.wantsubtype",
                                uiOutput("subtypeOut")),
               br(),
               uiOutput("countryselOutput"),
               br(),
               checkboxInput("sortprc", "sort the results by price"),
               img(src = "BC_liquor.png", width = "100%")),
  
  mainPanel(h3(textOutput("summary_text")),
            downloadButton("download", "Download results"),
            br(), br(), br(),
            
            tabsetPanel(
              tabPanel("Plot", plotOutput("Hist_AlcCont")),
              #br(),br(),
              #tableOutput("table")
              tabPanel("Table", DT::dataTableOutput("table")))
  )
)