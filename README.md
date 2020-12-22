README
================
Janice Ji
April 27, 2018

Overview
--------

`"dieroller"` is a minimal [R](http://www.r-project.org/) package that provides functions to simulate rolling a die.

-   `die()` creates a die object (of class `"die"`)
-   `roll()` tosses a die object, producing a `"roll"` object.
-   `plot()` method for a `"roll"` object to plot frequencies die rolls.
-   `summary()` method for a `"roll"` object.

Motivation
----------

This package has been developed as a part of a homework assignment to practicing creating an R package.

Usage
-----

``` r
library(dieroller)

# default die
fair_die <- die()
fair_die
#> object "die"
#> 
#>   side      prob
#> 1    1 0.1666667
#> 2    2 0.1666667
#> 3    3 0.1666667
#> 4    4 0.1666667
#> 5    5 0.1666667
#> 6    6 0.1666667

# 1 roll of fair_die
roll(fair_die)
#> object "roll"
#> 
#> $rolls
#> [1] 2

# 10 rolls of fair_die
roll10 <- roll(fair_die, times = 10)
roll10
#> object "roll"
#> 
#> $rolls
#>  [1] 1 5 3 5 4 1 6 6 2 3

# summary
summary(roll10)
#> summary "roll"
#> 
#>   side count prop
#> 1    1     2  0.2
#> 2    2     1  0.1
#> 3    3     2  0.2
#> 4    4     1  0.1
#> 5    5     2  0.2
#> 6    6     2  0.2


# 100 rolls
roll100 <- roll(fair_die, times = 100)

# summary
summary(roll100)
#> summary "roll"
#> 
#>   side count prop
#> 1    1    15 0.15
#> 2    2    23 0.23
#> 3    3    11 0.11
#> 4    4    18 0.18
#> 5    5    17 0.17
#> 6    6    16 0.16
```
