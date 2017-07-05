# basic authentication with github

#' Authenticate via Github
#'
#' @param user Github user name.
#' @param password Github password.
#' @return Integer status code of the authentication response from the Github 
#' API; \code{200} if authentication succesfull. 
#'
#' @export
authenticate <- function(user, password) {
  stopifnot(isTruthyChar(user), isTruthyChar(password))
  h <- curl::new_handle()
  curl::handle_setopt(h, HEADER = 1L)
  curl::handle_setopt(h, NOBODY = 1L)
  curl::handle_setopt(h, HTTPAUTH = 1L)
  curl::handle_setopt(h, USERPWD = paste0(user, ':', password))
  res <- curl::curl_fetch_memory('https://api.github.com/user', h)
  hd <- rawToChar(res$headers)
  status <- as.integer(sub('^.*Status\\s*:\\s*(\\d+).*$', '\\1', hd, TRUE))
  msg <- sub('^.*Status\\s*:\\s*\\d+\\s*([[:alpha:]]+)\\s.*$', '\\1', hd, TRUE)
  return(structure(status, message=msg))
}
