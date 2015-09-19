getData <- function(group=NA, user=NA, paging=NA) {
  if (!is.na(group)) {
    handle = new_handle()
    handle_setheaders(handle, "User-Agent" = "r/citeuliker")
    url = paste("http://www.citeulike.org/json/group/", group, sep="")
    conn <- curl::curl(url, handle, open="r")
    txt <- readLines(conn)
    close(conn)
    return(fromJSON(txt))
  }
  if (!is.na(user)) {
    handle = new_handle()
    handle_setheaders(handle, "User-Agent" = "r/citeuliker")
    options = "";
    if (!is.na(paging)) {
      options = paste("?page=", paging[0], "&per_page=", paging[1], sep="")
    }
    url = paste("http://www.citeulike.org/json/user/", user, options, sep="")
    conn <- curl::curl(url, handle, open="r")
    txt <- readLines(conn)
    close(conn)
    return(fromJSON(txt))
  }
}
