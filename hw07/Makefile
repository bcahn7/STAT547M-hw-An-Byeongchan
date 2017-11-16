all: hw07_AAPL_ret.png

clean:
	rm -f aapl.csv aapl_ret.csv *.png


#aapl.csv:
#	curl -L http://finance.google.com/finance/historical?cid=22144&startdate=Jan+1%2C+2016&enddate=Dec+31%2C+2016&num=200&ei=vDkNWqjyG8WYjAHR9Jb4Cw&output=csv >aapl.csv

aapl.csv:
	Rscript 00_download-data.R

aapl_ret.csv: aapl.csv 01_calculate-ret.R
	Rscript 01_calculate-ret.R


hw07_AAPL_ret.png: aapl_ret.csv 02_cum_ret_plot.R
	Rscript 02_cum_ret_plot.R
#	rm Rplots.pdf

