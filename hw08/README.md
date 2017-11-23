
# Stat547M hw08

## Building Shiny apps
[link to hw08 (online URL)](https://bcahn7.shinyapps.io/My_app/)

  
[link to hw08 `ui.R`](ui.R)    
[link to hw08 `server.R`](server.R)    

[link to hw08 `app.R`](app.R)   
  
    
    
## 11 Features done in hw08 

- [x] Add an image of the BC Liquor Store to the UI.(**Hint:** Place the image in a folder named `www`, and use `img(src = "imagename.png")` to add the image.)
    - ***I added an image of the BC Liquor Store on the sidebar***
  
- [x] Use the `DT` package to turn the current results table into an interactive table.(**Hint:** Install the `DT` package, replace `tableOutput()` with `DT::dataTableOutput()` and replace `renderTable()` with `DT::renderDataTable()`.)
    - ***I used `DT` package to make the table interactive. The table has options to select the number of entries shown in each page, to search, and to sort items for each category***
- [x] The app currently behaves strangely when the user selects filters that return 0 results. For example, try searching for wines from Belgium. There will be an empty plot and empty table generated, and there will be a warning message in the R console. Try to figure out why this warning message is appearing, and how to fix it. (**Hint:** The problem happens because `renderPlot()` and `renderTable()` are trying to render an empty data frame. To fix this issue, the `filtered` reactive expression should check for the number of rows in the filtered data, and if that number is 0 then return `NULL` instead of a 0-row data frame.)
    - ***I fixed the problem which occurs when the user selects filters that return 0 results. I used `if(is.null()) return(NULL)` to fix this problem***

- [x] Place the plot and the table in separate tabs.(**Hint:** Use `tabsetPanel()` to create an interface with multiple tabs.)
    - ***I used `tabsetPanel()` within `mainPanel()` to create an interface with multiple tabs within `mainPanel()`***

- [x] Show the number of results found whenever the filters change. For example, when searching for Italian wines $20-$40, the app would show the text "We found 122 options for you". (**Hint:** Add a `textOutput()` to the UI, and in its corresponding `renderText()` use the number of rows in the `filtered()` object.)
    - ***I used `textOutput()`, `renderText()` to print out the number of results found. I added `if(is.null(count_result)) count_result <- 0` to print out "0" when there is no input.*** 
- [x] Allow the user to download the results table as a .`.csv` file. (**Hint:** Look into the `downloadButton()` and `downloadHandler()` functions.)
    - ***When `Download results` is clicked, filtered dataset (Table) is downloaded as `bcl-results.csv`***

- [x] Allow the user to search for multiple alcohol types simultaneously, instead of being able to choose only wines/beers/etc. (**Hint:** There are two approaches to do this. Either change the `typeInput` radio buttons into checkboxes (`checkboxGroupInput()`) since checkboxes support choosing multiple items, or change `typeInput` into a select box (`selectInput()`) with the argument `multiple = TRUE` to support choosing multiple options.)
    - ***I chose `checkboxGroupInput()` to allow for multiple alcohol types choice***
    
   
   
### Features I got in trouble (They were done at the end)   
- [x] Add an option to sort the results table by price. (**Hint:** Use `checkboxInput()` to get TRUE/FALSE values from the user.)
    - ***I added an option to sort the results table by price on the sidebar***
- [x] When the user wants to see only wines, show a new input that allows the user to filter by sweetness level. Only show this input if wines are selected. (**Hint:** Create a new input function for the sweetness level, and use it in the server code that filters the data. Use `conditionalPanel()` to conditionally show this new input. The `condition` argument of `conditionalPanel` should be something like `input.typeInput == "WINE"`.)
    - ***When the user selects ONLY wines, a new select box appears. When the user checks the checkbox ("Do you want to choose the sweetness of Wine?"), selectbox appears. Then, the user can see the filtered data according to their choice (Multiple choice is available)***
- [x] If you look at the dataset, you'll see that each product has a "type" (beer, wine, spirit, or refreshment) and also a "subtype" (red wine, rum, cider, etc.). Add an input for "subtype" that will let the user filter for only a specific subtype of products. Since each type has different subtype options, the choices for subtype should get re-generated every time a new type is chosen. For example, if "wine" is selected, then the subtypes available should be white wine, red wine, etc.(**Hint:** Use `uiOutput()` to create this input in the server code.)
    - ***There's a checkbox saying "Subtype Detail" on the sidebar. When it is checked, the user can choose subtype according to the choice of types. (The choices of subtype are re-generated every time a new type is chosen. Multiple choice is available.)***

- [x] Provide a way for the user to show results from *all* countries (instead of forcing a filter by only one specific country).(**Hint:** There are two ways to approach this. You can either add a value of "All" to the dropdown list of country options, you can include a checkbox for "Filter by country" and only show the dropdown when it is unchecked (see [my version of this app](http://daattali.com/shiny/bcl/) to see this option in action). In both cases you'll still need to update the server code appropriately to filter by country only when the user chooses to.)
    -  ***I added a value of "ALL COUNTRIES" to the dropdown list of country options so that the user can see results from all countries. Showing all the results by including a checkbox is used in the choice of Wine sweetness and the subtype detail choice.***
  
   
## Features to be tried

- Add parameters to the plot.
    - **Hint:** You will need to add input functions that will be used as parameters for the plot. You could use `shinyjs::colourInput()` to let the user decide on the colours of the bars in the plot.
    
- If you know CSS, add CSS to make your app look nicer.
    - **Hint:** Add a CSS file under `www` and use the function `includeCSS()` to use it in your app.

- Experiment with packages that add extra features to Shiny, such as `shinyjs`, `leaflet`, `shinydashboard`, `shinythemes`, `ggvis`.
    - **Hint:** Each package is unique and has a different purpose, so you need to read the documentation of each package in order to know what it provides and how to use it.



## Report my progress
- I could understand how server.R and ui.R work. `UI` is responsible for creating the layout of the app and deploying each input and output. The `server` is responsible for the logic of the app. 
- [Dean's version of this app](http://daattali.com/shiny/bcl/) was really helpful to add various features on the app.
- [Shiny cheatsheet](http://shiny.rstudio.com/images/shiny-cheatsheet.pdf) was also useful.

- When creating an interface with multiple tabs using `tabsetPanel()`, I put `tabsetPanel()` to be parallel to `sidebarPanel` and `mainPanel`. Then, the layout became unorganized. So, I tried to put `tabsetPanel()` within `mainPanel` to make it neater.  
- When I tried to filter data bcl_data according to different kinds of inputs, I got in trouble. Firstly, I tried to piping them using `if` and `%>%`. However, it didn't work. And then I tried to assign all the filtered data to Filtered_bcl using `if`.  
```
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

```
- When I tried to use `if` to solve the problem, it did not work without putting `else Filtered_bcl <- Filtered_bcl` after every `if`. It didn't make sense to me because when the argument within `if` is not fulfilled, there should be no change and `else Filtered_bcl <- Filtered_bcl` sounds redundant to me. I still do not understand it.

- When I made a select box for the choice of subtypes, I used this code.
```
output$subtypeOut <- renderUI({
    selectInput("subtypeIn", "Choose subtype",
                unique(filter(bcl_data, Price >= input$priceIn[1],
                                        Price <= input$priceIn[2],
                                        Type %in% input$typeIn)$Subtype),
                multiple = TRUE)
```
Firstly, I tried to make a `subtype_list` using `reactive({})` and put it in the `choice` argument. However, it did not work so I just put `unique(filter(bcl_data, Price >= input$priceIn[1], Price <= input$priceIn[2], Type %in% input$typeIn)$Subtype)` in the `choice` argument.
``` 
subtype_list <- reactive({
   subtype_list_temp <- bcl_data %>%
     filter(Price >= input$priceIn[1],
            Price <= input$priceIn[2],
            Type %in% input$typeIn)

   subtype_list <- sort(unique(subtype_list_temp$Subtype))
   return(subtype_list)
 })
```
