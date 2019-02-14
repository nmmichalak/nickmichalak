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
##  [1] -1.97215500  0.71277302 -0.08254640 -2.13087972 -0.92960190
##  [6]  0.07219898 -0.02484420 -0.50088011 -0.41691071  0.50739335
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
##   [1] 2.2495048 2.7967528 1.4471360 2.0707125 4.0966832 4.1436899 1.7278686
##   [8] 3.3246684 2.5980121 2.5587932 1.9919274 1.9605103 0.9650976 3.1379602
##  [15] 2.4643175 0.7802064 5.3649695 3.0465610 0.6866867 2.8689190 3.6157632
##  [22] 2.7048107 4.9240909 1.7216032 0.4862100 1.9164144 3.0300748 3.0694112
##  [29] 1.7682109 1.6809251 2.6670183 4.3773775 3.5791369 1.2703348 2.3728619
##  [36] 2.0257117 3.4259128 2.7798296 3.2351399 4.3967434 2.7893362 2.1644451
##  [43] 1.9195487 2.6579741 3.1866579 1.8349360 2.8369170 3.2849459 3.0415846
##  [50] 1.3429529 4.6733598 5.0629068 4.2829657 5.9569658 4.9076048 5.3363410
##  [57] 5.6668721 6.4539267 4.8681554 5.5160519 4.6087584 6.9299542 4.8726347
##  [64] 4.9702529 2.7949727 5.3459738 4.8029191 5.5000703 5.0832936 6.4557769
##  [71] 6.5248923 5.7287830 5.9367554 6.2986735 6.5834133 6.4644831 5.7870592
##  [78] 3.6361983 6.0098717 6.5692680 5.2423691 5.2073808 4.1660584 5.5260407
##  [85] 5.9431536 5.3097528 6.9982476 4.2308840 6.1133756 6.0894785 3.9557018
##  [92] 5.6926735 5.6458705 3.5264917 6.3873845 5.9151197 5.1125486 6.2562846
##  [99] 3.4941243 6.1235817
```

## Create a potentially confounding variable or a control variable
> in the code below, we multiply every value in dep_var by 0.5 and then we "add noise": 100 random normal values whose true population has a mean = 0 and sd = 1. Every value in dep_var * 0.5 gets a random value added to it.


```r
confound <- dep_var * 0.5 + rnorm(n = 100, mean = 0, sd = 1)

