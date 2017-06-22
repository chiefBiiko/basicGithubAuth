# auth

#' @export
auth <- function(github.name, password) {
  stopifnot(isTruthyChar(github.name), isTruthyChar(password), curl_inst())
  # desetup io 
  on.exit(unlink(script.x))
  # shells and scripts
  if (.Platform$OS.type == 'windows') {
    script.x <- 'auth.bat'
    os.shell <- 'cmd.exe'
  } else {
    script.x <- 'auth.sh'
    os.shell <- 'sh.exe'
  }
  # authentication command
  auth.cmd <- paste0('curl https://api.github.com/user ', 
                     '--user ', github.name, ':', password, '\n',
                     'exit')
  # save authentication command as shell script
  cat(auth.cmd, file=script.x)
  # info to user
  message('Authenticating with the Github API via cURL...')
  # do auth, provide stdin, capture stdout
  chk <- system2(os.shell, input=script.x, stdout=TRUE)
  # check response
  login <- sub('^\\s*"login":\\s"(.*)".*$', '\\1', 
               chk[grep('.*(?<="login":)', chk, perl=TRUE)], 
               perl=TRUE)
  # exit
  return(if (length(login) != 0L) login else NULL)
}


