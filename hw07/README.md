
# Stat547M hw07

## Automating the pipeline
### 1. Write a master R script   
I wrote a master R script that simply `source()`s the scripts and renders my RMarkdown report. 
[link to hw07 Master.R](Master.R)  
  
### 2. Write a `Makefile`
I wrote a `Makefile` to automate my pipeline using `make`. 
[link to hw07 Makefile](Makefile)  
  
### Process
[link to hw07 00_download-data.R](00_download-data.R)   
  - Downloaded two datasets from `google finance` and saved it as `csv` file.  
  
[link to hw07 01_calculate_ret.R](01_calculate_ret.R)    
  - I made functions to transform the datasets for calculating daily returns and cumulative returns.   
  - This is the preparation for comparison.   
  
[link to hw07 02_cum_ret_plot.R](02_cum_ret_plot.R)    
  - This is to produce a plot to compare the cumulative returns   
     
[link to hw07 03_report.md](03_report.md)   
  - This is my `report.md` file. I aggregate all the figures I need and make some comments on them.   

  

## Report my progress
- It was good to have an opportunity to apply what I learned into Finance.
- `cumprod()` makes it easy to calculate cumulative returns.
- Making use of `function()`s reduces repetitive works.
- When converting `strings` to `dates` using `as.Date()`, it could not recognize `%b` (Jan, Feb, ...) format ( I don't know why). So, I just replaced it with each month with number (`%m` format).
- For me, it was harder to handle with `Makefile`. `Master.R` seems to be more intuitive to me. I had a lot of trials and errors to complete my `Makefile`. 



