* read data.
GET DATA
  /TYPE=TXT
  /FILE="/Users/nicholasmichalak/nicholas_michalak/blog_entries/2018/nrg05/lC14T8.csv"
  /ENCODING='Locale'
  /DELCASE=LINE
  /DELIMITERS=","
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=2
  /IMPORTCASE=ALL
  /VARIABLES=
  subj F2.0
  Group F1.0
  age F4.1
  age_lbl A5
  angle A6
  rt F3.0
  angle_num F1.0
  angle_lbl A9
  angle_linear F4.1
  angle_quadratic F3.1.
CACHE.
EXECUTE.
DATASET NAME lC14T8 WINDOW=FRONT.

* treat subjects as nominal.
VARIABLE LEVEL subj (NOMINAL).

* fit model with unstructured covariance and polynomial angle slopes for subjects.
MIXED rt WITH angle_linear angle_quadratic angle_num age
   /FIXED = angle_linear angle_quadratic age angle_linear * age angle_quadratic * age
   /PRINT = SOLUTION TESTCOV
   /RANDOM = INTERCEPT angle_linear angle_quadratic | SUBJECT(subj) COVTYPE(UN).
