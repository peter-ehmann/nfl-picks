# read Excel dataset
df <- readxl::read_xlsx("/Users/pje/Documents/Personal/Misc/NFL-picks/NFL-picks.xlsx", sheet = 1)

# filter out games that have not occured yet
out <- df |>
  dplyr::filter(Season == 2025 & Week <= 1)

# write as csv format to view on git & download
write.csv(
  x    = out, 
  file = "./data/raw/nfl-picks.csv", row.names = FALSE, na = "")

# write as parquet for analysis
arrow::write_parquet(
  x    = out,
  sink = "./data/raw/nfl-picks.parquet")