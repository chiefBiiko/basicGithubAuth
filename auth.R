# auth

#' @keywords internal
auth <- function(github.name, password) {
  stopifnot(isTruthyChar(github.name), isTruthyChar(password), curl_inst())
  # desetup io 
  on.exit({
    unlink(script.x)
    unlink('netrc.txt')  
  })
  # shells and scripts
  if (.Platform$OS.type == 'windows') {
    os.shell <- 'cmd.exe'
    script.x <- 'auth.bat'
    auth.cmd <- paste0('curl https://api.github.com/user ', 
                       '--netrc-file netrc.txt -I', '\n',
                       'exit')
  } else {
    os.shell <- 'sh.exe'
    script.x <- 'auth.sh'
    auth.cmd <- paste0('#!/usr/bin/env sh\n', 
                       'curl https://api.github.com/user ', 
                       '--netrc-file netrc.txt -I', '\n',
                       'exit')
  }
  # save authentication command as shell script
  cat(auth.cmd, file=script.x)
  # password file
  cat(paste('machine api.github.com login', github.name, 'password', password), 
      file='netrc.txt')
  # info to user
  message('Authenticating with the Github API via curl...')
  # do auth, provide stdin, capture stdout
  chk <- system2(os.shell, input=script.x, stdout=TRUE)
  # check response
  status <- as.integer(gsub('[^[:digit:]]', '', 
                            hdr <- chk[grep('^\\s*Status:\\s*\\d+.*$', chk)]))
  msg <- trimws(sub('^.*\\d+\\s*', '', hdr))
  # exit
  return(structure(status, message=msg))
}
