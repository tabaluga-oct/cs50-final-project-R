\name{addnew}
\alias{addnew}
\title{Add a Custom Emoji}
\description{
  The user inputs a pair of strings, and the function adds them to the dataset, allowing the user to expand the vocabulary with their own entries.
}
\usage{
addnew(word, emoji)
}
\arguments{
  \item{word}{A string containing the word to be added.}
  \item{emoji}{An emoji associated with the word.}
}
\value{
  The word and its corresponding emoji are added to the dataset.
}
\examples{
addnew("alien", "👽")
}
