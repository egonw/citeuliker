# citeuliker

R Client library for CiteULike (http://citeulike.org/).

Advantages:

* it sets the User-Agent, compliant with CiteULike requirements
* exposes the API with basic R method(s)

# install

    > install.packages(c("curl", "jsonlite")) # dependencies
    > install.packages("testthat") # if you want to test the package
    > install.packages("devtools") # to install from GitHub
    > library(devtools)
    > install_github("egonw/citeuliker", subdir="citeuliker")

# example

    > library(citeuliker)
    > data = getData(group=19781)
    > dois = na.omit(data["doi"])
