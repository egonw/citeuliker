getData <- function(group=NA, user=NA, paging=NA) {
  handle = new_handle()
  handle_setheaders(handle, "User-Agent" = "r/citeuliker")
  if (!is.na(group)) {
    url = paste("http://www.citeulike.org/json/group/", group, sep="")
  } else if (!is.na(user)) {
    options = "";
    if (!is.na(paging)) {
      options = paste("?page=", paging[0], "&per_page=", paging[1], sep="")
    }
    url = paste("http://www.citeulike.org/json/user/", user, options, sep="")
  } else {
    stop("You must give a user or group identifier");
  }
  conn <- curl::curl(url, handle, open="r")
  txt <- readLines(conn)
  close(conn)
  data = fromJSON(txt)
  data["year"] <- sapply(data["published"][[1]], function(row) { row[1] })
  data["month"] <- sapply(data["published"][[1]], function(row) { row[2] })
  data["day"] <- sapply(data["published"][[1]], function(row) { row[3] })
  return(data)
}
