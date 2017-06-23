# curl

# config handle
h <- curl::new_handle()
curl::handle_setopt(h, URL = 'https://api.github.com/user');
curl::handle_setopt(h, NOPROGRESS = 1L);
curl::handle_setopt(h, NOBODY = 1L);
curl::handle_setopt(h, HEADER = 1L);
curl::handle_setopt(h, NETRC = 1L);
curl::handle_setopt(h, NETRC_FILE = 'netrc.txt');
curl::handle_setopt(h, USERAGENT = 'curl/7.53.1');
curl::handle_setopt(h, MAXREDIRS = 50L);
curl::handle_setopt(h, SSH_KNOWNHOSTS = 'C:/Users/web_45454/AppData/Roaming/_ssh/known_hosts');
curl::handle_setopt(h, FILETIME = 1L);
curl::handle_setopt(h, TCP_KEEPALIVE = 1L);

#
# pending configs:
#   Authorization header with hashed password
#   [Host & Accept headers]
#

# perform request
req <- curl::curl_fetch_memory('https://api.github.com/user', handle = h)
cat(rawToChar(req$headers))