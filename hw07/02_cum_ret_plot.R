library(tidyverse)

#Read the data with returns 
aapl_ret2 <- read_csv("aapl_ret.csv")
str(aapl_ret2)

#
p1 <- aapl_ret2 %>% 
  ggplot(aes(x= Date, y= ret_cum)) +
  geom_line(color = "blue") +
  theme_bw() +
  labs(x="Date",
       y="Cumulative Return",
       title = "Cumulative return on AAPL in 2016")

#ggsave("plots_saved/hw05_my_plot.pdf",width = 10, height = 6, plot = p1)
ggsave("hw07_AAPL_ret.png",width = 10, scale = 1.5, dpi=200, plot = p1)
