# Purpose: move Excel table to the project directory and convert to csv/parquet formats

# read Excel dataset
df <- readxl::read_xlsx("/Users/pje/Documents/Personal/Misc/NFL-picks/NFL-picks.xlsx", sheet = 1)

# write as csv format to view on git & download
write.csv(
  x         = df, 
  file      = "./data/raw/nfl-picks.csv",
  row.names = FALSE,
  na        = "")

# write as parquet for analysis
arrow::write_parquet(
  x    = df,
  sink = "./data/raw/nfl-picks.parquet")