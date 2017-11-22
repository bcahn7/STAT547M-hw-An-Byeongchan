
# Stat547M hw08

## Building Shiny apps
[link to hw08 (online URL)](https://bcahn7.shinyapps.io/My_app/)

  
[link to hw08 `ui.R`](ui.R)    
[link to hw08 `server.R`](server.R)    

[link to hw08 `app.R`](app.R)   
  
    
    
## Features done in hw08 

- [x] Add an image of the BC Liquor Store to the UI.
    - **Hint:** Place the image in a folder named `www`, and use `img(src = "imagename.png")` to add the image.

- [x] Use the `DT` package to turn the current results table into an interactive table.
    - **Hint:** Install the `DT` package, replace `tableOutput()` with `DT::dataTableOutput()` and replace `renderTable()` with `DT::renderDataTable()`.

- [x] The app currently behaves strangely when the user selects filters that return 0 results. For example, try searching for wines from Belgium. There will be an empty plot and empty table generated, and there will be a warning message in the R console. Try to figure out why this warning message is appearing, and how to fix it.
    - **Hint:** The problem happens because `renderPlot()` and `renderTable()` are trying to render an empty data frame. To fix this issue, the `filtered` reactive expression should check for the number of rows in the filtered data, and if that number is 0 then return `NULL` instead of a 0-row data frame.

- [x] Place the plot and the table in separate tabs.
    - **Hint:** Use `tabsetPanel()` to create an interface with multiple tabs.

- [x] Show the number of results found whenever the filters change. For example, when searching for Italian wines $20-$40, the app would show the text "We found 122 options for you".
    - **Hint:** Add a `textOutput()` to the UI, and in its corresponding `renderText()` use the number of rows in the `filtered()` object.

- [x] Allow the user to download the results table as a .`.csv` file.
    - **Hint:** Look into the `downloadButton()` and `downloadHandler()` functions.


- [x] Allow the user to search for multiple alcohol types simultaneously, instead of being able to choose only wines/beers/etc.
    - **Hint:** There are two approaches to do this. Either change the `typeInput` radio buttons into checkboxes (`checkboxGroupInput()`) since checkboxes support choosing multiple items, or change `typeInput` into a select box (`selectInput()`) with the argument `multiple = TRUE` to support choosing multiple options.
  
    
    
- [ ] Add an option to sort the results table by price.
    - **Hint:** Use `checkboxInput()` to get TRUE/FALSE values from the user.
- [ ] When the user wants to see only wines, show a new input that allows the user to filter by sweetness level. Only show this input if wines are selected.
    - **Hint:** Create a new input function for the sweetness level, and use it in the server code that filters the data. Use `conditionalPanel()` to conditionally show this new input. The `condition` argument of `conditionalPanel` should be something like `input.typeInput == "WINE"`.
- [ ] If you look at the dataset, you'll see that each product has a "type" (beer, wine, spirit, or refreshment) and also a "subtype" (red wine, rum, cider, etc.). Add an input for "subtype" that will let the user filter for only a specific subtype of products. Since each type has different subtype options, the choices for subtype should get re-generated every time a new type is chosen. For example, if "wine" is selected, then the subtypes available should be white wine, red wine, etc.
    - **Hint:** Use `uiOutput()` to create this input in the server code.





## Report my progress
- It was good to have an opportunity to apply what I learned into Finance.
- `cumprod()` makes it easy to calculate cumulative returns.
- Making use of `function()`s reduces repetitive works.
- When converting `strings` to `dates` using `as.Date()`, it could not recognize `%b` (Jan, Feb, ...) format ( I don't know why). So, I just replaced it with each month with number (`%m` format).
- For me, it was harder to handle with `Makefile`. `Master.R` seems to be more intuitive to me. I had a lot of trials and errors to complete my `Makefile`. 



