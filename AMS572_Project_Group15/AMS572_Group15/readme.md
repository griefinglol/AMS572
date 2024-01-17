This compressed file includes all the dataset and codes for AMS572 Group Project from Group15
Here is the clarification for the usage of the files.

Dateset:
data.csv  --- the original dataset without manipulation

data_updated.csv --- the dataset which is manipulated in some columns to make MNAR ampute work

h1_mcar.csv --- dataset for hypothesis 1 with missing value in form of MCAR
h1_mnar.csv --- dataset for hypothesis 1 with missing value in form of MNAR
h2_mcar.csv --- dataset for hypothesis 2 with missing value in form of MCAR
h2_mnar.csv --- dataset for hypothesis 2 with missing value in form of MNAR

h1_mcar_imputed.csv --- dataset for hypothesis 1 after imputation of MCAR missing value
h1_mnar_imputed.csv --- dataset for hypothesis 1 after imputation of MNAR missing value
h2_mcar_imputed.csv --- dataset for hypothesis 2 after imputation of MCAR missing value
h2_mnar_imputed.csv --- dataset for hypothesis 2 after imputation of MNAR missing value

R file:
EDA.R --- r script for exploratory data analysis
Correlation.R --- Drafting the relationship and plots among different variables when exploratory data analysis

h1.R --- r script for hypothesis 1 with original dataset
h1_mcar.R --- r script for hypothesis 1 with dataset after imputation of MCAR missing value
h1_mnar.R --- r script for hypothesis 1 with dataset after imputation of MNAR missing value

test2_logistic.R --- r script for hypothesis 2 with original dataset
test2_mcar.R --- r script for hypothesis 2 with dataset after imputation of MCAR missing value
test2_mnar.R --- r script for hypothesis 2 with dataset after imputation of MNAR missing value

missingvalue.R --- r script for generating missing value in form of MCAR and MNAR for both hypotheses
imputation_h1.R --- r script for imputation the missing value for hypothesis 1
imputation_h2.R --- r script for imputation the missing value for hypothesis 2
