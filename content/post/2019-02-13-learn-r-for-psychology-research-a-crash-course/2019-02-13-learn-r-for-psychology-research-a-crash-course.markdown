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
##  [1] -0.47688461 -0.84273723  1.57551197  1.23530773 -0.92124679
##  [6]  0.44816592 -0.03434888  0.83779848 -0.74257573  1.71201460
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
##   [1] 3.0203013 1.8041641 1.9176455 1.7160072 1.7795668 1.8104979 2.5705715
##   [8] 1.4673909 0.9874156 2.7550895 1.9077652 3.2691602 2.2942284 3.0601048
##  [15] 3.0026041 2.8760829 3.3028280 2.9797175 3.6411340 2.6913705 3.3233795
##  [22] 1.9886200 2.1223055 2.7336488 2.8550410 1.8093185 2.2353651 3.5549011
##  [29] 2.6010864 2.5199774 2.3682340 2.9247659 1.7880258 1.7567409 2.2568586
##  [36] 0.8505120 2.4145216 2.4660778 3.1262376 2.7929327 2.2315055 3.1514394
##  [43] 2.1849757 3.0130185 2.2915243 2.6685070 1.9982474 2.4864069 3.6713795
##  [50] 2.2551330 6.8990732 4.7064659 5.6415242 5.7781878 4.8197383 5.5406823
##  [57] 6.0083514 7.0436267 5.7764367 4.9853016 3.9606029 5.3014609 3.3206821
##  [64] 4.7066849 4.4858877 4.6909338 5.2191928 6.5661434 4.5583373 5.3160024
##  [71] 4.1838632 6.6369019 6.9698173 5.6204184 6.8085093 5.2635307 4.2525638
##  [78] 5.4808642 4.1406065 4.2061887 3.3713382 5.6848535 5.3482489 4.8929675
##  [85] 5.2314734 6.5477768 5.5340095 2.4212297 7.0827848 5.2997987 5.9928722
##  [92] 5.8226482 6.7706376 7.7257730 5.5046786 6.8073253 5.7580565 5.0865135
##  [99] 5.5823291 3.6319588
```

## Create a potentially confounding variable or a control variable
> in the code below, we multiply every value in dep_var by 0.5 and then we "add noise": 100 random normal values whose true population has a mean = 0 and sd = 1. Every value in dep_var * 0.5 gets a random value added to it.


```r
confound <- dep_var * 0.5 + rnorm(n = 100, mean = 0, sd = 1)

