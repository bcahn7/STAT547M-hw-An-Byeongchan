all: 03_report.md hw07_AAPL_prc.png hw07_AMZN_prc.png hw07_cum_ret.png

clean:
	rm -f aapl.csv amzn.csv aapl_ret.csv cum_rets.csv cum_rets_gathered.csv *.png


#aapl.csv:
#	curl -L http://finance.google.com/finance/historical?cid=22144&startdate=Jan+1%2C+2016&enddate=Dec+31%2C+2016&num=200&ei=vDkNWqjyG8WYjAHR9Jb4Cw&output=csv >aapl.csv

aapl.csv amzn.csv:
	Rscript 00_download-data.R


cum_rets.csv: aapl.csv amzn.csv 01_calculate-ret.R
	Rscript 01_calculate-ret.R
hw07_AAPL_prc.png hw07_AMZN_prc.png: aapl.csv amzn.csv 01_calculate-ret.R
	Rscript 01_calculate-ret.R 


hw07_cum_ret.png: cum_rets.csv 02_cum_ret_plot.R
	Rscript 02_cum_ret_plot.R 
cum_rets_gathered.csv: cum_rets.csv 02_cum_ret_plot.R
	Rscript 02_cum_ret_plot.R 

#	rm Rplots.pdf

03_report.md: 03_report.Rmd cum_rets_gathered.csv aapl.csv amzn.csv
	Rscript -e "rmarkdown::render('03_report.Rmd')" cum_rets_gathered.csv aapl.csv amzn.csv