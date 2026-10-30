# SMOLYAR Replication Project — Part 1

## Research Article
Reuveny, Rafael, and Quan Li (2003).
"Economic Openness, Democracy, and Income Inequality:
An Empirical Analysis."
Comparative Political Studies, 36(5), 575–601.

## Project Description
This project replicates Table 1, Column 1 (All Countries)
from Reuveny and Li (2003) using R.

## Data Source
The replication dataset (replicate.dta) was obtained from:
https://github.com/joshuaalley/cross-sectional-ols/tree/master/reuveny-li-2003

Original dataset location:
data/raw/replicate.dta

The dataset is in Stata format and is imported into R
using the haven package.

## Software and Packages
R Version: 4.6.1 (2026-06-24)

Required packages:
- haven
- lmtest
- sandwich

## Repository Structure
- data/raw/ — Original dataset
- data/clean/ — Cleaned data, if needed
- scripts/ — R scripts
- output/ — Regression results
- README.md — Project information

## Replication Script
scripts/01_replicate.R

This script imports the dataset, runs the OLS regression,
calculates country-clustered standard errors, and saves
the results in output/table1_replication.txt.

## How to Reproduce the Results

1. Open downloaded repository in RStudio and set main repository folder as working directory. 
2. Make sure replicate.dta is in data/raw/.
3. Install the required packages if they are not installed:

   install.packages(c("haven", "lmtest", "sandwich"))

4. Run the replication script in the R Console:

   source("scripts/01_replicate.R")

5. Find the regression results in:
   output/table1_replication.txt

## Expected Results
- Observations: 142
- Adjusted R-squared: approximately 0.6867
- Replicated regression: Table 1, Column 1