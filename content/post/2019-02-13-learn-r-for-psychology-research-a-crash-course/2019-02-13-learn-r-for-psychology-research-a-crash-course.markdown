---
title: 'Learn R for Psychology Research: A Crash Course'
author: 'Nick Michalak'
date: '2019-02-13'
slug: learn-r-for-psychology-research-a-crash-course
categories:
  - tutorial
  - demonstration
  - R
tags:
  - tutorial
  - demonstration
  - R
image:
  caption: ''
  focal_point: ''
---

# Introduction
> I wrote this for psychologists who want to learn how to use R in their research **right now.** What does a psychologist need to know to use R to import, wrangle, plot, and model their data today? Here we go.

# Foundations: People and their resources that inspired me.
> * Dan Robinson [[**.html**](http://varianceexplained.org/r/teach-tidyverse/)] convinced me that beginneRs should learn tidyverse first, not Base R. This tutorial uses tidyverse. All you need to know about the differnece is in his blog post. If you've learned some R before this, you might understand that difference as you go through this tutorial.
> * If you want a more detailed introduction to R, start with R for Data Science (Wickham & Grolemund, 2017) [[**.html**](http://r4ds.had.co.nz/)]. The chapters are short, easy to read, and filled with simple coding examples that demonstrate big principles. And **it's free.**
> * Hadley Wickham is a legend in the R community. He's responsible for the tidyverse, including ggplot2. Read his books and papers (e.g., [**Wickham, 2014**](http://vita.had.co.nz/papers/tidy-data.html)). Watch his talks (e.g., [**ReadCollegePDX, October 19, 2015**](https://youtu.be/K-ss_ag2k9E?list=PLNtpLD4WiWbw9Cgcg6IU75u-44TrrN3A4)). He's profoundly changed how people think about structuring and visualizing data.

# Need-to-Know Basics

## Install R and R Studio (you need both in that order)
> * Installing R ([**Macintosh**](https://stats.idre.ucla.edu/r/icu/installing-r-for-macintosh/) / [**Windows**](https://stats.idre.ucla.edu/r/icu/installing-r-for-windows/))
> * Uninstalling R ([**Macintosh**](https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Uninstalling-under-macOS) / [**Windows**](https://cran.r-project.org/doc/manuals/r-release/R-admin.html#Uninstallation))
> * Installing R Studio [[**.html**](https://www.rstudio.com/products/rstudio/download/)]
> * Uninstalling R Studio [[**.html**](https://support.rstudio.com/hc/en-us/articles/200554736-How-To-Uninstall-RStudio-Desktop)]

## Understand all the panels in R Studio
![Four panels in R Studio](/post/nrg03/nrg03_files/r_studio_panels_tutorial.png)

## Packages: They're like apps you download for R
> "Packages are collections of R functions, data, and compiled code in a well-defined format. The directory where packages are stored is called the library. R comes with a standard set of packages. Others are available for download and installation. Once installed, they have to be loaded into the session to be used." [[**.html**](https://www.statmethods.net/interface/packages.html)]


```r
# before you can load these libraries, you need to install them first (remove the # part first):
# install.packages("tidyverse")
# install.packages("haven")
# install.packages("psych")
# install.packages("car")

library(tidyverse)
library(haven)
library(psych)
library(car)
```

## Objects: They save stuff for you
> "`object <- fuction(x)`, which means 'object is created from function(x)'. An object is anything created in R. It could be a variable, a collection of variables, a statistical model, etc. Objects can be single values (such as the mean of a set of scores) or collections of information; for example, when you run an analysis, you create an object that contains the output of that analysis, which means that this object contains many different values and variables. Functions are the things that you do in R to create your objects."  
Field, A., Miles., J., & Field, Z. (2012). Discovering statistics using R. London: SAGE Publications. [[**.html**](https://us.sagepub.com/en-us/nam/discovering-statistics-using-r/book236067)]

## `c()` Function: Combine things like thing1, thing2, thing3, ...
> "c" stands for combine. Use this to combine values into a vector. "A vector is a sequence of data 'elements' of the same basic type." [[**.html**](http://www.r-tutor.com/r-introduction/vector)]
> Below, we create an object called five_numbers. We are naming it for what it is, but we could name it whatever we want: some_numbers, maple_tree, platypus. It doesn't matter. We'll use this in the examples in later chunks of code.


```r
# read: combine 1, 2, 3, 4, 5 and "save to", <-, five_numbers
five_numbers <- c(1, 2, 3, 4, 5)

# print five_numbers by just excecuting/running the name of the object
five_numbers
```

```
## [1] 1 2 3 4 5
```

## R Help: `help()` and `?`
> "The help() function and ? help operator in R provide access to the documentation pages for R functions, data sets, and other objects, both for packages in the standard R distribution and for contributed packages. To access documentation for the standard lm (linear model) function, for example, enter the command help(lm) or help("lm"), or ?lm or ?"lm" (i.e., the quotes are optional)." [[**.html**](https://www.r-project.org/help.html)]

## Piping, `%>%`: Write code kinda like you write sentences
> The `%>%` operator allows you to "pipe" a value forward into an expression or function; something along the lines of x `%>%` f, rather than f(x). See the magrittr page [[**.html**](http://magrittr.tidyverse.org/articles/magrittr.html)] for more details, but check out these examples below.

## Compute z-scores for those five numbers, called five_numbers
> * see help(scale) for details


```r
five_numbers %>% scale()
```

```
##            [,1]
## [1,] -1.2649111
## [2,] -0.6324555
## [3,]  0.0000000
## [4,]  0.6324555
## [5,]  1.2649111
## attr(,"scaled:center")
## [1] 3
## attr(,"scaled:scale")
## [1] 1.581139
```

## Compute Z-scores for five_numbers and then convert the result into only numbers
> * see help(as.numeric) for details


```r
five_numbers %>% scale() %>% as.numeric()
```

```
## [1] -1.2649111 -0.6324555  0.0000000  0.6324555  1.2649111
```

## Compute z-scores for five_numbers and then convert the result into only numbers and then compute the mean
> * see help(mean) for details


```r
five_numbers %>% scale() %>% as.numeric() %>% mean()
```

```
## [1] 0
```

## Tangent: most R introductions will teach you to code the example above like this:


```r
mean(as.numeric(scale(five_numbers)))
```

```
## [1] 0
```

> * I think this code is counterintuitive. You're reading the current sentence from left to right. That's how I think code should read like: how you read sentences. Forget this "read from the inside out" way of coding for now. You can learn the "read R code inside out" way when you have time and feel motivated to learn harder things. I'm assuming you don't right now.

## Functions: they do things for you
> "A function is a piece of code written to carry out a specified task; it can or can not accept arguments or parameters and it can or can not return one or more values." Functions **do** things for you. [[**.html**](https://www.datacamp.com/community/tutorials/functions-in-r-a-tutorial#what)]

## Compute the num of five_numbers
> * see help(sum) for details


```r
five_numbers %>% sum()
```

```
## [1] 15
```

## Compute the length of five_numbers
> * see help(length) for details


```r
five_numbers %>% length()
```

```
## [1] 5
```

## Compute the sum of five_numbers and divide by the length of five_numbers
> * see help(Arithmetic) for details


```r
five_numbers %>% sum() / five_numbers %>% length()
```

```
## [1] 3
```

## Define a new function called compute_mean


```r
compute_mean <- function(some_numbers) {
  some_numbers %>% sum() / some_numbers %>% length()
}
```

## Compute the mean of five_numbers


```r
five_numbers %>% compute_mean()
```

```
## [1] 3
```

## Tangent: Functions make assumptions; know what they are

### What is the mean of 5 numbers and a unknown number, NA?
> * see help(NA) for details


```r
c(1, 2, 3, 4, 5, NA) %>% mean()
```

```
## [1] NA
```

> Is this what you expected? Turns out, this isn’t a quirky feature of R. R was designed by statisticians and mathematicians. `NA` represents a value that is unknown. Ask yourself, what is the sum of an unknown value and 17? If you don’t know the value, then you don’t know the value of adding it to 17 either. The `mean()` function gives `NA` for this reason: the mean of 5 values and an unknwon value is `NA`; it’s unknown; it’s not available; it's missing. When you use functions in your own research, think about what the functions “assume” or “know”; ask, "What do I want the function to do? What do I expect it to do? Can the function do what I want with the information I gave it?"

### Tell the `mean()` function to remove missing values


```r
c(1, 2, 3, 4, 5, NA) %>% mean(na.rm = TRUE)
```

```
## [1] 3
```

# Create data for psychology-like examples
> This is the hardest section of the tutorial. Keep this is mind: we're making variables that you might see in a simple psychology dataset, and then we're going to combine them into a dataset. Don't worry about specifcs too much. If you want to understand how a function works, use ?name_of_function or help(name_of_function).

## Subject numbers
> * read like this: generate a sequence of values from 1 to 100 by 1
> * see help(seq) for details


```r
subj_num <- seq(from = 1, to = 100, by = 1)

# print subj_num by just excecuting/running the name of the object
subj_num
```

```
##   [1]   1   2   3   4   5   6   7   8   9  10  11  12  13  14  15  16  17
##  [18]  18  19  20  21  22  23  24  25  26  27  28  29  30  31  32  33  34
##  [35]  35  36  37  38  39  40  41  42  43  44  45  46  47  48  49  50  51
##  [52]  52  53  54  55  56  57  58  59  60  61  62  63  64  65  66  67  68
##  [69]  69  70  71  72  73  74  75  76  77  78  79  80  81  82  83  84  85
##  [86]  86  87  88  89  90  91  92  93  94  95  96  97  98  99 100
```

> See those numbers on the left hand side of the output above? Those help you keep track of a sequence (i.e., line) of elements as the output moves to each new line. This is obvious in the example above because numbers correspond exactly to their position. But if these were letters or random numbers, that index or position (e.g., [14] "N") tells you the position of that element in the line.

## Condition assignments
> * read like this: replicate each element of c("control", "manipulation") 50 times, and then turn the result into a factor
> * side: in R, factors are nominal variables (i.e., integers) with value labels (i.e., names for each integer).
> * see help(rep) and help(factor) for details


```r
condition <- c("control", "manipulation") %>% rep(each = 50) %>% factor()

# print condition by just excecuting/running the name of the object
condition
```

```
##   [1] control      control      control      control      control     
##   [6] control      control      control      control      control     
##  [11] control      control      control      control      control     
##  [16] control      control      control      control      control     
##  [21] control      control      control      control      control     
##  [26] control      control      control      control      control     
##  [31] control      control      control      control      control     
##  [36] control      control      control      control      control     
##  [41] control      control      control      control      control     
##  [46] control      control      control      control      control     
##  [51] manipulation manipulation manipulation manipulation manipulation
##  [56] manipulation manipulation manipulation manipulation manipulation
##  [61] manipulation manipulation manipulation manipulation manipulation
##  [66] manipulation manipulation manipulation manipulation manipulation
##  [71] manipulation manipulation manipulation manipulation manipulation
##  [76] manipulation manipulation manipulation manipulation manipulation
##  [81] manipulation manipulation manipulation manipulation manipulation
##  [86] manipulation manipulation manipulation manipulation manipulation
##  [91] manipulation manipulation manipulation manipulation manipulation
##  [96] manipulation manipulation manipulation manipulation manipulation
## Levels: control manipulation
```

## Dependent Measure

### Save 5 values that represent the sample sizes and the true means and standard deviations of our pretend conditions


```r
sample_size <- 50
control_mean <- 2.5
control_sd <- 1
manip_mean <- 5.5
manip_sd <- 1
```

### Introduce a neat function in R: `rnorm()`
> rnorm stands for random normal. Tell it sample size, true mean, and the true sd, and it'll draw from that normal population at random and spit out numbers.
> * see help(rnorm) for details


```r
# for example
rnorm(n = 10, mean = 0, sd = 1)
```

```
##  [1]  0.1201711  1.4724076 -0.8785715  2.0589697  1.1931615 -0.1810291
##  [7] -0.5746914 -0.4222384  0.2595921  1.2991821
```

### Randomly sample from our populations we made up above


```r
control_values <- rnorm(n = sample_size, mean = control_mean, sd = control_sd)

manipulation_values <- rnorm(n = sample_size, mean = manip_mean, sd = manip_sd)
```

### Combine those and save as our dependent variable


```r
dep_var <- c(control_values, manipulation_values)

# print dep_var by just excecuting/running the name of the object
dep_var
```

```
##   [1]  2.6266967  2.4268506  2.5198358  3.0744083  3.4428332  1.1517651
##   [7]  4.1634368  0.9792586  3.0564291  0.9372177  3.9458511  5.3212025
##  [13]  2.6606305  2.1179866  0.6165126  2.0463547  1.9209426  1.8922180
##  [19]  0.9982987  4.6339006 -0.3023760  3.3792063  1.4675704  1.6744008
##  [25]  1.7108909  3.3165884  1.7665045  1.3116656  3.5692316  1.9366817
##  [31]  1.3506779  0.2187977  1.9109686  2.0586680  2.7304222  2.1447997
##  [37]  1.3116138  3.7884212  3.2713511  1.0164018  2.9832019  2.0609438
##  [43]  2.7445625  2.3758348  1.9729377  1.5034472  3.2355519  4.5145181
##  [49]  1.6723182  3.3927650  6.3080559  7.2000444  6.4242514  6.3638079
##  [55]  4.8482565  6.0081382  4.8089594  6.2472058  4.7911248  4.8048396
##  [61]  5.0367751  6.5338761  6.0014135  7.7949751  7.2276868  5.2947097
##  [67]  5.6572344  4.8591474  5.5327748  6.0558506  4.4025461  5.4340414
##  [73]  5.4144810  6.7396121  4.9103258  5.6993446  3.7281179  6.1170101
##  [79]  5.8044981  4.4576511  6.5683215  6.8537526  6.1153306  6.3364337
##  [85]  3.9598438  4.4194578  6.1952268  4.9405660  6.3774367  6.8156858
##  [91]  5.0409981  6.3947840  6.1825394  5.4857154  3.8535585  4.8735242
##  [97]  4.9935350  5.4004542  5.1579717  5.2715430
```

## Create a potentially confounding variable or a control variable
> in the code below, we multiply every value in dep_var by 0.5 and then we "add noise": 100 random normal values whose true population has a mean = 0 and sd = 1. Every value in dep_var * 0.5 gets a random value added to it.


```r
confound <- dep_var * 0.5 + rnorm(n = 100, mean = 0, sd = 1)

# print confound by just excecuting/running the name of the object
confound
```

```
##   [1]  2.28178116  1.36972497 -0.54369414  1.82259505  1.49072970
##   [6]  1.16039153  2.24518526  0.86248662  2.13792679  1.06094664
##  [11]  3.44380588  2.82566843  3.51950592  1.67328567  0.02974195
##  [16]  0.12913769  0.82944427  1.66618378  0.40315438  2.14571511
##  [21]  0.33767220  0.63678096  1.87940468  1.98235360  0.10662704
##  [26]  2.96223849  0.33013206 -0.14031933  1.95886580  1.55485593
##  [31]  2.50151378 -1.20362186  0.98093215 -0.60309152  0.99793606
##  [36]  0.55184640 -1.32453515  2.04388556  1.68749767 -0.07386942
##  [41]  0.64079605  0.73368609  1.06005278  1.98753612  0.25657196
##  [46]  1.72902751  0.86371299  3.52644880  0.10879873  1.80944471
##  [51]  3.36229576  5.65965642  3.76877354  2.14957377  1.86709939
##  [56]  2.62831799  1.86147850  3.22708902  1.80510956  3.93888342
##  [61]  3.32383840  1.67615420  1.48088995  4.52583089  2.30340550
##  [66]  4.17641592  1.34129114  2.96415138  3.14063519  3.27097863
##  [71]  3.37391323  2.49524986  2.33891075  2.30175797 -0.44858055
##  [76]  1.28006000  2.26092607  2.17937816  2.18186390  2.40260057
##  [81]  4.45441029  3.19106191  2.52335132  3.28175776  1.43778696
##  [86]  2.25349039  2.37214783  1.09264525  3.30246362  3.16064910
##  [91]  2.66118462  2.97412852  1.53268003  1.88225234  3.80231346
##  [96]  3.40453761  2.13666314  2.17316561  2.41502311  3.65114608
```

## Subject gender
> * read like this: replicate each element of c("Woman", "Man") sample_size = 50 times, and then turn the result into a factor


```r
gender <- c("Woman", "Man") %>% rep(times = sample_size) %>% factor()

# print gender by just excecuting/running the name of the object
gender
```

```
##   [1] Woman Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman
##  [12] Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman Man  
##  [23] Woman Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman
##  [34] Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman Man  
##  [45] Woman Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman
##  [56] Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman Man  
##  [67] Woman Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman
##  [78] Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman Man  
##  [89] Woman Man   Woman Man   Woman Man   Woman Man   Woman Man   Woman
## [100] Man  
## Levels: Man Woman
```

## Subject age
> * read like this: generate a sequence of values from 18 to 25 by 1, and take a random sample of 100 values from that sequence (with replacement)
> * see help(sample) for details


```r
age <- seq(from = 18, to = 25, by = 1) %>% sample(size = 100, replace = TRUE)

# print gender by just excecuting/running the name of the object
age
```

```
##   [1] 22 24 21 18 22 24 18 24 20 21 22 25 22 19 22 22 21 23 22 20 19 25 21
##  [24] 22 24 22 22 23 22 18 24 24 24 21 21 23 20 18 18 25 19 24 23 18 20 25
##  [47] 22 22 19 18 18 23 22 24 22 25 22 22 23 19 18 23 25 23 19 25 25 25 23
##  [70] 25 24 25 20 24 19 23 19 22 24 22 25 25 20 23 19 22 22 23 21 20 24 25
##  [93] 20 18 21 19 23 21 20 24
```

## `data.frame()` and `tibble()`
> "The concept of a data frame comes from the world of statistical software used in empirical research; it generally refers to "tabular" data: a data structure representing cases (rows), each of which consists of a number of observations or measurements (columns). Alternatively, each row may be treated as a single observation of multiple "variables". In any case, each row and each column has the same data type, but the row ("record") datatype may be heterogenous (a tuple of different types), while the column datatype must be homogenous. Data frames usually contain some metadata in addition to data; for example, column and row names." [[**.html**](https://github.com/mobileink/data.frame/wiki/What-is-a-Data-Frame%3F)]

> "**Tibbles** are a modern take on data frames. They keep the features that have stood the test of time, and drop the features that used to be convenient but are now frustrating (i.e. converting character vectors to factors)." [[**.html**](https://cran.r-project.org/web/packages/tibble/vignettes/tibble.html)]

## Put all our variable we made into a tibble
> * every variable we made above is seperated by a comma -- these will become columns in our dataset
> * see help(data.frame) and help(tibble) for details


```r
example_data <- tibble(subj_num, condition, dep_var, confound, gender, age)

# print example_data by just excecuting/running the name of the object
example_data
```

```
## # A tibble: 100 x 6
##    subj_num condition dep_var confound gender   age
##       <dbl> <fct>       <dbl>    <dbl> <fct>  <dbl>
##  1        1 control     2.63     2.28  Woman     22
##  2        2 control     2.43     1.37  Man       24
##  3        3 control     2.52    -0.544 Woman     21
##  4        4 control     3.07     1.82  Man       18
##  5        5 control     3.44     1.49  Woman     22
##  6        6 control     1.15     1.16  Man       24
##  7        7 control     4.16     2.25  Woman     18
##  8        8 control     0.979    0.862 Man       24
##  9        9 control     3.06     2.14  Woman     20
## 10       10 control     0.937    1.06  Man       21
## # … with 90 more rows
```

# Data wrangling examples

## create new variables in data.frame or tibble
> * `mutate()` adds new variables to your tibble.
> * we're adding new columns to our dataset, and we're saving this new dataset as the same name as our old one (i.e., like changing an Excel file and saving with the same name)
> * see help(mutate) for details


```r
example_data <- example_data %>%
  mutate(dep_var_z = dep_var %>% scale() %>% as.numeric(),
         confound_z = confound %>% scale() %>% as.numeric())

# print example_data by just excecuting/running the name of the object
example_data
```

```
## # A tibble: 100 x 8
##    subj_num condition dep_var confound gender   age dep_var_z confound_z
##       <dbl> <fct>       <dbl>    <dbl> <fct>  <dbl>     <dbl>      <dbl>
##  1        1 control     2.63     2.28  Woman     22   -0.692      0.269 
##  2        2 control     2.43     1.37  Man       24   -0.794     -0.429 
##  3        3 control     2.52    -0.544 Woman     21   -0.746     -1.89  
##  4        4 control     3.07     1.82  Man       18   -0.464     -0.0820
##  5        5 control     3.44     1.49  Woman     22   -0.276     -0.336 
##  6        6 control     1.15     1.16  Man       24   -1.44      -0.589 
##  7        7 control     4.16     2.25  Woman     18    0.0917     0.241 
##  8        8 control     0.979    0.862 Man       24   -1.53      -0.817 
##  9        9 control     3.06     2.14  Woman     20   -0.473      0.159 
## 10       10 control     0.937    1.06  Man       21   -1.55      -0.665 
## # … with 90 more rows
```

## Select specific columns
> * `select()` selects your tibble's variables by name and in the exact order you specify.
> * see help(select) for details


```r
example_data %>% 
  select(subj_num, condition, dep_var)
```

```
## # A tibble: 100 x 3
##    subj_num condition dep_var
##       <dbl> <fct>       <dbl>
##  1        1 control     2.63 
##  2        2 control     2.43 
##  3        3 control     2.52 
##  4        4 control     3.07 
##  5        5 control     3.44 
##  6        6 control     1.15 
##  7        7 control     4.16 
##  8        8 control     0.979
##  9        9 control     3.06 
## 10       10 control     0.937
## # … with 90 more rows
```

## Filter specific rows
> * `filter()` returns rows that all meet some condition you give it.
> * Note, `==` means "exactly equal to". See ?Comparison.
> * see help(filter) for details


```r
example_data %>% 
  filter(condition == "control")
```

```
## # A tibble: 50 x 8
##    subj_num condition dep_var confound gender   age dep_var_z confound_z
##       <dbl> <fct>       <dbl>    <dbl> <fct>  <dbl>     <dbl>      <dbl>
##  1        1 control     2.63     2.28  Woman     22   -0.692      0.269 
##  2        2 control     2.43     1.37  Man       24   -0.794     -0.429 
##  3        3 control     2.52    -0.544 Woman     21   -0.746     -1.89  
##  4        4 control     3.07     1.82  Man       18   -0.464     -0.0820
##  5        5 control     3.44     1.49  Woman     22   -0.276     -0.336 
##  6        6 control     1.15     1.16  Man       24   -1.44      -0.589 
##  7        7 control     4.16     2.25  Woman     18    0.0917     0.241 
##  8        8 control     0.979    0.862 Man       24   -1.53      -0.817 
##  9        9 control     3.06     2.14  Woman     20   -0.473      0.159 
## 10       10 control     0.937    1.06  Man       21   -1.55      -0.665 
## # … with 40 more rows
```

## Make your own table of summary data
> * `summarize()` let's you apply functions to your data to reduce it to single values. Typically, you create new summary values based on groups (e.g., condition, gender, id); for this, use `group_by()` first.
> * see help(summarize) and help(group_by) for details


```r
example_data %>% 
  group_by(gender, condition) %>% 
  summarize(Mean = mean(confound),
            SD = sd(confound),
            n = length(confound))
```

```
## # A tibble: 4 x 5
## # Groups:   gender [?]
##   gender condition     Mean    SD     n
##   <fct>  <fct>        <dbl> <dbl> <int>
## 1 Man    control       1.29  1.12    25
## 2 Man    manipulation  2.88  1.03    25
## 3 Woman  control       1.13  1.18    25
## 4 Woman  manipulation  2.42  1.02    25
```

# Plotting your data with ggplot2
> "ggplot2 is a plotting system for R, based on the grammar of graphics, which tries to take the good parts of base and lattice graphics and none of the bad parts. It takes care of many of the fiddly details that make plotting a hassle (like drawing legends) as well as providing a powerful model of graphics that makes it easy to produce complex multi-layered graphics." [[**.html**](http://ggplot2.org/)]

## Make ggplots in layers
> * Aesthetic mappings describe how variables in the data are mapped to visual properties (aesthetics) of geoms. [[**.html**](http://ggplot2.tidyverse.org/reference/aes.html)]
> * Below, we map condition on our plot's x-axis and dep_var on its y-axis
> * see help(ggplot) for details


```r
example_data %>%
  ggplot(mapping = aes(x = condition, y = dep_var))
```

<img src="/post/2019-02-13-learn-r-for-psychology-research-a-crash-course/2019-02-13-learn-r-for-psychology-research-a-crash-course_files/figure-html/unnamed-chunk-28-1.png" width="672" />

> * Think of this like a blank canvas that we're going to add pictures to or like a map of the ocean we're going to add land mass to

## Boxplot
> * next, we add—yes, add, with a `+`—a geom, a geometric element: `geom_boxplot()`
> * see help(geom_boxplot) for details


```r
example_data %>%
  ggplot(mapping = aes(x = condition, y = dep_var)) +
  geom_boxplot()
```

<img src="/post/2019-02-13-learn-r-for-psychology-research-a-crash-course/2019-02-13-learn-r-for-psychology-research-a-crash-course_files/figure-html/unnamed-chunk-29-1.png" width="672" />

> * Here's emphasis: we started with a blank canvas, and we added a boxplot. All ggplots work this way: start with a base and add layers.

## QQ-plots
> * Below, we plot the sample quantiles of dep_var against the theoretical quantiles
> * Useful for exploring the distribution of a variable
> * see help(geom_qq) for details


```r
example_data %>%
  ggplot(mapping = aes(sample = dep_var)) +
  geom_qq()
```

<img src="/post/2019-02-13-learn-r-for-psychology-research-a-crash-course/2019-02-13-learn-r-for-psychology-research-a-crash-course_files/figure-html/unnamed-chunk-30-1.png" width="672" />

## Means and 95% confidence intervals
> * add a new aesthetic, fill, which will fill the geoms with different colors, depending on the variable (e.g., levels of categorical variables are assigned their own fill color)
> * `stat_summary()` does what its name suggests: it applies statistical summaries to your raw data to make the geoms (bars and error bars in our case below)
> * the width argument sets the width of the error bars.
> * see help(stat_summary) for details


```r
example_data %>%
  ggplot(mapping = aes(x = condition, y = dep_var, fill = condition)) +
  stat_summary(geom = "bar", fun.data = mean_cl_normal) +
  stat_summary(geom = "errorbar", fun.data = mean_cl_normal, width = 0.1)
```

<img src="/post/2019-02-13-learn-r-for-psychology-research-a-crash-course/2019-02-13-learn-r-for-psychology-research-a-crash-course_files/figure-html/unnamed-chunk-31-1.png" width="672" />

## Scatterplots
> * we add `geom_point()` and `geom_smooth()` below to add points to the scatterplot and fit a linear regression line with 95% confidence ribbons/bands around that line
> * see help(geom_point) and help(geom_smooth)for details


```r
example_data %>%
  ggplot(mapping = aes(x = confound, y = dep_var)) +
  geom_point() +
  geom_smooth(method = "lm", se = TRUE)
```

<img src="/post/2019-02-13-learn-r-for-psychology-research-a-crash-course/2019-02-13-learn-r-for-psychology-research-a-crash-course_files/figure-html/unnamed-chunk-32-1.png" width="672" />

# Descriptive statistics
> * `describe()`, help(describe)
> * `describeBy()`, help(describeBy)

## For whole sample


```r
example_data %>% 
  select(dep_var, dep_var_z, confound, confound_z) %>% 
  describe()
```

```
##            vars   n mean   sd median trimmed  mad   min  max range  skew
## dep_var       1 100 3.98 1.96   4.28    4.02 2.59 -0.30 7.79  8.10 -0.14
## dep_var_z     2 100 0.00 1.00   0.15    0.02 1.32 -2.18 1.94  4.13 -0.14
## confound      3 100 1.93 1.31   1.98    1.95 1.37 -1.32 5.66  6.98 -0.08
## confound_z    4 100 0.00 1.00   0.04    0.02 1.05 -2.49 2.85  5.35 -0.08
##            kurtosis   se
## dep_var       -1.17 0.20
## dep_var_z     -1.17 0.10
## confound      -0.05 0.13
## confound_z    -0.05 0.10
```

## By condition
> The code below is a little confusing. First, we're piping our subsetted tibble with only our four variables—dep_var and confound and their z-scored versions—into the first argument for the `describeBy()` function. But we need to give data to the group argument, so then we just give it another subsetted tibble with only our grouping variable, condition.


```r
example_data %>% 
  select(dep_var, dep_var_z, confound, confound_z) %>% 
  describeBy(group = example_data %>% select(condition))
```

```
## 
##  Descriptive statistics by group 
## condition: control
##            vars  n  mean   sd median trimmed  mad   min  max range  skew
## dep_var       1 50  2.33 1.17   2.09    2.29 1.15 -0.30 5.32  5.62  0.28
## dep_var_z     2 50 -0.84 0.60  -0.97   -0.86 0.59 -2.18 0.68  2.87  0.28
## confound      3 50  1.21 1.14   1.11    1.20 1.21 -1.32 3.53  4.85 -0.01
## confound_z    4 50 -0.55 0.87  -0.63   -0.56 0.92 -2.49 1.22  3.71 -0.01
##            kurtosis   se
## dep_var       -0.22 0.17
## dep_var_z     -0.22 0.08
## confound      -0.43 0.16
## confound_z    -0.43 0.12
## -------------------------------------------------------- 
## condition: manipulation
##            vars  n mean   sd median trimmed  mad   min  max range skew
## dep_var       1 50 5.63 0.92   5.60    5.64 1.06  3.73 7.79  4.07 0.01
## dep_var_z     2 50 0.84 0.47   0.82    0.84 0.54 -0.13 1.94  2.07 0.01
## confound      3 50 2.65 1.04   2.46    2.63 1.07 -0.45 5.66  6.11 0.09
## confound_z    4 50 0.55 0.80   0.40    0.53 0.82 -1.82 2.85  4.67 0.09
##            kurtosis   se
## dep_var       -0.61 0.13
## dep_var_z     -0.61 0.07
## confound       0.94 0.15
## confound_z     0.94 0.11
```

# Read in your own data
> * .csv file: `read_csv()`
> * .txt file: `read_delim()`
> * SPSS .sav file: `read_sav()`

## SPSS
> * see help(read_sav) for details


```r
# path to where file lives on your computer
coffee_filepath <- "data/coffee.sav"

coffee_data <- coffee_filepath %>% read_sav()

# print coffee_data by just excecuting/running the name of the object
coffee_data
```

```
## # A tibble: 138 x 3
##    image     brand      freq
##    <dbl+lbl> <dbl+lbl> <dbl>
##  1  1        1            82
##  2  2        1            96
##  3  3        1            72
##  4  4        1           101
##  5  5        1            66
##  6  6        1             6
##  7  7        1            47
##  8  8        1             1
##  9  9        1            16
## 10 10        1            60
## # … with 128 more rows
```

## CSV
> * see help(read_csv) for details


```r
# path to where file lives on your computer
coffee_filepath <- "data/coffee.csv"

coffee_data <- coffee_filepath %>% read_csv()
```

```
## Parsed with column specification:
## cols(
##   image = col_double(),
##   brand = col_double(),
##   freq = col_double()
## )
```

## TXT
> * see help(read_delim) for details


```r
# path to where file lives on your computer
coffee_filepath <- "data/coffee.txt"

coffee_data <- coffee_filepath %>% read_delim(delim = " ")
```

```
## Parsed with column specification:
## cols(
##   image = col_double(),
##   brand = col_double(),
##   freq = col_double()
## )
```

# Modeling your data

## `t.test()`, help(t.test)


```r
t.test(dep_var ~ condition, data = example_data)
```

```
## 
## 	Welch Two Sample t-test
## 
## data:  dep_var by condition
## t = -15.709, df = 92.751, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.719919 -2.884970
## sample estimates:
##      mean in group control mean in group manipulation 
##                   2.332424                   5.634869
```

## `pairs.panels()`, help(pairs.panels)
> shows a scatter plot of matrices (SPLOM), with bivariate scatter plots below the diagonal, histograms on the diagonal, and the Pearson correlation above the diagonal (see ?pairs.panels).


```r
example_data %>% 
  select(dep_var, confound, age) %>% 
  pairs.panels()
```

<img src="/post/2019-02-13-learn-r-for-psychology-research-a-crash-course/2019-02-13-learn-r-for-psychology-research-a-crash-course_files/figure-html/unnamed-chunk-39-1.png" width="672" />

## `lm()`, help(lm)


```r
lm_fit <- lm(dep_var ~ condition + confound, data = example_data)

# print lm_fit by just excecuting/running the name of the object
lm_fit
```

```
## 
## Call:
## lm(formula = dep_var ~ condition + confound, data = example_data)
## 
## Coefficients:
##           (Intercept)  conditionmanipulation               confound  
##                1.7648                 2.6253                 0.4696
```

## `summary()`, help(summary)


```r
lm_fit %>% summary()
```

```
## 
## Call:
## lm(formula = dep_var ~ condition + confound, data = example_data)
## 
## Residuals:
##      Min       1Q   Median       3Q      Max 
## -2.32204 -0.66969  0.08707  0.69429  2.22948 
## 
## Coefficients:
##                       Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            1.76481    0.16618   10.62  < 2e-16 ***
## conditionmanipulation  2.62526    0.22161   11.85  < 2e-16 ***
## confound               0.46959    0.08523    5.51 2.95e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.922 on 97 degrees of freedom
## Multiple R-squared:  0.7835,	Adjusted R-squared:  0.7791 
## F-statistic: 175.5 on 2 and 97 DF,  p-value: < 2.2e-16
```

## `Anova()`, help(Anova)


```r
lm_fit %>% Anova(type = "III")
```

```
## Anova Table (Type III tests)
## 
## Response: dep_var
##              Sum Sq Df F value    Pr(>F)    
## (Intercept)  95.883  1 112.784 < 2.2e-16 ***
## condition   119.305  1 140.335 < 2.2e-16 ***
## confound     25.810  1  30.359 2.952e-07 ***
## Residuals    82.464 97                      
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

## Recommended Resources
> * ReadCollegePDX (2015, October 19). Hadley Wickham "Data Science with R". [[**YouTube**](https://youtu.be/K-ss_ag2k9E?list=PLNtpLD4WiWbw9Cgcg6IU75u-44TrrN3A4)]
> * Robinson, D. (2017, July 05). Teach the tidyverse to beginners. Variance Explained. [[**.html**](http://varianceexplained.org/r/teach-tidyverse/)]
> * Wickham, H. (2014). Tidy data. *Journal of Statistical Software, 59*(10), 1-23. [[**.html**](http://vita.had.co.nz/papers/tidy-data.html)]
> * The tidyverse style guide [[**.html**](http://style.tidyverse.org/)] by Hadley Wickham
> * Wickham, H., & Grolemund, G. (2017). R for Data Science: Import, Tidy, Transform, Visualize, and Model Data. Sebastopol, CA: O'Reilly Media, Inc. [[**.html**](http://r4ds.had.co.nz/)]

## More advanced data wrangling and analysis techniques by psychologists, for psychologists
> * R programming for research [[**.html**](https://github.com/nmmichalak/R_programming_for_research)], a workshop instructed by Nick Michalak and Iris Wang at the University of Michigan

## More information about tidyverse and the psych package
> * tidyverse: R packages for data science [[**.html**](https://www.tidyverse.org/)]
> * Using R and psych for personality and psychological research [[**.html**](http://personality-project.org/r/psych/)]

## R Studio Cheat Sheets
> * RStudio Cheat Sheets [[**.html**](https://www.rstudio.com/resources/cheatsheets/)]
