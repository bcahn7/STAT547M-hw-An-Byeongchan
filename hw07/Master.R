#Automate the pipeline
## one script to rule them all

## clean out any previous work
outputs <- c("aapl.csv", "amzn.csv",          # 00_download-data.R
             "cum_rets.csv",                  # 01_calculate-ret.R
             "cum_rets_gathered.csv",          # 02_cum_ret_plot.R
             list.files(pattern = "*.png$"))
file.remove(outputs)


## run my scripts
source("00_download-data.R")
source("01_calculate-ret.R")
source("02_cum_ret_plot.R")
rmarkdown::render('03_report.Rmd')
