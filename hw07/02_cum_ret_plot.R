library(tidyverse)

#Read the data with cumulative returns (two firms) 
cum_rets <- read_csv("cum_rets.csv")
str(cum_rets)


# Preparing data for plotting together
cum_rets2 <- cum_rets %>% 
  rename(AAPL = ret_cum_aapl, AMZN = ret_cum_amzn) %>% 
  gather(key ="Firm", value = "cum_ret", AAPL, AMZN)



#Plot the cumulative returns
p_cumrets <- cum_rets2 %>% 
  ggplot(aes(x= Date, y= cum_ret, color= Firm)) +
  geom_line() +
  theme_bw() +
  labs(x="Date",
       y="Cumulative Return",
       title = "Cumulative return on AAPL and AMZN in 2016")


#ggsave("plots_saved/hw05_my_plot.pdf",width = 10, height = 6, plot = p1)
ggsave("hw07_cum_ret.png",width = 10, scale = 1.5, dpi=200, plot = p_cumrets)


# Write the data in csv format (Cumulative returns(gathered) for firms)
write_csv(cum_rets2, "cum_rets_gathered.csv")


