library(tidyverse)
#install.packages('PerformanceAnalytics')
#library(PerformanceAnalytics)

#Read Apple's and Amazon.com's historical stock data
aapl_data <- read_csv("aapl.csv")
str(aapl_data)
amzn_data <- read_csv("amzn.csv")

#Function to convert %b into %m
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
amzn_data$Date <- month_convert(aapl_data$Date)
amzn_data$Date <- as.Date(aapl_data$Date, format = "%d-%m-%y")




# Function for calculating daily returns and cumulative returns
ret_func <- function(x){
  x %>% 
    select(Date, Close, Volume) %>% 
    rename(prc = Close, vol = Volume) %>% 
    arrange(Date) %>% 
    mutate(ret = (prc/lag(prc,1))-1) %>% 
    filter(!is.na(ret)) %>% 
    mutate(ret_cum = cumprod(ret+1))
}

# Calculating daily returns and cumulative returns for both stocks
aapl_ret <- ret_func(aapl_data)
amzn_ret <- ret_func(amzn_data)


# Merging two data to compare cumulative returns between firms
cum_ret_firms <- aapl_ret %>% 
  inner_join(amzn_ret, by= "Date") %>% 
  select(Date, ret_cum.x, ret_cum.y) %>%
  rename(ret_cum_aapl = ret_cum.x, ret_cum_amzn = ret_cum.y)
  
# Write the data in csv format (Cumulative returns for firms)
write_csv(cum_ret_firms, "cum_rets.csv")


# Plotting price performance on both stocks
# Two stock prices have different absolute value, so it is meaningless to compare them directly.

prc_aapl <- aapl_ret %>% 
  ggplot(aes(x= Date, y= prc)) +
  geom_line(color = "red") +
  theme_bw() +
  labs(x="Date",
       y="Apple's stock price(in $)",
       title = "The (closing) price of AAPL in 2016")

prc_amzn <- amzn_ret %>% 
  ggplot(aes(x= Date, y= prc)) +
  geom_line(color = "green") +
  theme_bw() +
  labs(x="Date",
       y="Amazon.com's stock price",
       title = "The (closing) price of AMZN in 2016")

ggsave("hw07_AAPL_prc.png",width = 10, scale = 1.5, dpi=200, plot = prc_aapl)
ggsave("hw07_AMZN_prc.png",width = 10, scale = 1.5, dpi=200, plot = prc_amzn)


