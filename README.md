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

# example 1: get all DOIs from a library

    > data = citeuliker::getData(group=19781)
    > dois = na.omit(data["doi"])

# example 2: from which year are publications

    > barplot(table(citeuliker::getData(user="egonw")[,"year"]))

# example 3: find papers with missing start/end page

    > incomplete = data[complete.cases(data[,c("start_page","end_page")]),"article_id"]
    
