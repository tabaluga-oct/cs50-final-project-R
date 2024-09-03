addnew <- function(emotion = NULL, emoji = NULL) {
  package_name <- "emojiworld"

  # Path to the original emoji.csv file inside the package
  emoji_csv_path <- system.file("extdata", "emoji.csv", package = package_name)

  # Path to the copy.csv file (same directory as emoji.csv)
  copy_csv_path <- file.path(dirname(emoji_csv_path), "copy.csv")

  # Copy the file only if it doesn't already exist
  if (!file.exists(copy_csv_path)) {
    # Ensure the directory exists
    destination_dir <- dirname(copy_csv_path)
    if (!dir.exists(destination_dir)) {
      dir.create(destination_dir, recursive = TRUE)
    }

    # Copy emoji.csv to copy.csv
    fs::file_copy(emoji_csv_path, copy_csv_path)
  }
  # Read the copy.csv file into a dataframe
  df_copy <- read.csv(copy_csv_path, stringsAsFactors = FALSE)

  # Input validation
  if (is.null(emotion) || is.null(emoji) ||
      !is.character(emotion) || !is.character(emoji) ||
      trimws(emotion) == "" || trimws(emoji) == "") {
    return("Invalid.")
  }

  # Check if the emotion already exists
  if (tolower(emotion) %in% df_copy$Emotion) {
    return("Existed.")
  } else {
    # Add the new emotion-emoji pair to the dataframe
    new_row <- data.frame("Emotion" = tolower(emotion), "Emoji" = emoji, stringsAsFactors = FALSE)
    df_copy <- rbind(df_copy, new_row)

    # Append the new row to the CSV file
    write.table(
      new_row,
      file = copy_csv_path,
      sep = ",",
      col.names = FALSE,
      row.names = FALSE,
      append = TRUE,
      quote = TRUE
    )

    return("Added.")
  }
}
