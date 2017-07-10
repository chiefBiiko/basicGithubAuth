# basic authentication with Github

#' Authenticate via Github
#'
#' @param user character. Github user name.
#' @param password character. Github password.
#' @return integer. Status code of the authentication response from the Github 
#' API; \code{200} if authentication succesfull. 
#'
#' @export
authenticate <- function(user, password) {
  stopifnot(is.character(user), nchar(user) > 0L, 
            is.character(password), nchar(password) > 0L)
  h <- curl::new_handle()
  curl::handle_setopt(h, HEADER=1L)
  curl::handle_setopt(h, NOBODY=1L)
  curl::handle_setopt(h, HTTPAUTH=1L)
  curl::handle_setopt(h, USERPWD=paste0(user, ':', password))
  res <- curl::curl_fetch_memory('https://api.github.com/user', h)
  return(res$status_code)
}