# print confound by just excecuting/running the name of the object
confound
```

```
##   [1] -0.02183917  0.15826080  1.54045433  1.81574084  2.32625331
##   [6]  1.63908829  1.60268534  2.44023411  1.19964500  1.76728015
##  [11]  1.91817059  0.52863575  1.56583594  0.96738054  2.37878700
##  [16]  1.36978471  2.38693528  1.28111859 -0.26627086  1.90982142
##  [21] -0.50481336  2.75214261  2.25723353 -0.32843773  0.02019310
##  [26] -0.86950909  0.96407302  2.31823069  0.26537940  0.89216406
##  [31]  0.84456451  2.60185212  1.20231147 -0.66768382  1.64993147
##  [36]  0.89504141  3.20493587  2.01988487  2.60098248  2.95125072
##  [41]  1.15689505  1.26879503  0.65435019  1.88438367  0.04359164
##  [46]  0.70806555 -0.24625163  2.30536836  1.32036331 -0.22257715
##  [51]  1.94418499  0.73403542  0.93368820  1.94652896  2.58636823
##  [56]  2.41529856  1.51208386  4.28784698  1.83945043  3.00469193
##  [61]  2.31373843  2.63267418  2.75422144  2.20887043  0.87736151
##  [66]  2.40316489  2.96058833  2.32168584  2.79433797  3.82822348
##  [71]  2.32505161  0.81175122  2.27707499  1.98674486  3.33038177
##  [76]  4.04864095  3.11669729  0.93233395  4.58528226  0.41909296
##  [81]  0.13716978  1.70414564  1.66303240  3.48263884  2.59302489
##  [86]  2.02506769  5.39286478  2.24050723  1.57286997  3.73957629
##  [91]  1.91158452  3.44241482  3.76247125  1.94040581  3.79606923
##  [96]  4.07367944  2.43614768  1.57416825  2.38869926  3.38241359
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
##   [1] 18 19 25 23 24 18 20 20 25 21 25 25 22 22 25 24 21 24 22 19 18 25 21
##  [24] 19 20 24 20 22 22 25 18 21 25 24 25 22 23 24 25 22 25 21 19 23 22 19
##  [47] 19 25 22 25 25 19 18 24 21 23 19 20 23 24 19 21 20 22 22 23 20 21 23
##  [70] 18 24 20 20 20 25 18 22 22 23 19 19 23 24 25 18 23 21 19 25 24 18 19
##  [93] 23 21 21 19 19 25 23 25
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
##  1        1 control      2.25  -0.0218 Woman     18
##  2        2 control      2.80   0.158  Man       19
##  3        3 control      1.45   1.54   Woman     25
##  4        4 control      2.07   1.82   Man       23
##  5        5 control      4.10   2.33   Woman     24
##  6        6 control      4.14   1.64   Man       18
##  7        7 control      1.73   1.60   Woman     20
##  8        8 control      3.32   2.44   Man       20
##  9        9 control      2.60   1.20   Woman     25
## 10       10 control      2.56   1.77   Man       21
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
##  1        1 control      2.25  -0.0218 Woman     18   -1.02      -1.52  
##  2        2 control      2.80   0.158  Man       19   -0.701     -1.37  
##  3        3 control      1.45   1.54   Woman     25   -1.48      -0.257 
##  4        4 control      2.07   1.82   Man       23   -1.12      -0.0345
##  5        5 control      4.10   2.33   Woman     24    0.0504     0.378 
##  6        6 control      4.14   1.64   Man       18    0.0776    -0.177 
##  7        7 control      1.73   1.60   Woman     20   -1.32      -0.206 
##  8        8 control      3.32   2.44   Man       20   -0.396      0.470 
##  9        9 control      2.60   1.20   Woman     25   -0.816     -0.532 
## 10       10 control      2.56   1.77   Man       21   -0.839     -0.0736
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
##  1        1 control      2.25
##  2        2 control      2.80
##  3        3 control      1.45
##  4        4 control      2.07
##  5        5 control      4.10
##  6        6 control      4.14
##  7        7 control      1.73
##  8        8 control      3.32
##  9        9 control      2.60
## 10       10 control      2.56
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
##  1        1 control      2.25  -0.0218 Woman     18   -1.02      -1.52  
##  2        2 control      2.80   0.158  Man       19   -0.701     -1.37  
##  3        3 control      1.45   1.54   Woman     25   -1.48      -0.257 
##  4        4 control      2.07   1.82   Man       23   -1.12      -0.0345
##  5        5 control      4.10   2.33   Woman     24    0.0504     0.378 
##  6        6 control      4.14   1.64   Man       18    0.0776    -0.177 
##  7        7 control      1.73   1.60   Woman     20   -1.32      -0.206 
##  8        8 control      3.32   2.44   Man       20   -0.396      0.470 
##  9        9 control      2.60   1.20   Woman     25   -0.816     -0.532 
## 10       10 control      2.56   1.77   Man       21   -0.839     -0.0736
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
## 1 Man    control       1.30  1.08    25
## 2 Man    manipulation  2.46  1.11    25
## 3 Woman  control       1.20  1.02    25
## 4 Woman  manipulation  2.47  1.15    25
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
## dep_var       1 100 4.01 1.73   4.12    4.04 2.13  0.49 7.00  6.51 -0.10
## dep_var_z     2 100 0.00 1.00   0.06    0.02 1.23 -2.04 1.73  3.77 -0.10
## confound      3 100 1.86 1.24   1.91    1.85 1.06 -0.87 5.39  6.26  0.09
## confound_z    4 100 0.00 1.00   0.05   -0.01 0.86 -2.20 2.85  5.06  0.09
##            kurtosis   se
## dep_var       -1.20 0.17
## dep_var_z     -1.20 0.10
## confound      -0.13 0.12
## confound_z    -0.13 0.10
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
## dep_var       1 50  2.61 1.06   2.66    2.57 0.99  0.49 5.36  4.88  0.30
## dep_var_z     2 50 -0.81 0.61  -0.78   -0.83 0.57 -2.04 0.78  2.82  0.30
## confound      3 50  1.25 1.04   1.30    1.27 1.11 -0.87 3.20  4.07 -0.23
## confound_z    4 50 -0.49 0.84  -0.45   -0.47 0.89 -2.20 1.09  3.29 -0.23
##            kurtosis   se
## dep_var       -0.07 0.15
## dep_var_z     -0.07 0.09
## confound      -0.95 0.15
## confound_z    -0.95 0.12
## -------------------------------------------------------- 
## condition: manipulation
##            vars  n mean   sd median trimmed  mad   min  max range  skew
## dep_var       1 50 5.41 0.95   5.52    5.49 0.90  2.79 7.00  4.20 -0.63
## dep_var_z     2 50 0.81 0.55   0.87    0.86 0.52 -0.70 1.73  2.43 -0.63
## confound      3 50 2.47 1.12   2.36    2.45 1.00  0.14 5.39  5.26  0.21
## confound_z    4 50 0.49 0.91   0.40    0.48 0.81 -1.39 2.85  4.24  0.21
##            kurtosis   se
## dep_var       -0.13 0.13
## dep_var_z     -0.13 0.08
## confound      -0.25 0.16
## confound_z    -0.25 0.13
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
## t = -13.916, df = 96.924, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.203419 -2.403694
## sample estimates:
##      mean in group control mean in group manipulation 
##                   2.607757                   5.411314
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
##                2.0305                 2.2402                 0.4622
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
## -1.88337 -0.48318 -0.03985  0.49398  2.23129 
## 
## Coefficients:
##                       Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            2.03049    0.16110  12.604  < 2e-16 ***
## conditionmanipulation  2.24025    0.20224  11.077  < 2e-16 ***
## confound               0.46218    0.08205   5.633 1.73e-07 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8789 on 97 degrees of freedom
## Multiple R-squared:  0.7468,	Adjusted R-squared:  0.7416 
## F-statistic:   143 on 2 and 97 DF,  p-value: < 2.2e-16
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
## (Intercept) 122.721  1  158.86 < 2.2e-16 ***
## condition    94.789  1  122.70 < 2.2e-16 ***
## confound     24.511  1   31.73  1.73e-07 ***
## Residuals    74.933 97                      
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
