
# Stat547M hw09

## Writing an R package
[link to the repository of hw09](https://github.com/bcahn7/STAT547M-hw09-powers)  


## Report my progress
- It would be useful to build my own R package to customize for more efficient work. 
- I've tried to make functions such as `square`, `cube`, `four`, and `reciprocal`. Those functions calculate square, cube, the fourth power, and reciprocal respectively, given a vector. They are able to print out a plot when the argument `plot_it` = TRUE (The default value is FALSE). In addition, they can remove `NA`s when the argument `na.omit` = TRUE (The default value is FALSE).
- Also, there's a function `boxcoxt` which print out the one-parameter Box-Cox transformation. This function does not calculate the optimal lambda value. Using `boxcox()` in the `MASS` package is recommended for the optimal lambda. The default value of lambda is 0.1
- When I made a `boxcoxt` function, I originally tried to calculate the optimal lambda which leads to the highest log-likelihood. I tried to import `MASS` package to calculate each log-likelihood corresponding to each lambda value to calculate the optimal lambda value. However, I got in trouble with putting `argument` in `boxcoxt()`. I couldn't deal with the arguments in `boxcox()`. One example of `boxcox()` is `boxcox(Volume ~ log(Height) + log(Girth), data = trees, lambda = seq(-0.25, 0.25, length = 10))`. I had no idea how to put the form of `(y ~ x , data = something, ...)` in my function `boxcoxt()`

