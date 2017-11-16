# 03_report



```r
suppressPackageStartupMessages(library(tidyverse))
```

```
## Warning: package 'tidyverse' was built under R version 3.4.2
```

```r
#Read Apple's and Amazon.com's historical stock data
aapl_data <- read_csv("aapl.csv")
```

```
## Parsed with column specification:
## cols(
##   Date = col_character(),
##   Open = col_double(),
##   High = col_double(),
##   Low = col_double(),
##   Close = col_double(),
##   Volume = col_integer()
## )
```

```r
amzn_data <- read_csv("amzn.csv")
```

```
## Parsed with column specification:
## cols(
##   Date = col_character(),
##   Open = col_double(),
##   High = col_double(),
##   Low = col_double(),
##   Close = col_double(),
##   Volume = col_integer()
## )
```

```r
#Read cumulative returns data
cum_rets <- read_csv("cum_rets_gathered.csv")
```

```
## Parsed with column specification:
## cols(
##   Date = col_date(format = ""),
##   Firm = col_character(),
##   cum_ret = col_double()
## )
```

I investigated the stock price and cumulative return changes for Apple and Amazon.com. I downloaded two datasets from `google finance` in `00_download-data.R`. I provided two figures on the price performance of each stock in `01_calculate_ret.R`.   
Each stock has different absolute value, so it is meaningless to compare them directly.  
  
## Apple's price performance in 2016   
This is the price performance of Apple's stock. The stock price decreased dramatically in May and June but it recovered later.  
  
### Plot
![](hw07_AAPL_prc.png)
  
### Summary statistics

```r
summary(aapl_data$Close)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   90.34   97.14  105.75  104.60  110.98  118.25
```


## Amazon's price performance in 2016
This is the price performance of Amazon's stock. The price decreased slightly in the beginning of the year 2016 but had an increasing tendency until October. Then, the price decreased slightly and fluctuated.  
  
### Plot
![](hw07_AMZN_prc.png)

### Summary statistics

```r
summary(amzn_data$Close)
```

```
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##   482.1   606.9   727.9   699.5   767.9   844.4
```
  
  
## Cumulative returns on both stocks
To compare two stocks' performance, I calculated the cumulative returns throughout the year, 2016. Cumulative return indicates the dollar amount you will get when you sell the stock given you invest \$1 in the beginning of the year. In January, the cumulative returns are similar. From February, Apple's stock returns more than Amazon's until the end of April. After then, Amazon's stock returns outperform Apple's. Thus, given \$1 invested, investor on Amazon's stock will get higher return anytime from May to the end of the year.   

### Plot
![](hw07_cum_ret.png)


### Summary statistics

```r
cum_rets %>%
  group_by(Firm) %>%
  summarize_each(funs(mean, min, median, max), cum_ret) %>% 
  knitr::kable()
```

```
## `summarise_each()` is deprecated.
## Use `summarise_all()`, `summarise_at()` or `summarise_if()` instead.
## To map `funs` over a selection of variables, use `summarise_at()`
```



Firm    cum_ret_mean   cum_ret_min   cum_ret_median   cum_ret_max
-----  -------------  ------------  ---------------  ------------
AAPL       0.9928907     0.8575225         1.004177      1.122449
AMZN       1.0985608     0.7567937         1.143032      1.325547

