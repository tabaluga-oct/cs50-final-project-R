# get words that represent emotions
getemword <- function(text) {
  # Determine the correct file path based on file existence
  copy_csv_path <- system.file("extdata", "copy.csv", package = "emojiworld")
  emoji_csv_path <- system.file("extdata", "emoji.csv", package = "emojiworld")

  if (file.exists(copy_csv_path)) {
    file_path <- copy_csv_path
  } else if (file.exists(emoji_csv_path)) {
    file_path <- emoji_csv_path
  } else {
    stop("Neither copy.csv nor emoji.csv exist in the expected locations.")
  }

  df <- read.csv(file_path)
  emword <- df$Emotion
  words <- unlist(stringr::str_split(text, "\\W+"))
  matches <- match(tolower(words), emword)
  matched_words <- words[!is.na(matches)]
  return(matched_words)
}

