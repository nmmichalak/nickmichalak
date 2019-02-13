---
title: 'Learn R for Psychology Research: A Crash Course'
author: ''
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
##  [1] -1.6228442  0.1636283  1.5740176  0.0519191 -0.6639786 -0.5934770
##  [7] -0.4911630  0.1134652  0.5964660 -1.0249600
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
##   [1] 4.0565629 2.5847322 2.0304130 3.5655654 3.6922099 2.7341437 2.7432375
##   [8] 2.6707821 2.8197913 1.8276046 3.5338583 0.7280862 2.6559049 3.7169552
##  [15] 2.1134685 3.8482039 0.9567492 2.7056738 1.1958775 1.9093809 3.0985145
##  [22] 2.3399157 2.3920267 0.7228594 1.9412242 1.7235010 2.7133104 2.6886600
##  [29] 2.6620315 1.3692638 2.0513191 3.8688267 4.1137073 2.6092756 1.3949239
##  [36] 3.2977555 1.7241135 2.2813580 3.6284990 2.2412973 3.6995888 1.4882986
##  [43] 1.1689207 1.9584211 2.5376671 3.6934163 4.0981852 1.9974615 1.4624499
##  [50] 1.9802672 5.8672280 4.3617850 3.9016823 5.9927529 6.1540822 6.2928852
##  [57] 5.3944302 4.6467000 6.3308234 5.2739548 5.9892061 4.5643275 6.0524585
##  [64] 5.2098495 5.3814857 4.3904814 5.6632697 4.4155542 6.1175932 8.5269152
##  [71] 4.4605750 4.5453816 6.3328670 4.9788512 4.7307535 6.3496603 7.4419082
##  [78] 5.0578007 4.4172509 4.5168278 4.9809291 4.8991019 4.0758327 5.5074604
##  [85] 6.1929120 5.7637421 5.5112808 3.2064964 5.9285873 7.1565382 4.8593787
##  [92] 5.9360891 6.9277301 5.7985197 6.5973414 4.2788015 5.8314906 7.3933707
##  [99] 5.4426392 5.8879991
```

## Create a potentially confounding variable or a control variable
> in the code below, we multiply every value in dep_var by 0.5 and then we "add noise": 100 random normal values whose true population has a mean = 0 and sd = 1. Every value in dep_var * 0.5 gets a random value added to it.


```r
confound <- dep_var * 0.5 + rnorm(n = 100, mean = 0, sd = 1)

