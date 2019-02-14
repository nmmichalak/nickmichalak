---
title: Using Principal Components or Common Factor Analysis in Social Psychology
author: ''
date: '2019-02-13'
slug: using-principal-components-or-common-factor-analysis-in-social-psychology
categories:
  - measurement
tags:
  - principal component analysis
  - latent variables
  - measurement
  - reliability
  - common factor analysis
image:
  caption: ''
  focal_point: ''
---

# INCOMPLETE POST

# Measuring variables we can't observe

# Multidimensional Scaling

# Partitioning variance

## Common Variance

### Communality

## Unique Variance

### Specific Variance

### Error Variance

# SPSS Anxiety Questionnaire (SAQ)

## Description

## Data

### Install packages and/or load libraries


```r
# install.packages("tidyverse")
# install.packages("haven")
# install.packages("psych")

library(tidyverse)
library(haven)
library(psych)
```

### Read SPSS Anxiety Questionnaire data


```r
saq <- read_spss(file = "data/SAQ.sav")
```

### Correlation matrix


```r
cor.plot(saq, numbers = TRUE, scale = FALSE)
```

<img src="/post/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology_files/figure-html/unnamed-chunk-3-1.png" width="672" />

### Histograms


```r
saq %>% 
  gather(key = variable, value = response) %>% 
  ggplot(mapping = aes(x = response)) +
  geom_histogram(binwidth = 1, color = "white") +
  facet_wrap(facets = ~ variable)
```

```
## Warning: attributes are not identical across measure variables;
## they will be dropped
```

<img src="/post/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology_files/figure-html/unnamed-chunk-4-1.png" width="672" />

### Parallel Analysis


```r
fa.parallel(saq, fm = "minres", fa = "both")
```

<img src="/post/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology_files/figure-html/unnamed-chunk-5-1.png" width="672" />

```
## Parallel analysis suggests that the number of factors =  7  and the number of components =  4
```

# Principal Components Analysis

## all items


```r
principal(saq, rotate = "varimax") %>% 
  print(sort = TRUE)
```

```
## Principal Components Analysis
## Call: principal(r = saq, rotate = "varimax")
## Standardized loadings (pattern matrix) based upon correlation matrix
##      V   PC1    h2   u2 com
## q18 18  0.70 0.492 0.51   1
## q07  7  0.69 0.469 0.53   1
## q16 16  0.68 0.461 0.54   1
## q13 13  0.67 0.453 0.55   1
## q12 12  0.67 0.447 0.55   1
## q21 21  0.66 0.432 0.57   1
## q14 14  0.66 0.430 0.57   1
## q11 11  0.65 0.426 0.57   1
## q17 17  0.64 0.414 0.59   1
## q04  4  0.63 0.403 0.60   1
## q03  3 -0.63 0.396 0.60   1
## q15 15  0.59 0.351 0.65   1
## q01  1  0.59 0.343 0.66   1
## q06  6  0.56 0.316 0.68   1
## q05  5  0.56 0.309 0.69   1
## q08  8  0.55 0.301 0.70   1
## q10 10  0.44 0.191 0.81   1
## q20 20  0.44 0.190 0.81   1
## q19 19 -0.43 0.182 0.82   1
## q02  2 -0.30 0.092 0.91   1
## q22 22 -0.30 0.091 0.91   1
## q09  9 -0.28 0.081 0.92   1
## q23 23 -0.14 0.021 0.98   1
## 
##                 PC1
## SS loadings    7.29
## Proportion Var 0.32
## 
## Mean item complexity =  1
## Test of the hypothesis that 1 component is sufficient.
## 
## The root mean square of the residuals (RMSR) is  0.07 
##  with the empirical chi square  6633.48  with prob <  0 
## 
## Fit based upon off diagonal values = 0.94
```

## 4 components


```r
principal(saq, nfactors = 4, rotate = "varimax") %>% 
  print(sort = TRUE)
```

