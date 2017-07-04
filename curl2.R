# curl2
user <- 'chiefBiiko'; password <- 'africa25'
# config handle
h <- curl::new_handle()
curl::handle_setopt(h, BUFFERSIZE = 102400L)
curl::handle_setopt(h, URL = 'https://api.github.com/user')
curl::handle_setopt(h, NOPROGRESS = 1L)
curl::handle_setopt(h, HTTPAUTH = 1L)
curl::handle_setopt(h, USERPWD = paste0(user, ':', password))
curl::handle_setopt(h, USERAGENT = 'curl/7.54.1')
curl::handle_setopt(h, MAXREDIRS = 50L)
curl::handle_setopt(h, HTTP_VERSION = 4L)
#curl::handle_setopt(h, CAINFO = 'C:\\curl-7.54.1-win32-mingw\\bin\\curl-ca-bundle.crt')
#curl::handle_setopt(h, SSH_KNOWNHOSTS = 'C:/Users/Schwarz/AppData/Roaming/_ssh/known_hosts')
curl::handle_setopt(h, FILETIME = 1L)
curl::handle_setopt(h, TCP_KEEPALIVE = 1L)

# perform request
req <- curl::curl_fetch_memory('https://api.github.com/user', handle = h)
cat(rawToChar(req$headers))