# print confound by just excecuting/running the name of the object
confound
```

```
##   [1]  1.40527479  1.18831087 -0.82405625  1.29752985 -0.31442502
##   [6]  1.16397175  2.39180357  0.78259257  1.16616694  1.47833159
##  [11]  1.77227373  1.94570763  1.30246423  0.61434158  2.65310356
##  [16]  0.58366173  3.90789259  2.25396148  0.57584502  0.57261755
##  [21]  0.89624774  1.97832035 -0.24514327  0.95300206  0.16377560
##  [26]  1.29093863 -1.55943710  3.79715886  0.88977391 -0.31148715
##  [31]  0.63626352  3.67432028  1.85692407  0.59739269  2.24572045
##  [36]  0.04910548  1.38908161  0.63950480 -0.44297905  1.15764177
##  [41]  2.09762222  3.06860811  0.03976055  1.77840798  0.63747623
##  [46]  1.55346633 -0.15785537  1.71176375  0.74785786  2.54837053
##  [51]  4.69483392  4.89823300  3.51576801  1.94266896  2.71854183
##  [56]  3.59852825  3.80359761  5.12816504  3.26548196  2.76929320
##  [61]  2.52090490  3.54067599  0.92985287  4.39374836  2.08896261
##  [66]  1.79933098 -0.10882967  5.24322378  1.15276966  3.40731113
##  [71]  3.16181151  3.66045466  1.62751698  2.26747429  2.52217552
##  [76]  2.43336778  0.99039396  4.48277921  1.95304156  1.44458051
##  [81]  3.27650826  1.67931349  2.37300452  1.36688854  2.60194389
##  [86]  4.39488824  1.48715750  2.57658798  3.97808931  4.06818251
##  [91]  2.26835141  3.75195720  2.96308569  2.42092135  2.37514551
##  [96]  4.98198421  1.54455741  3.07897594  1.92121066  2.94744406
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
##   [1] 21 22 21 19 21 23 22 22 21 25 25 21 21 22 19 24 20 23 22 24 25 21 25
##  [24] 19 18 21 20 22 18 23 24 24 18 22 23 19 18 21 18 24 20 24 22 18 18 24
##  [47] 25 19 19 21 18 22 23 18 22 25 22 25 19 21 22 20 20 21 21 25 21 25 22
##  [70] 19 22 19 24 18 23 18 25 22 23 19 18 19 19 24 18 25 24 19 23 23 23 21
##  [93] 23 25 20 19 22 20 25 23
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
##  1        1 control     3.02     1.41  Woman     21
##  2        2 control     1.80     1.19  Man       22
##  3        3 control     1.92    -0.824 Woman     21
##  4        4 control     1.72     1.30  Man       19
##  5        5 control     1.78    -0.314 Woman     21
##  6        6 control     1.81     1.16  Man       23
##  7        7 control     2.57     2.39  Woman     22
##  8        8 control     1.47     0.783 Man       22
##  9        9 control     0.987    1.17  Woman     21
## 10       10 control     2.76     1.48  Man       25
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
##  1        1 control     3.02     1.41  Woman     21    -0.526     -0.423
##  2        2 control     1.80     1.19  Man       22    -1.23      -0.573
##  3        3 control     1.92    -0.824 Woman     21    -1.17      -1.97 
##  4        4 control     1.72     1.30  Man       19    -1.29      -0.497
##  5        5 control     1.78    -0.314 Woman     21    -1.25      -1.61 
##  6        6 control     1.81     1.16  Man       23    -1.23      -0.590
##  7        7 control     2.57     2.39  Woman     22    -0.788      0.261
##  8        8 control     1.47     0.783 Man       22    -1.43      -0.854
##  9        9 control     0.987    1.17  Woman     21    -1.71      -0.588
## 10       10 control     2.76     1.48  Man       25    -0.680     -0.372
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
##  1        1 control     3.02 
##  2        2 control     1.80 
##  3        3 control     1.92 
##  4        4 control     1.72 
##  5        5 control     1.78 
##  6        6 control     1.81 
##  7        7 control     2.57 
##  8        8 control     1.47 
##  9        9 control     0.987
## 10       10 control     2.76 
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
##  1        1 control     3.02     1.41  Woman     21    -0.526     -0.423
##  2        2 control     1.80     1.19  Man       22    -1.23      -0.573
##  3        3 control     1.92    -0.824 Woman     21    -1.17      -1.97 
##  4        4 control     1.72     1.30  Man       19    -1.29      -0.497
##  5        5 control     1.78    -0.314 Woman     21    -1.25      -1.61 
##  6        6 control     1.81     1.16  Man       23    -1.23      -0.590
##  7        7 control     2.57     2.39  Woman     22    -0.788      0.261
##  8        8 control     1.47     0.783 Man       22    -1.43      -0.854
##  9        9 control     0.987    1.17  Woman     21    -1.71      -0.588
## 10       10 control     2.76     1.48  Man       25    -0.680     -0.372
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
## 1 Man    control      1.45   1.03    25
## 2 Man    manipulation 3.29   1.20    25
## 3 Woman  control      0.929  1.23    25
## 4 Woman  manipulation 2.39   1.09    25
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
##            vars   n mean   sd median trimmed  mad   min  max range skew
## dep_var       1 100 3.92 1.72   3.46    3.84 2.00  0.85 7.73  6.88 0.30
## dep_var_z     2 100 0.00 1.00  -0.27   -0.05 1.16 -1.79 2.21  4.00 0.30
## confound      3 100 2.02 1.44   1.93    1.99 1.50 -1.56 5.24  6.80 0.16
## confound_z    4 100 0.00 1.00  -0.06   -0.02 1.04 -2.48 2.24  4.71 0.16
##            kurtosis   se
## dep_var       -1.13 0.17
## dep_var_z     -1.13 0.10
## confound      -0.45 0.14
## confound_z    -0.45 0.10
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
##            vars  n  mean   sd median trimmed  mad   min   max range  skew
## dep_var       1 50  2.47 0.64   2.48    2.48 0.73  0.85  3.67  2.82 -0.24
## dep_var_z     2 50 -0.85 0.37  -0.84   -0.84 0.43 -1.79 -0.15  1.64 -0.24
## confound      3 50  1.19 1.15   1.17    1.15 0.89 -1.56  3.91  5.47  0.27
## confound_z    4 50 -0.57 0.80  -0.59   -0.60 0.62 -2.48  1.31  3.79  0.27
##            kurtosis   se
## dep_var       -0.33 0.09
## dep_var_z     -0.33 0.05
## confound       0.07 0.16
## confound_z     0.07 0.11
## -------------------------------------------------------- 
## condition: manipulation
##            vars  n mean   sd median trimmed  mad   min  max range  skew
## dep_var       1 50 5.38 1.10   5.41    5.41 0.97  2.42 7.73  5.30 -0.23
## dep_var_z     2 50 0.85 0.64   0.87    0.87 0.56 -0.87 2.21  3.09 -0.23
## confound      3 50 2.84 1.22   2.66    2.82 1.29 -0.11 5.24  5.35  0.09
## confound_z    4 50 0.57 0.85   0.45    0.55 0.89 -1.47 2.24  3.71  0.09
##            kurtosis   se
## dep_var       -0.14 0.16
## dep_var_z     -0.14 0.09
## confound      -0.60 0.17
## confound_z    -0.60 0.12
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
## t = -16.164, df = 78.624, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.272676 -2.554985
## sample estimates:
##      mean in group control mean in group manipulation 
##                   2.465887                   5.379717
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
##                2.1645                 2.4977                 0.2528
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
## -2.89238 -0.48901  0.03129  0.49699  2.45151 
## 
## Coefficients:
##                       Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            2.16454    0.14861  14.565  < 2e-16 ***
## conditionmanipulation  2.49768    0.20851  11.979  < 2e-16 ***
## confound               0.25282    0.07262   3.481  0.00075 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8542 on 97 degrees of freedom
## Multiple R-squared:  0.7575,	Adjusted R-squared:  0.7525 
## F-statistic: 151.5 on 2 and 97 DF,  p-value: < 2.2e-16
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
## (Intercept) 154.784  1  212.14 < 2.2e-16 ***
## condition   104.698  1  143.49 < 2.2e-16 ***
## confound      8.843  1   12.12 0.0007497 ***
## Residuals    70.776 97                      
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
