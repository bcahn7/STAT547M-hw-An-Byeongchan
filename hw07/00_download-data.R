
#Download Apple's historical stock returns from Jan-01-2016 to Dec-31-2016 (from google finance) 
download.file("http://finance.google.com/finance/historical?cid=22144&startdate=Jan+1%2C+2016&enddate=Dec+31%2C+2016&num=200&ei=vDkNWqjyG8WYjAHR9Jb4Cw&output=csv", destfile = "aapl.csv")

#Download Amazon.com's historical stock returns from Jan-01-2016 to Dec-31-2016 (from google finance) 
download.file("http://finance.google.com/finance/historical?cid=660463&startdate=Jan+1%2C+2016&enddate=Dec+31%2C+2016&num=30&ei=3Z8NWujyBoGJ2Abo75mQDQ&output=csv", destfile = "amzn.csv")
