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
##  [1]  0.59531338  0.25724427 -1.93173570  0.55883825 -2.18485805
##  [6] -0.06410770  1.23639508 -0.43573541  0.09050058 -1.00559486
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
##   [1]  2.9752085  2.8205160  2.5227842  1.4337341  5.1445168  2.5787872
##   [7]  3.7925406  4.1267879  3.4596128  3.2936848  3.9734260  2.6371714
##  [13]  2.2001361  2.4876344  3.5012167  2.8439153  2.8620635  2.8444463
##  [19]  3.7404125  1.6534026  2.3266799 -1.2340625  3.6097526  5.1809700
##  [25]  3.3694384  2.8377433  1.7800555  3.3304654  1.3207507  1.5636666
##  [31]  0.1884462  3.0961014  2.8804293  2.5958737  2.6637769  2.0264003
##  [37]  2.3241753  2.9344997  0.9649149  2.3300723  2.1359569  1.8609922
##  [43]  2.7076443  1.7141845  2.1642128  1.1587001  2.4465877  2.1913860
##  [49]  1.5157827  2.8738954  4.7711714  3.6425083  5.3467381  4.2000824
##  [55]  4.6537007  4.6120946  4.7340197  3.4141109  6.0096248  5.6792199
##  [61]  5.8099229  4.4988540  5.4891406  6.0856736  6.2698664  4.4366242
##  [67]  7.4826062  5.6263062  5.1161187  4.6691494  5.7159673  5.2933360
##  [73]  5.9144805  7.2800695  5.9823233  6.3382712  6.7484197  5.8760602
##  [79]  4.1813907  4.8858966  6.4913918  6.2045878  6.3018316  6.8076609
##  [85]  5.1122266  5.7607119  6.2582241  6.2322317  4.7131784  7.5055925
##  [91]  5.3317033  7.1065229  6.6653357  6.1141081  4.6720046  5.5607625
##  [97]  6.3001680  6.6217727  5.9147917  4.4300247
```

## Create a potentially confounding variable or a control variable
> in the code below, we multiply every value in dep_var by 0.5 and then we "add noise": 100 random normal values whose true population has a mean = 0 and sd = 1. Every value in dep_var * 0.5 gets a random value added to it.


```r
confound <- dep_var * 0.5 + rnorm(n = 100, mean = 0, sd = 1)

