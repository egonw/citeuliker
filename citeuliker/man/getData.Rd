\name{getData}
\alias{getData}
\title{
Gets data from CiteULike.
}
\description{
Gets data from CiteULike and converts it into a R data structure. Internally,
it used the JSON data exchange format and the the R packages curl and jsonlite
to download the data.
}
\usage{
getData(group)
}
\arguments{
 \item{group}{CiteULike group number}
}
\value{
 \item{data}{data retrieved from CiteULike}
}
\examples{
data <- getData(group=19781)
}
\author{
Egon Willighagen
}
