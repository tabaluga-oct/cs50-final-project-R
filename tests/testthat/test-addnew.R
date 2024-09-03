describe("addnew()", {

  it("checks or creats a copy of original file", {
    addnew("alien", "👽") # call the function
    copy_csv_path <- system.file("extdata", "copy.csv", package = "emojiworld")
    expect_equal(file.exists(copy_csv_path), TRUE)
  })
  it("adds new emojis into copy.csv", {
    addnew("alien", "👽") # call the function
    copy_csv_path <- system.file("extdata", "copy.csv", package = "emojiworld")
    df_copy <- read.csv(copy_csv_path, stringsAsFactors = FALSE) # read the CSV file
    expect_equal(df_copy[df_copy$Emotion == "alien", "Emoji"], "👽")
  })
  it("does not add duplicate emotion words", {
    expect_equal(addnew("happy", "👽"), "Existed.")
  })
  it("handles case sensitivity", {
    addnew("ClowN", "🤡") # call the function
    copy_csv_path <- system.file("extdata", "copy.csv", package = "emojiworld")
    df_copy <- read.csv(copy_csv_path, stringsAsFactors = FALSE) # read the CSV file
    expect_equal(df_copy[df_copy$Emotion == "clown", "Emoji"], "🤡")
  })
  it("handles invalid input", {
    expect_equal(addnew("happy"), "Invalid.")
  })
  it("handles NULL", {
    expect_equal(addnew(NULL), "Invalid.")
  })
  it("handles empty input", {
    expect_equal(addnew(" "), "Invalid.")
  })
})
