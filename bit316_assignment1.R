# BIT316 Assignment 1: Data Structures & Data Wrangling
# Dataset: a small CSV extract based on the approved starwars dataset.
# Run this script from the project root in RStudio.

# Load all required packages at the top.
library(readr)
library(dplyr)
library(tidyr)

# -------------------------------------------------------------------
# Part A: Native data structures
# -------------------------------------------------------------------

# Numeric vector: vectorised arithmetic and subsetting.
scores <- c(68, 74, 91, 56, 83)
scores_bonus <- scores + 5
print(scores_bonus)
print(scores[scores >= 70])
print(scores[c(1, 3)])

# Character vector and indexing.
student_names <- c("Ama", "Kojo", "Esi", "Yaw")
print(student_names[2])
print(student_names[student_names != "Esi"])

# Factor: levels represent the distinct categories.
eye_colours <- c("blue", "brown", "blue", "green", "brown")
eye_colour_factor <- factor(eye_colours)
print(eye_colour_factor)
print(levels(eye_colour_factor))

# List containing different data types; access by name and position.
student_record <- list(
  name = "Ama",
  age = 21L,
  enrolled = TRUE,
  marks = c(78, 85, 90)
)
print(student_record$name)
print(student_record[[2]])
print(student_record[["marks"]])

# Matrix: access one row, one column and one cell.
marks_matrix <- matrix(
  c(70, 82, 91, 66, 88, 95),
  nrow = 3,
  ncol = 2,
  dimnames = list(c("Ama", "Kojo", "Esi"), c("Test", "Exam"))
)
print(marks_matrix[1, ])       # first row
print(marks_matrix[, "Exam"])  # Exam column
print(marks_matrix[2, 1])      # second row, first column

# Data frame created by hand; access row, column and single cell.
class_df <- data.frame(
  name = c("Ama", "Kojo", "Esi"),
  programme = c("BIT", "BIT", "Computer Science"),
  score = c(78, 85, 90)
)
print(class_df[1, ])            # first row
print(class_df$score)           # score column
print(class_df[2, "score"])     # one cell

# -------------------------------------------------------------------
# Part B: Importing and exploring the dataset
# -------------------------------------------------------------------

# Read from a CSV stored in the repository, not from an absolute path.
survey <- readr::read_csv("data/starwars.csv", show_col_types = FALSE)

# Confirm the import and inspect the data.
print(dim(survey))
print(names(survey))
dplyr::glimpse(survey)
str(survey)
print(summary(survey))
print(head(survey, 6))

# Count missing values in every column.
missing_by_column <- colSums(is.na(survey))
print(missing_by_column)

# -------------------------------------------------------------------
# Part C: Wrangling with dplyr and tidyr
# -------------------------------------------------------------------

# Keep characters with recorded height above 100 cm, select useful
# columns, derive height in metres, and sort tallest first.
tall_characters <- survey |>
  filter(!is.na(height), height > 100) |>
  select(name, species, height, mass) |>
  mutate(height_m = height / 100) |>
  arrange(desc(height))
print(tall_characters)

# Grouped summaries: number of characters and mean height by species.
species_summary <- survey |>
  filter(!is.na(species), !is.na(height)) |>
  group_by(species) |>
  summarise(
    character_count = n(),
    mean_height_cm = mean(height),
    .groups = "drop"
  ) |>
  arrange(desc(character_count))
print(species_summary)

# Handle missing values only for the calculation that needs height
# and species. We do not delete rows from the original imported data.
complete_height_species <- survey |>
  drop_na(species, height)
print(dim(complete_height_species))

# Reshape the two colour columns so each character has one row per
# attribute. This is tidier for comparing or plotting colour attributes.
colours_long <- survey |>
  select(name, hair_color, eye_color) |>
  pivot_longer(
    cols = c(hair_color, eye_color),
    names_to = "attribute",
    values_to = "colour"
  )
print(head(colours_long, 10))

# Optional extra grouped summary: count each eye colour.
eye_colour_counts <- survey |>
  filter(!is.na(eye_color)) |>
  count(eye_color, sort = TRUE)
print(eye_colour_counts)

# End of script. If execution reaches this point, all sections ran.
message("BIT316 assignment script completed successfully.")
