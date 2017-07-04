# basic authentication with github

auth <- function(user, password) {
  stopifnot(isTruthyChar(user), isTruthyChar(password))
  # config handle
  h <- curl::new_handle()
  curl::handle_setopt(h, URL = 'https://api.github.com/user')
  curl::handle_setopt(h, HEADER = 1L)
  curl::handle_setopt(h, NOBODY = 1L)
  curl::handle_setopt(h, NOPROGRESS = 1L)
  curl::handle_setopt(h, HTTPAUTH = 1L)
  curl::handle_setopt(h, USERPWD = paste0(user, ':', password))
  # perform request
  res <- curl::curl_fetch_memory('https://api.github.com/user', h)
  hd <- rawToChar(res$headers)
  status <- as.integer(sub('^.*Status\\s*:\\s*(\\d+).*$', '\\1', hd, TRUE))
  msg <- sub('^.*Status\\s*:\\s*\\d+\\s*([[:alpha:]]+)\\s.*$', '\\1', hd, TRUE)
  return(structure(status, message=msg))
}