# print confound by just excecuting/running the name of the object
confound
```

```
##   [1]  1.84588128  1.34576253  2.03239676  2.29609601  2.17655102
##   [6]  1.96250573  1.18372118  3.21908101  1.69288842  1.74637678
##  [11]  3.18352985  0.16153823  2.56471374  1.87444207  0.47692616
##  [16]  0.43528880  0.41816603  2.07912386  1.27476627  1.79349039
##  [21]  1.45229984  1.52588987  1.81140875  2.40914648  0.48381923
##  [26] -0.16254231  2.00099531  0.73057938  0.28098294 -0.01171062
##  [31]  0.29247738  1.82808187  2.05652554  0.25360125  0.67724472
##  [36]  2.66015020  1.95375793  1.84587758  1.00329289  0.55159508
##  [41]  2.60395638 -0.63994742  1.57866649  0.36389066  2.38231889
##  [46]  0.92340151  2.94044126  0.96212960  1.22219907  0.17354404
##  [51]  1.84076259  3.99971622  2.51431058  5.12688597  3.75786329
##  [56]  3.01726873  3.38537477 -0.14166548  5.17298606  2.02997635
##  [61]  2.95068942  0.38116932  3.43751982  2.35057371  1.84395621
##  [66]  0.17018643  3.95881146  2.94733447  3.33666213  4.36308994
##  [71]  2.48740905  1.76387879  1.88305251  1.72784552  3.81394845
##  [76]  2.34605481  3.45626118  2.31408402  2.03862446  2.79100160
##  [81]  1.94363857  1.57092471 -0.49043793  3.62267428  3.74205376
##  [86]  0.96245468  2.57642826  2.03468201  4.05308055  2.27469504
##  [91]  2.66726542  2.91265146  3.05592481  5.58515504  2.09446286
##  [96]  2.76985663  3.42296304  2.50968056  0.75359134  3.09652891
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
##   [1] 23 20 20 22 18 23 25 25 21 18 23 23 23 20 22 19 20 20 23 18 25 25 21
##  [24] 22 19 24 25 19 21 20 20 23 22 23 24 25 18 19 19 18 22 22 21 25 21 18
##  [47] 25 25 21 22 18 22 21 20 22 18 23 25 23 20 20 23 21 19 25 24 20 22 22
##  [70] 24 25 18 24 19 21 25 22 24 18 25 25 21 24 19 18 25 23 22 25 18 25 22
##  [93] 25 20 20 18 19 21 19 21
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
##  1        1 control      4.06     1.85 Woman     23
##  2        2 control      2.58     1.35 Man       20
##  3        3 control      2.03     2.03 Woman     20
##  4        4 control      3.57     2.30 Man       22
##  5        5 control      3.69     2.18 Woman     18
##  6        6 control      2.73     1.96 Man       23
##  7        7 control      2.74     1.18 Woman     25
##  8        8 control      2.67     3.22 Man       25
##  9        9 control      2.82     1.69 Woman     21
## 10       10 control      1.83     1.75 Man       18
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
##  1        1 control      4.06     1.85 Woman     23    0.0283   -0.137  
##  2        2 control      2.58     1.35 Man       20   -0.790    -0.528  
##  3        3 control      2.03     2.03 Woman     20   -1.10      0.00859
##  4        4 control      3.57     2.30 Man       22   -0.245     0.215  
##  5        5 control      3.69     2.18 Woman     18   -0.174     0.121  
##  6        6 control      2.73     1.96 Man       23   -0.707    -0.0460 
##  7        7 control      2.74     1.18 Woman     25   -0.702    -0.655  
##  8        8 control      2.67     3.22 Man       25   -0.742     0.936  
##  9        9 control      2.82     1.69 Woman     21   -0.659    -0.257  
## 10       10 control      1.83     1.75 Man       18   -1.21     -0.215  
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
##  1        1 control      4.06
##  2        2 control      2.58
##  3        3 control      2.03
##  4        4 control      3.57
##  5        5 control      3.69
##  6        6 control      2.73
##  7        7 control      2.74
##  8        8 control      2.67
##  9        9 control      2.82
## 10       10 control      1.83
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
##  1        1 control      4.06     1.85 Woman     23    0.0283   -0.137  
##  2        2 control      2.58     1.35 Man       20   -0.790    -0.528  
##  3        3 control      2.03     2.03 Woman     20   -1.10      0.00859
##  4        4 control      3.57     2.30 Man       22   -0.245     0.215  
##  5        5 control      3.69     2.18 Woman     18   -0.174     0.121  
##  6        6 control      2.73     1.96 Man       23   -0.707    -0.0460 
##  7        7 control      2.74     1.18 Woman     25   -0.702    -0.655  
##  8        8 control      2.67     3.22 Man       25   -0.742     0.936  
##  9        9 control      2.82     1.69 Woman     21   -0.659    -0.257  
## 10       10 control      1.83     1.75 Man       18   -1.21     -0.215  
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
## 1 Man    control       1.21 1.00     25
## 2 Man    manipulation  2.50 1.39     25
## 3 Woman  control       1.58 0.841    25
## 4 Woman  manipulation  2.79 1.17     25
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
## dep_var       1 100 4.01 1.80   4.07    3.99 2.18  0.72 8.53  7.80 0.11
## dep_var_z     2 100 0.00 1.00   0.03   -0.01 1.21 -1.82 2.51  4.34 0.11
## confound      3 100 2.02 1.28   2.02    1.99 1.28 -0.64 5.59  6.23 0.23
## confound_z    4 100 0.00 1.00   0.00   -0.03 1.00 -2.08 2.79  4.87 0.23
##            kurtosis   se
## dep_var       -0.94 0.18
## dep_var_z     -0.94 0.10
## confound      -0.13 0.13
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
## dep_var       1 50  2.50 0.93   2.56    2.51 1.03  0.72 4.11  3.39  0.04
## dep_var_z     2 50 -0.84 0.52  -0.80   -0.83 0.57 -1.82 0.06  1.88  0.04
## confound      3 50  1.40 0.93   1.55    1.39 1.02 -0.64 3.22  3.86 -0.08
## confound_z    4 50 -0.49 0.73  -0.37   -0.49 0.80 -2.08 0.94  3.02 -0.08
##            kurtosis   se
## dep_var       -0.95 0.13
## dep_var_z     -0.95 0.07
## confound      -0.91 0.13
## confound_z    -0.91 0.10
## -------------------------------------------------------- 
## condition: manipulation
##            vars  n mean   sd median trimmed  mad   min  max range  skew
## dep_var       1 50 5.51 1.02   5.51    5.46 0.99  3.21 8.53  5.32  0.39
## dep_var_z     2 50 0.84 0.57   0.84    0.81 0.55 -0.44 2.51  2.96  0.39
## confound      3 50 2.64 1.28   2.62    2.68 1.14 -0.49 5.59  6.08 -0.18
## confound_z    4 50 0.49 1.00   0.47    0.52 0.89 -1.96 2.79  4.75 -0.18
##            kurtosis   se
## dep_var        0.24 0.14
## dep_var_z      0.24 0.08
## confound       0.16 0.18
## confound_z     0.16 0.14
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
## t = -15.378, df = 97.158, p-value < 2.2e-16
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
##  -3.398447 -2.621526
## sample estimates:
##      mean in group control mean in group manipulation 
##                   2.500725                   5.510712
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
##                1.9826                 2.5482                 0.3705
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
## -2.15242 -0.45451 -0.05696  0.54339  2.37938 
## 
## Coefficients:
##                       Estimate Std. Error t value Pr(>|t|)    
## (Intercept)            1.98257    0.16867  11.754  < 2e-16 ***
## conditionmanipulation  2.54824    0.20426  12.475  < 2e-16 ***
## confound               0.37055    0.08023   4.619 1.19e-05 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 0.8906 on 97 degrees of freedom
## Multiple R-squared:  0.7598,	Adjusted R-squared:  0.7549 
## F-statistic: 153.4 on 2 and 97 DF,  p-value: < 2.2e-16
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
## (Intercept) 109.587  1 138.161 < 2.2e-16 ***
## condition   123.449  1 155.637 < 2.2e-16 ***
## confound     16.921  1  21.332 1.186e-05 ***
## Residuals    76.939 97                      
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
