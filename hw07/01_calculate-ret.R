library(tidyverse)
#install.packages('PerformanceAnalytics')
#library(PerformanceAnalytics)

#Read Apple's historical stock data
aapl_data <- read_csv("aapl.csv")
str(aapl_data)


#Converting %b into %m
month_convert <- function(x){
  mon <- data.frame(b= c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"),
                    m= c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"))
    for (i in 1:nrow(mon))
      x <- gsub(mon[i, "b"], mon[i, "m"], x)
    return (x)
}

#Converting the strings to dates format (Date)
aapl_data$Date <- month_convert(aapl_data$Date)
aapl_data$Date <- as.Date(aapl_data$Date, format = "%d-%m-%y")


# Calculating daily returns and cumulative returns
aapl_ret <- aapl_data %>% 
  select(Date, Close, Volume) %>% 
  rename(prc = Close, vol = Volume) %>% 
  arrange(Date) %>% 
  mutate(ret = (prc/lag(prc,1))-1) %>% 
  filter(!is.na(ret)) %>% 
  mutate(ret_cum = cumprod(ret+1))

# Write the data in csv format
write_csv(aapl_ret, "aapl_ret.csv")
