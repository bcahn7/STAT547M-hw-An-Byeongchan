
# Stat547M hw06

[link to STAT547M-hw06-An-Byeongchan.md](STAT547M-hw06-An-Byeongchan.md)  

 
[link to STAT547M-hw06-An-Byeongchan.Rmd](STAT547M-hw06-An-Byeongchan.Rmd)  
[link to STAT547M-hw06-An-Byeongchan.html](STAT547M-hw06-An-Byeongchan.html)

## Report my progress

- `lengths()` can be used to get the length of each element of a list or atomic vector as an integer or numeric vector. This can be replaced by `map_int(.x, length)` in `purrr` library.

- `map2()` has TWO inputs. 
- There's no `map3()` However, we can use `pmap(.l, .f, ...)`. `.l` is a list of lists


- `map2(longitude, latitude, ~ revgeocode(c(.x, .y), output = "address"))` When `revgeocode()` is used, all the observations with `NA` should be removed.

- The problem I got in was when I extract each element in address information using `output = "more"`, it returns full name of states. What I wanted was state abbreviations for comparing with `singer_loc4$city` (when `output = "address"` is used, the state names are in abbreviations.). I fixed this with `state.abb[grep(.x, state.name)]`

- `map()` functions could be useful to do a row operation.

- This code works on html but make a long, long lines on md file so I make it as comment.
```R
#install.packages('leaflet')
library(leaflet)
singer_locations %>%  
  leaflet()  %>%   
  addTiles() %>%  
  addCircles(popup = ~artist_name)
```