# print confound by just excecuting/running the name of the object
confound
```

```
##   [1]  1.21003586  1.09907774  3.44631976  0.73717182  3.41002902
##   [6]  0.96572780  1.04529409  1.62376380  1.74947127  2.21965112
##  [11]  1.01129991  1.74597537  0.45880974  0.82503405  1.02622546
##  [16]  1.84532678  0.47025202  1.35395659  2.77934527  2.03974179
##  [21]  2.00639907  0.52497723  2.42008623  2.13924400  0.14561999
##  [26]  2.91571615  1.48950768  2.09169588  0.62146172  0.51030021
##  [31]  1.03719883  1.64518454 -0.76604119  1.54240343  1.16766584
##  [36]  0.10606235  1.62567133  1.82427804  1.59800932  0.60615717
##  [41] -0.50479413 -0.34824786  0.73179243  1.09682655  2.17827440
##  [46] -0.05343021  0.32308056 -0.04725187  0.74114404  2.01415570
##  [51] -0.54271157  1.11748713  2.44732459  3.83914221  1.56167877
##  [56]  1.61094651  2.77146390  3.64398324  3.44412191  4.84419230
##  [61]  3.63383678  1.56358647  2.83430040  3.53140925  4.40653616
##  [66]  3.43491528  6.41980044  3.06153832  1.92740618  2.09541366
##  [71]  3.41315574  1.31066877  3.76001237  3.33193691  2.66867186
##  [76]  3.79330006  2.26047034  4.71935019  1.39924526  2.53610269
##  [81]  4.40101915  4.13694157  2.76917988  2.87958673  2.27053553
##  [86]  1.36589415  0.49773848  2.62661923  0.65251393  3.93819223
##  [91]  2.48082631  3.43089288  0.93965951  3.52854463  3.12758356
##  [96]  1.49818517  2.62267375  2.03850432  1.90671740  1.01157488
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
##   [1] 25 20 21 21 22 23 22 23 19 24 18 19 18 19 18 21 20 20 21 24 22 21 23
##  [24] 19 21 20 20 24 19 21 23 23 20 18 23 20 25 25 18 22 25 21 20 25 19 21
##  [47] 22 18 24 21 22 22 24 20 22 23 22 20 25 19 20 24 24 21 23 18 20 23 24
##  [70] 25 22 23 23 20 24 23 18 19 21 23 21 22 25 21 24 20 19 23 25 22 25 24
##  [93] 22 22 22 23 18 25 18 22
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
##  1        1 control      2.98    1.21  Woman     25
##  2        2 control      2.82    1.10  Man       20
##  3        3 control      2.52    3.45  Woman     21
##  4        4 control      1.43    0.737 Man       21
##  5        5 control      5.14    3.41  Woman     22
##  6        6 control      2.58    0.966 Man       23
##  7        7 control      3.79    1.05  Woman     22
##  8        8 control      4.13    1.62  Man       23
##  9        9 control      3.46    1.75  Woman     19
## 10       10 control      3.29    2.22  Man       24
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
##  1        1 control      2.98    1.21  Woman     25   -0.599      -0.568
##  2        2 control      2.82    1.10  Man       20   -0.683      -0.650
##  3        3 control      2.52    3.45  Woman     21   -0.843       1.09 
##  4        4 control      1.43    0.737 Man       21   -1.43       -0.919
##  5        5 control      5.14    3.41  Woman     22    0.571       1.07 
##  6        6 control      2.58    0.966 Man       23   -0.813      -0.750
##  7        7 control      3.79    1.05  Woman     22   -0.158      -0.690
##  8        8 control      4.13    1.62  Man       23    0.0219     -0.260
##  9        9 control      3.46    1.75  Woman     19   -0.338      -0.167
## 10       10 control      3.29    2.22  Man       24   -0.428       0.183
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
##  1        1 control      2.98
##  2        2 control      2.82
##  3        3 control      2.52
##  4        4 control      1.43
##  5        5 control      5.14
##  6        6 control      2.58
##  7        7 control      3.79
##  8        8 control      4.13
##  9        9 control      3.46
## 10       10 control      3.29
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
##  1        1 control      2.98    1.21  Woman     25   -0.599      -0.568
##  2        2 control      2.82    1.10  Man       20   -0.683      -0.650
##  3        3 control      2.52    3.45  Woman     21   -0.843       1.09 
##  4        4 control      1.43    0.737 Man       21   -1.43       -0.919
##  5        5 control      5.14    3.41  Woman     22    0.571       1.07 
##  6        6 control      2.58    0.966 Man       23   -0.813      -0.750
##  7        7 control      3.79    1.05  Woman     22   -0.158      -0.690
##  8        8 control      4.13    1.62  Man       23    0.0219     -0.260
##  9        9 control      3.46    1.75  Woman     19   -0.338      -0.167
## 10       10 control      3.29    2.22  Man       24   -0.428       0.183
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
## 1 Man    control       1.24 0.843    25
## 2 Man    manipulation  2.84 1.16     25
## 3 Woman  control       1.26 1.06     25
## 4 Woman  manipulation  2.56 1.44     25
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
## dep_var       1 100 4.09 1.85   4.15    4.12 2.31 -1.23 7.51  8.74 -0.16
## dep_var_z     2 100 0.00 1.00   0.04    0.02 1.25 -2.87 1.84  4.71 -0.16
## confound      3 100 1.97 1.35   1.83    1.93 1.36 -0.77 6.42  7.19  0.42
## confound_z    4 100 0.00 1.00  -0.10   -0.03 1.01 -2.04 3.30  5.34  0.42
##            kurtosis   se
## dep_var       -0.74 0.19
## dep_var_z     -0.74 0.10
## confound       0.05 0.13
## confound_z     0.05 0.10
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
## dep_var       1 50  2.56 1.11   2.62    2.58 0.79 -1.23 5.18  6.42 -0.47
## dep_var_z     2 50 -0.83 0.60  -0.79   -0.81 0.43 -2.87 0.59  3.46 -0.47
## confound      3 50  1.25 0.95   1.13    1.23 0.92 -0.77 3.45  4.21  0.17
## confound_z    4 50 -0.54 0.70  -0.62   -0.55 0.68 -2.04 1.09  3.13  0.17
##            kurtosis   se
## dep_var        1.91 0.16
## dep_var_z      1.91 0.08
## confound      -0.29 0.13
## confound_z    -0.29 0.10
## -------------------------------------------------------- 
## condition: manipulation
##            vars  n mean   sd median trimmed  mad   min  max range  skew
## dep_var       1 50 5.62 0.97   5.74    5.62 0.93  3.41 7.51  4.09 -0.13
## dep_var_z     2 50 0.83 0.52   0.89    0.83 0.50 -0.36 1.84  2.21 -0.13
## confound      3 50 2.70 1.30   2.72    2.69 1.28 -0.54 6.42  6.96  0.10
## confound_z    4 50 0.54 0.97   0.55    0.53 0.95 -1.87 3.30  5.18  0.10
##            kurtosis   se
## dep_var       -0.64 0.14
## dep_var_z     -0.64 0.07
## confound       0.18 0.18
## confound_z     0.18 0.14
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
## t = -14.738, df = 96.329, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.474772 -2.649912
## sample estimates:
##      mean in group control mean in group manipulation 
##                   2.555030                   5.617372
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
##                2.0972                 2.5307                 0.3666
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
##     Min      1Q  Median      3Q     Max 
## -3.5237 -0.5781  0.0653  0.5231  2.2996 
## 
## Coefficients:
##                       Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            2.09724    0.17198  12.195  < 2e-16 ***
## conditionmanipulation  2.53072    0.22762  11.118  < 2e-16 ***
## confound               0.36655    0.08502   4.311  3.9e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.9566 on 97 degrees of freedom
## Multiple R-squared:  0.7391,	Adjusted R-squared:  0.7337 
## F-statistic: 137.4 on 2 and 97 DF,  p-value: < 2.2e-16
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
## (Intercept) 136.088  1 148.710 < 2.2e-16 ***
## condition   113.124  1 123.617 < 2.2e-16 ***
## confound     17.010  1  18.588 3.899e-05 ***
## Residuals    88.767 97                      
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
