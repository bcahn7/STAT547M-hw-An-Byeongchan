# Stat547M hw10

[link to STAT547M-hw10-An-Byeongchan.md](STAT547M-hw10-An-Byeongchan.md)  


## Report my progress
- It was good to find a way to get data from the internet into R for analysis
- I got some troubles to clean the data but I think APIs provide quite intuitive and neat dataset. 
- As all the data downloaded were strings (chr type), I tried to convert them to numeric or Date type. I couldn't convert several columns (chr type) to numeric type simultaneously. I fixed it using `lapply(stock_dt3, function(x) as.numeric(x))`.
- At first, I tried to combine `gapminder` and data from `geonames` but it did not work well. I wish it would be successful when I try again.