# delete copy from user
restore <- function() {
  copy_csv_path <- system.file("extdata", "copy.csv", package = "emojiworld")
  emoji_csv_path <- system.file("extdata", "emoji.csv", package = "emojiworld")

  if (file.exists(copy_csv_path)) {
    file.remove(copy_csv_path)
  }
}
