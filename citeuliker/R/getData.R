getData <- function(group=NA) {
  if (!is.na(group)) {
    handle = new_handle()
    handle_setheaders(handle, "User-Agent" = "r/citeuliker")
    url = paste("http://www.citeulike.org/json/group/", group, sep="")
    conn <- curl::curl(url, handle, open="r")
    txt <- readLines(conn)
    close(conn)
    fromJSON(txt)
  }
}
