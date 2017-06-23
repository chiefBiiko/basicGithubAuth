# install cURL

#' @keywords internal
curl_inst <- function() {
  # check PATH
  if (!grepl("curl", Sys.getenv("PATH"))) {
    message('Please download a curl executable and add its directory\'s', 
            ' absolute path to your PATH environment variable.\n', 
            'Check out https://curl.haxx.se/dlwiz/?type=bin.')
    return(FALSE)
  } else {
    return(TRUE)
  }
}