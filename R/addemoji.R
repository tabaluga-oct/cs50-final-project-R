addemoji <- function(text) {
  # Re-read the data frame since getemword does not returns it
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

  words <- getemword(text)
  for (word in words) {
    emoji <- df$Emoji[df$Emotion == tolower(word)]
    text <- gsub(
      paste0("\\b", word, "(?!", emoji, ")\\b"),
      paste0(word, emoji),
      text,
      ignore.case = TRUE,
      perl = TRUE
    )
  }
  return(text)
}

