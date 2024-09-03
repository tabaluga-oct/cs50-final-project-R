describe("replaceemoji()", {
  it("replaces words with emojis", {
    expect_equal(replaceemoji("I'm happy"), c("I'm 😊"))
  })
  it("replaces words with repeated words", {
    expect_equal(
      replaceemoji("I'm happy, but I'm also hurt hurt."),
      "I'm 😊, but I'm also 😢 😢.")
  })
  it("replaces different words with same emojis", {
    expect_equal(
      replaceemoji("I feel very happy and a bit frustrated today. It's a frustrating day"),
      "I feel very 😊 and a bit 😣 today. It's a 😣 day")
  })
  it("handles irregular words", {
    expect_equal(
      replaceemoji("It was an eXcItIng day full of LOVE and joy."),
      "It was an 😆 day full of ❤️ and joy.")
  })
})
