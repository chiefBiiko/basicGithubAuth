# basic authentication with Github

#' Authenticate via Github
#'
#' @param user character. Github user name.
#' @param password character. Github password.
#' @return integer. Status code of the response: \code{200} if
#' authentication succesfull.
#'
#' @export
authenticate <- function(user, password) {
  stopifnot(is.character(user), length(user) == 1L,
            is.character(password), length(password) == 1L)
  h <- curl::new_handle()
  curl::handle_setopt(h, NOBODY=1L)
  curl::handle_setopt(h, HTTPAUTH=1L)
  curl::handle_setopt(h, USERPWD=paste0(user, ':', password))
  re <- curl::curl_fetch_memory('https://api.github.com/user', h)
  return(re$status_code)
}
