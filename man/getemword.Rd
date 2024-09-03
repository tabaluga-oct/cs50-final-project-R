\name{getemword}
\alias{getemword}
\title{Find Words Representing Emotions}
\description{
  The user inputs a string of text, and the function returns all the words related to emotions based on the dataset.
}
\usage{
getemword(text)
}
\arguments{
  \item{text}{A string containing the text to be analyzed.}
}
\value{
  A list of strings representing the emotion-related words found in the input text.
}
\examples{
getemword("I'm happy.")
}

