
# Stat547M hw06

[link to STAT547M-hw06-An-Byeongchan.md](STAT547M-hw06-An-Byeongchan.md)  

 
[link to STAT547M-hw06-An-Byeongchan.Rmd](STAT547M-hw06-An-Byeongchan.Rmd)  
[link to STAT547M-hw06-An-Byeongchan.html](STAT547M-hw06-An-Byeongchan.html)

## Report my progress

- `lengths()` can be used to get the length of each element of a list or atomic vector as an integer or numeric vector. This can be replaced by `map_int(.x, length)` in `purrr` library.

- `map2()` has TWO inputs. 
- There's no `map3()` However, we can use `pmap(.l, .f, ...)`. `.l` is a list of lists


- `map2(longitude, latitude, ~ revgeocode(c(.x, .y), output = "address"))` When `revgeocode()` is used, all the observations with `NA` should be removed.