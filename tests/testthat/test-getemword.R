describe("getemword()", {
  it("sensors words which describe emotions", {
    expect_equal(getemword("I'm happy"), "happy")
  })
  it("sensors words with irregular punctuation", {
    expect_equal(
      getemword("I feel very happy and a bit §sad today.     hurt"),
      c("happy", "sad", "hurt"))
  })
  it("sensors words with repeated words", {
    expect_equal(
      getemword("I feel very happy and a bit §sad today.     hurt, hurt"),
      c("happy", "sad", "hurt", "hurt"))
  })
  it("returns the exactly same words", {
    expect_equal(
      getemword("It was an eXcItIng day full of LOVE and joy."),
      c("eXcItIng", "LOVE"))
  })
})
