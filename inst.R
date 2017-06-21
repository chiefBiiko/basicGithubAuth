# install cURL

install_curl <- function() {
  # ..
  if (!grepl("curl", Sys.getenv("PATH"))) {
    message('Please install curl and add it to your PATH environment variable')
    # 'https://curl.haxx.se/dlwiz/?type=bin'
  }
  
}