```
## Principal Components Analysis
## Call: principal(r = saq, nfactors = 4, rotate = "varimax")
## Standardized loadings (pattern matrix) based upon correlation matrix
##     item   RC3   RC1   RC4   RC2   h2   u2 com
## q06    6  0.80 -0.01  0.10 -0.07 0.65 0.35 1.0
## q18   18  0.68  0.33  0.13 -0.08 0.60 0.40 1.5
## q13   13  0.65  0.23  0.23 -0.10 0.54 0.46 1.6
## q07    7  0.64  0.33  0.16 -0.08 0.55 0.45 1.7
## q14   14  0.58  0.36  0.14 -0.07 0.49 0.51 1.8
## q10   10  0.55  0.00  0.13 -0.12 0.33 0.67 1.2
## q15   15  0.46  0.22  0.29 -0.19 0.38 0.62 2.6
## q20   20 -0.04  0.68  0.07 -0.14 0.48 0.52 1.1
## q21   21  0.29  0.66  0.16 -0.07 0.55 0.45 1.5
## q03    3 -0.20 -0.57 -0.18  0.37 0.53 0.47 2.3
## q12   12  0.47  0.52  0.09 -0.08 0.51 0.49 2.1
## q04    4  0.32  0.52  0.31  0.04 0.47 0.53 2.4
## q16   16  0.33  0.51  0.31 -0.12 0.49 0.51 2.6
## q01    1  0.24  0.50  0.36  0.06 0.43 0.57 2.4
## q05    5  0.32  0.43  0.24  0.01 0.34 0.66 2.5
## q08    8  0.13  0.17  0.83  0.01 0.74 0.26 1.1
## q17   17  0.27  0.22  0.75 -0.04 0.68 0.32 1.5
## q11   11  0.26  0.21  0.75 -0.14 0.69 0.31 1.5
## q09    9 -0.09 -0.20  0.12  0.65 0.48 0.52 1.3
## q22   22 -0.19  0.03 -0.10  0.65 0.46 0.54 1.2
## q23   23 -0.02  0.17 -0.20  0.59 0.41 0.59 1.4
## q02    2 -0.01 -0.34  0.07  0.54 0.41 0.59 1.7
## q19   19 -0.15 -0.37 -0.03  0.43 0.34 0.66 2.2
## 
##                        RC3  RC1  RC4  RC2
## SS loadings           3.73 3.34 2.55 1.95
## Proportion Var        0.16 0.15 0.11 0.08
## Cumulative Var        0.16 0.31 0.42 0.50
## Proportion Explained  0.32 0.29 0.22 0.17
## Cumulative Proportion 0.32 0.61 0.83 1.00
## 
## Mean item complexity =  1.8
## Test of the hypothesis that 4 components are sufficient.
## 
## The root mean square of the residuals (RMSR) is  0.06 
##  with the empirical chi square  4006.15  with prob <  0 
## 
## Fit based upon off diagonal values = 0.96
```

# Common Factor Analysis

## all items


```r
fa(saq, fm = "minres", rotate = "oblimin") %>% 
  print(sort = TRUE)
```

```
## Factor Analysis using method =  minres
## Call: fa(r = saq, rotate = "oblimin", fm = "minres")
## Standardized loadings (pattern matrix) based upon correlation matrix
##      V   MR1    h2   u2 com
## q18 18  0.68 0.464 0.54   1
## q07  7  0.66 0.440 0.56   1
## q16 16  0.66 0.430 0.57   1
## q13 13  0.65 0.422 0.58   1
## q12 12  0.64 0.416 0.58   1
## q21 21  0.63 0.400 0.60   1
## q14 14  0.63 0.398 0.60   1
## q11 11  0.63 0.392 0.61   1
## q17 17  0.62 0.381 0.62   1
## q04  4  0.61 0.369 0.63   1
## q03  3 -0.60 0.360 0.64   1
## q15 15  0.56 0.317 0.68   1
## q01  1  0.56 0.310 0.69   1
## q06  6  0.53 0.283 0.72   1
## q05  5  0.52 0.275 0.73   1
## q08  8  0.52 0.269 0.73   1
## q10 10  0.41 0.164 0.84   1
## q20 20  0.40 0.163 0.84   1
## q19 19 -0.39 0.156 0.84   1
## q02  2 -0.28 0.076 0.92   1
## q22 22 -0.27 0.075 0.92   1
## q09  9 -0.26 0.066 0.93   1
## q23 23 -0.13 0.017 0.98   1
## 
##                 MR1
## SS loadings    6.64
## Proportion Var 0.29
## 
## Mean item complexity =  1
## Test of the hypothesis that 1 factor is sufficient.
## 
## The degrees of freedom for the null model are  253  and the objective function was  7.55 with Chi Square of  19334.49
## The degrees of freedom for the model are 230  and the objective function was  1.74 
## 
## The root mean square of the residuals (RMSR) is  0.07 
## The df corrected root mean square of the residuals is  0.07 
## 
## The harmonic number of observations is  2571 with the empirical chi square  5547.21  with prob <  0 
## The total number of observations was  2571  with Likelihood Chi Square =  4463.05  with prob <  0 
## 
## Tucker Lewis Index of factoring reliability =  0.756
## RMSEA index =  0.085  and the 90 % confidence intervals are  0.082 0.087
## BIC =  2657.08
## Fit based upon off diagonal values = 0.95
## Measures of factor score adequacy             
##                                                    MR1
## Correlation of (regression) scores with factors   0.96
## Multiple R square of scores with factors          0.91
## Minimum correlation of possible factor scores     0.83
```

## 6 factors


```r
fa(saq, nfactors = 6, fm = "minres", rotate = "oblimin") %>% 
  print(sort = TRUE)
```

```
## Loading required namespace: GPArotation
```

