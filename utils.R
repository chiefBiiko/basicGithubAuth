# utils

#' @keywords internal
isTruthyChar <- function(x) {
  if (is.character(x) && nchar(x) > 0L) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

init <- function(prothostport='http://127.0.0.1:65080') {
  stopifnot(isTruthyChar(prothostport))
  utils::browseURL(prothostport)
}