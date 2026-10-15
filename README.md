# BIT316 Assignment 1 — Data Structures & Data Wrangling

## Dataset
This project uses `data/starwars.csv`, a small CSV extract based on the `starwars` dataset approved as an example in the assignment brief. It is included in the repository so the script reads data from a relative file path. If your lecturer requires the Community Health & Wellbeing Survey from the LMS, replace this CSV and adapt the column names and analysis accordingly.

## Requirements
- R 4.x
- `readr`
- `dplyr`
- `tidyr`

Install the packages once in R:
```r
install.packages(c("readr", "dplyr", "tidyr"))
```

## How to run
1. Download or clone this repository.
2. Open the project folder in RStudio.
3. Set the working directory to the project root (the folder containing this README).
4. Open `bit316_assignment1.R`.
5. Run the script from top to bottom.

The script uses `data/starwars.csv` as a relative path, so keep the folder structure intact.

## What the script demonstrates
- Numeric and character vectors, vectorised operations, and indexing.
- Factors and their levels.
- A list containing different types and access by name/position.
- Matrix and data-frame row, column, and cell access.
- CSV import, dimensions, types, overview, first rows, and missing-value counts.
- A `dplyr` pipe chain using `filter()`, `select()`, `mutate()`, and `arrange()`.
- Grouped count and mean-height summaries.
- Missing-value handling with `drop_na()` for the analysis that requires height and species.
- Reshaping colour attributes with `pivot_longer()`.

## Initial observations
The included extract contains fictional Star Wars character records. Height and mass have missing values for some characters, so the script reports missingness before analysis and excludes missing height/species only for the grouped height summary. The grouped output can be used to identify species represented in the extract and compare their mean recorded heights. Run the script to see exact results for this CSV.

## Submission checklist
- [ ] Confirm the dataset choice is accepted by your lecturer.
- [ ] Run the script from a fresh R session and resolve any errors.
- [ ] Add your own name/student ID where required by your course submission process.
- [ ] Commit meaningful progress to Git at different stages (do not create misleading backdated commits).
- [ ] Capture a screenshot or console log showing successful completion.
- [ ] Submit the repository ZIP and repository URL through the LMS as instructed.