```
## Factor Analysis using method =  minres
## Call: fa(r = saq, nfactors = 6, rotate = "oblimin", fm = "minres")
## Standardized loadings (pattern matrix) based upon correlation matrix
##     item   MR1   MR4   MR5   MR2   MR3   MR6   h2   u2 com
## q06    6  0.77  0.02 -0.09  0.00 -0.08  0.09 0.57 0.43 1.1
## q18   18  0.60  0.01  0.14 -0.04  0.14 -0.03 0.56 0.44 1.2
## q13   13  0.53  0.14  0.12 -0.08  0.03 -0.04 0.49 0.51 1.3
## q07    7  0.49  0.03  0.05  0.00  0.21  0.11 0.50 0.50 1.5
## q14   14  0.38  0.01  0.17 -0.03  0.14  0.10 0.42 0.58 1.9
## q12   12  0.31 -0.02  0.25 -0.07  0.26  0.00 0.45 0.55 3.1
## q10   10  0.28  0.01  0.17 -0.08 -0.14  0.16 0.22 0.78 3.1
## q08    8 -0.06  0.85  0.00  0.06  0.01  0.00 0.67 0.33 1.0
## q11   11  0.07  0.74 -0.02 -0.10  0.00  0.01 0.63 0.37 1.1
## q17   17  0.06  0.63  0.09  0.03  0.02  0.06 0.57 0.43 1.1
## q01    1  0.00  0.08  0.71  0.01 -0.04 -0.05 0.51 0.49 1.0
## q16   16 -0.03  0.01  0.53 -0.08  0.05  0.27 0.54 0.46 1.6
## q05    5  0.11  0.02  0.48 -0.01  0.02  0.02 0.34 0.66 1.1
## q04    4  0.10  0.09  0.42  0.04  0.15  0.06 0.42 0.58 1.5
## q09    9  0.02  0.09 -0.02  0.59  0.01 -0.07 0.35 0.65 1.1
## q22   22 -0.11 -0.08  0.03  0.50  0.11  0.03 0.26 0.74 1.3
## q02    2  0.05  0.01  0.03  0.45 -0.16 -0.03 0.26 0.74 1.3
## q23   23 -0.02 -0.12  0.08  0.36  0.09  0.04 0.12 0.88 1.5
## q03    3 -0.01 -0.08 -0.20  0.35 -0.26 -0.03 0.46 0.54 2.7
## q19   19 -0.06 -0.03 -0.02  0.34 -0.19 -0.01 0.25 0.75 1.7
## q21   21  0.14  0.06  0.04  0.02  0.65  0.03 0.60 0.40 1.1
## q20   20 -0.11  0.06 -0.04 -0.09  0.59  0.04 0.37 0.63 1.2
## q15   15  0.03  0.04  0.00 -0.01  0.00  0.80 0.70 0.30 1.0
## 
##                        MR1  MR4  MR5  MR2  MR3  MR6
## SS loadings           2.37 2.01 1.94 1.40 1.50 1.06
## Proportion Var        0.10 0.09 0.08 0.06 0.07 0.05
## Cumulative Var        0.10 0.19 0.27 0.34 0.40 0.45
## Proportion Explained  0.23 0.20 0.19 0.14 0.15 0.10
## Cumulative Proportion 0.23 0.43 0.62 0.75 0.90 1.00
## 
##  With factor correlations of 
##       MR1   MR4   MR5   MR2   MR3   MR6
## MR1  1.00  0.45  0.48 -0.29  0.39  0.49
## MR4  0.45  1.00  0.54 -0.17  0.38  0.44
## MR5  0.48  0.54  1.00 -0.29  0.53  0.43
## MR2 -0.29 -0.17 -0.29  1.00 -0.35 -0.34
## MR3  0.39  0.38  0.53 -0.35  1.00  0.33
## MR6  0.49  0.44  0.43 -0.34  0.33  1.00
## 
## Mean item complexity =  1.5
## Test of the hypothesis that 6 factors are sufficient.
## 
## The degrees of freedom for the null model are  253  and the objective function was  7.55 with Chi Square of  19334.49
## The degrees of freedom for the model are 130  and the objective function was  0.23 
## 
## The root mean square of the residuals (RMSR) is  0.02 
## The df corrected root mean square of the residuals is  0.02 
## 
## The harmonic number of observations is  2571 with the empirical chi square  364.32  with prob <  4.4e-24 
## The total number of observations was  2571  with Likelihood Chi Square =  577.8  with prob <  1.1e-57 
## 
## Tucker Lewis Index of factoring reliability =  0.954
## RMSEA index =  0.037  and the 90 % confidence intervals are  0.034 0.04
## BIC =  -442.96
## Fit based upon off diagonal values = 1
## Measures of factor score adequacy             
##                                                    MR1  MR4  MR5  MR2  MR3
## Correlation of (regression) scores with factors   0.90 0.92 0.88 0.82 0.85
## Multiple R square of scores with factors          0.81 0.84 0.78 0.67 0.73
## Minimum correlation of possible factor scores     0.63 0.68 0.56 0.33 0.46
##                                                    MR6
## Correlation of (regression) scores with factors   0.86
## Multiple R square of scores with factors          0.75
## Minimum correlation of possible factor scores     0.49
```

# General word of caution
> Above, I listed resources prepared by experts on these and related topics. Although I generally do my best to write accurate posts, don't assume my posts are 100% accurate or that they apply to your data or research questions. Trust statistics and methodology experts, not blog posts.


