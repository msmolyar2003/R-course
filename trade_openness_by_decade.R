#SMOLYAR DATASET AND GRAPH


# Figure: Trade Openness by Decade
# Dataset: Reuveny and Li (2003)

library(haven)
library(ggplot2)

# Import the dataset from your Mac
data <- read_dta(file.choose())

# Create a boxplot
figure <- ggplot(data, aes(x = factor(decade),
                           y = dmtrade)) +
  geom_boxplot(fill = "purple", na.rm = TRUE) +
  labs(
    title = "Trade Openness Across Decades",
    x = "Decade",
    y = "Trade Openness"
  ) +
  theme_minimal()

# Display the figure
print(figure)

# Save the figure as a PNG
ggsave(
  "trade_openness_by_decade.png",
  plot = figure,
  width = 8,
  height = 5,
  dpi = 300
)
getwd()
file.exists("trade_openness_by_decade.png")

#This boxplot illustrates the distribution of trade 
#openness across countries from the 1960s through the 
#1990s using the Reuveny and Li (2003) data set. Each 
#observation represents a country-decade. The figure 
#suggests that median trade openness generally 
#increased over time, although substantial variation 
#exists between countries within each decade.