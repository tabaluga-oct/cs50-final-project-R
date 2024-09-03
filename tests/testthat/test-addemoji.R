describe("addemoji()", {
  it("adds emojis to the words it detects", {
    expect_equal(addemoji("I'm happy"), "I'm happy😊")
  })
  it("sensors words with repeated words", {
    expect_equal(
      addemoji("I'm happy, but I'm also hurt hurt."),
      "I'm happy😊, but I'm also hurt😢 hurt😢.")
  })
  it("sensors different words with same emojis", {
    expect_equal(
      addemoji("I feel very happy and a bit frustrated today. It's a frustrating day."),
      "I feel very happy😊 and a bit frustrated😣 today. It's a frustrating😣 day.")
  })
  it("returns the exactly same words", {
    expect_equal(
      addemoji("It was an eXcItIng day full of LOVE and joy."),
      "It was an eXcItIng😆 day full of LOVE❤️ and joy.")
  })
})
