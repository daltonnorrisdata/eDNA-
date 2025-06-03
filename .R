# Load libraries
library(tidyverse)
library(ggplot2)

# Load sample data
edna <- read_csv("edna_sample_data.csv")

# Summarize total detections and number of unique genera per region
summary_stats <- edna %>%
  group_by(region) %>%
  summarise(
    total_detections = sum(detections),
    unique_genera = n_distinct(genera)
  )

print("Summary Stats:")
print(summary_stats)

# Bubble chart
ggplot(edna, aes(x = region, y = detections, size = detections, fill = region)) +
  geom_point(alpha = 0.7, shape = 21, color = "black") +
  facet_wrap(~ region, scales = "free", nrow = 1) +
  labs(
    title = "eDNA Detections by Region",
    subtitle = "Bubble size indicates number of detections per genus",
    x = "Region",
    y = "Detections"
  ) +
  theme_minimal() +
  scale_size(range = c(3, 20))

# Save plot
ggsave("edna_bubble_chart.png", width = 10, height = 5)
