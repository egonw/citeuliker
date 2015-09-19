getData <- function(group=NA, user=NA, paging=NA) {
  handle = new_handle()
  handle_setheaders(handle, "User-Agent" = "r/citeuliker")
  if (!is.na(group)) {
    url = paste("http://www.citeulike.org/json/group/", group, sep="")
  } else if (!is.na(user)) {
    options = "";
    if (!missing(paging)) {
      options = paste("?page=", paging[1], "&per_page=", paging[2], sep="")
    }
    url = paste("http://www.citeulike.org/json/user/", user, options, sep="")
  } else {
    stop("You must give a user or group identifier");
  }
  conn <- curl::curl(url, handle, open="r")
  txt <- readLines(conn)
  close(conn)
  data = fromJSON(txt)
  data[,"year"] <- laply(data[,"published"], function(x) {
    if (length(x) < 1) return(NA) else return(x[1])
  })
  data[,"month"] <- laply(data[,"published"], function(x) {
    if (length(x) < 2) return(NA) else return(x[2])
  })
  data[,"day"] <- laply(data[,"published"], function(x) {
    if (length(x) < 3) return(NA) else return(x[3])
  })
  return(data)
}
