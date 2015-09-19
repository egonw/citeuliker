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
getData(group, user, paging)
}
\arguments{
 \item{group}{CiteULike group number}
 \item{user}{CiteULike user account}
 \item{paging}{a vector of lenght 2 with the page and per_page information.}
}
\value{
 \item{data}{data retrieved from CiteULike}
}
\examples{
groupList <- getData(group=19781)
# get the first (page=1) ten items in egonw's library
accountList <- getData(user="egonw", paging=c(1,10))
}
\author{
Egon Willighagen
}
