\name{addemoji}
\alias{addemoji}
\title{Add Emoji}
\description{
  The user inputs a string of text, and the function finds all the matching emojis for words representing emotions, then adds the emojis after the words.
}
\usage{
addemoji(text)
}
\arguments{
  \item{text}{A character string containing the text to be processed.}
}
\value{
  A character string with emojis added.
}
\examples{
addemoji("I am happy")
}