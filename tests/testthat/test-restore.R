describe("restore()", {
  it("deletes the copy.csv", {
    copy_csv_path <- system.file("extdata", "copy.csv", package = "emojiworld")
    restore()
    expect_equal(file.exists(copy_csv_path), FALSE)
  })
  it("handles non-existent copy.csv gracefully", {
    copy_csv_path <- system.file("extdata", "copy.csv", package = "emojiworld")
    if (file.exists(copy_csv_path)) {
      file.remove(copy_csv_path)
    }
    expect_error(restore(), NA) # Expect no error
  })
})