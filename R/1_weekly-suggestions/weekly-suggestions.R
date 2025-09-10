# raw data
df <- arrow::open_dataset("./data/raw/nfl-picks.parquet")

# filter to season and week
season_     <- 2025
week_       <- 2
week_string <- stringr::str_pad(week_, width = 2, pad = "0", side = "left")

# get best odds on Sunday
out <- df |>
  dplyr::filter(Season == season_) |>
  dplyr::filter(Week == week_) |>
  dplyr::filter(Day == "Sun") |>
  dplyr::select(`Team-Home`,`Team-Away`,`Line-League`,`Line-Pinnacle`,`Line-Diff`,`Team-Pick`) |>
  dplyr::arrange(desc(abs(`Line-Diff`))) |>
  dplyr::collect()

# export sorted table
write.csv(
  x         = out, 
  file      = paste0("./data/derived/weekly-suggestions/nfl-picks-",season_,"-",week_string,".csv"),
  row.names = FALSE,
  na        = "")
