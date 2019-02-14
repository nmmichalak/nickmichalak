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

## Install packages and/or load libraries


```r
# install.packages("tidyverse")
# install.packages("haven")
# install.packages("MASS")
# install.packages("psych")

library(tidyverse)
library(haven)
library(MASS)
library(psych)
```

## Data
> help("UScitiesD")  
> UScitiesD gives “straight line” distances between 10 cities in the US.


```r
UScitiesD %>% 
  as.matrix() %>% 
  as.data.frame()
```

```
##               Atlanta Chicago Denver Houston LosAngeles Miami NewYork
## Atlanta             0     587   1212     701       1936   604     748
## Chicago           587       0    920     940       1745  1188     713
## Denver           1212     920      0     879        831  1726    1631
## Houston           701     940    879       0       1374   968    1420
## LosAngeles       1936    1745    831    1374          0  2339    2451
## Miami             604    1188   1726     968       2339     0    1092
## NewYork           748     713   1631    1420       2451  1092       0
## SanFrancisco     2139    1858    949    1645        347  2594    2571
## Seattle          2182    1737   1021    1891        959  2734    2408
## Washington.DC     543     597   1494    1220       2300   923     205
##               SanFrancisco Seattle Washington.DC
## Atlanta               2139    2182           543
## Chicago               1858    1737           597
## Denver                 949    1021          1494
## Houston               1645    1891          1220
## LosAngeles             347     959          2300
## Miami                 2594    2734           923
## NewYork               2571    2408           205
## SanFrancisco             0     678          2442
## Seattle                678       0          2329
## Washington.DC         2442    2329             0
```

### distance matrix represented with colors


```r
UScitiesD %>% 
  as.matrix() %>% 
  as.data.frame() %>% 
  rownames_to_column() %>%
  rename(city1 = rowname) %>% 
  gather(key = city2, value = distance, -city1) %>% 
  ggplot(mapping = aes(x = city1, y = city2, fill = distance)) +
  geom_tile() +
  scale_fill_gradient(low = "blue", high = "red")
```

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3-1.png)

### non-Metric Multidimensional Scaling (2-dimensions, like a map)


```r
isoMDS.fit1 <- isoMDS(UScitiesD, k = 2, maxit = 50)
```

```
## initial  value 0.049975 
## iter   5 value 0.049265
## iter  10 value 0.048377
## iter  15 value 0.047490
## iter  20 value 0.046603
## iter  25 value 0.045715
## iter  30 value 0.044828
## iter  35 value 0.043941
## iter  40 value 0.043053
## iter  45 value 0.042166
## iter  50 value 0.041278
## final  value 0.041278 
## stopped after 50 iterations
```

### store points from fitted configuration


```r
isoMDS.data <- as_tibble(isoMDS.fit1$points) %>% 
  mutate(city = rownames(isoMDS.fit1$points))
```

```
## Warning: `as_tibble.matrix()` requires a matrix with column names or a `.name_repair` argument. Using compatibility `.name_repair`.
## This warning is displayed once per session.
```

#### plot


```r
isoMDS.data %>% 
  ggplot(mapping = aes(x = V2, y = V1, label = city)) +
  geom_point() +
  geom_label(nudge_y = 100)
```

![plot of chunk unnamed-chunk-6](figure/unnamed-chunk-6-1.png)

# Partitioning variance

## Common Variance

### Communality

## Unique Variance

### Specific Variance

### Error Variance

# SPSS Anxiety Questionnaire (SAQ)

## Description

### Read SPSS Anxiety Questionnaire data


```r
saq <- read_spss(file = "content/post/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology/data/SAQ.sav")
```

```
## Error: 'content/post/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology/data/SAQ.sav' does not exist in current working directory ('/Users/nicholasmichalak/nickmichalak/content/post/2019-02-13-using-principal-components-or-common-factor-analysis-in-social-psychology').
```

### Correlation matrix


```r
cor.plot(saq, numbers = TRUE, scale = FALSE)
```

```
## Error in cor.plot(saq, numbers = TRUE, scale = FALSE): object 'saq' not found
```

### Histograms


```r
saq %>% 
  gather(key = variable, value = response) %>% 
  ggplot(mapping = aes(x = response)) +
  geom_histogram(binwidth = 1, color = "white") +
  facet_wrap(facets = ~ variable)
```

```
## Error in eval(lhs, parent, parent): object 'saq' not found
```

### Parallel Analysis


```r
fa.parallel(saq, fm = "minres", fa = "both")
```

```
## Error in fa.parallel(saq, fm = "minres", fa = "both"): object 'saq' not found
```

# Principal Components Analysis

## all items


```r
principal(saq, rotate = "varimax") %>% 
  print(sort = TRUE)
```

```
## Error in principal(saq, rotate = "varimax"): object 'saq' not found
```

## 4 components


```r
principal(saq, nfactors = 4, rotate = "varimax") %>% 
  print(sort = TRUE)
```

```
## Error in principal(saq, nfactors = 4, rotate = "varimax"): object 'saq' not found
```

# Common Factor Analysis

## all items


```r
fa(saq, fm = "minres", rotate = "oblimin") %>% 
  print(sort = TRUE)
```

```
## Error in NROW(x): object 'saq' not found
```

## 6 factors


```r
fa(saq, nfactors = 6, fm = "minres", rotate = "oblimin") %>% 
  print(sort = TRUE)
```

```
## Error in NROW(x): object 'saq' not found
```

# General word of caution
> Above, I listed resources prepared by experts on these and related topics. Although I generally do my best to write accurate posts, don't assume my posts are 100% accurate or that they apply to your data or research questions. Trust statistics and methodology experts, not blog posts.


