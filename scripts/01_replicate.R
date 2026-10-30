##SMOLYAR Replication Project Part 1 
##I used ChatGPT to help import the original Stata-format dataset into R (as I was unfamiliar with the process). I then used ChatGPT to help troubleshoot my R syntax because I would get errors in R and it was not easy to figure out where I went wrong. I also used AI to help set up the regression analysis, to help me adjust the Standard Errors by country, and to help save the results. I used the relevant code suggestions from ChatGPT in my replication script. 



##Create folders for raw data, cleaned data, scripts, and results
dir.create("data/raw", recursive=TRUE, showWarnings=FALSE)
dir.create("data/clean", recursive=TRUE, showWarnings=FALSE)
dir.create("scripts", showWarnings= FALSE)
dir.create("output", showWarnings= FALSE)
list.files("data/raw")
##displays files inside a folder

# Check that the dataset is in the correct folder
file.exists("data/raw/replicate.dta")
# Stop the script if the dataset is missing
stopifnot(file.exists("data/raw/replicate.dta"))

##Setup COMPLETE. BEGIN REUVENY AND LI(2003) REPLICATION

# Load the packages
library(haven)
library(lmtest)
library(sandwich)

# Import the original dataset
data <- read_dta("data/raw/replicate.dta")


#Display the number of rows, columns, and variable names
print(dim(data))
print(names(data))

# Replicate Table 1, Column 1 (All Countries) from the 2003 paper

# Run the OLS regression
model <- lm(
  gg ~ lgg + dmdem + dmtrade + dmportf +
    dmfdiin + dmgdppc + sqgdppc,
  data = data
)

# Display the regression results
print(summary(model))

# Check the number of observations
print(nobs(model))

# Calculate standard errors clustered by country
clustered_se <- vcovCL(
  model,
  cluster = ~cow,
  type = "HC1"
)


# Store and display the regression results w clustered SEs
results <- coeftest(model, vcov. = clustered_se)
print(results)

# Save the results as a text file
capture.output(
  print(results),
  paste("Observations:", nobs(model)),
  paste("Adjusted R-squared:",
        summary(model)$adj.r.squared),
  file = "output/table1_replication.txt"
)

#Check file exists 
file.exists("output/table1_replication.txt")