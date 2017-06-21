# rack

#' @export
auth <- function(github.name) {
  stopifnot(isTruthyChar(github.name))
  # desetup io 
  on.exit({
    unlink(script.x)
    unlink('auth.log')
    unlink('auth.json')
  })
  # shells and scripts
  if (.Platform$OS.type == 'windows') {
    script.x <- 'auth.bat'
    os.shell <- 'cmd.exe'
  } else {
    script.x <- 'auth.sh'
    os.shell <- 'sh.exe'
  }
  # authorization command
  auth.cmd <- paste('curl', '--user', github.name, 
                    'https://api.github.com/user', '>', 'auth.json\n',
                    'echo AUTH_END > auth.log\n',
                    'exit')
  # save authorization command as shell script
  cat(auth.cmd, file=script.x)
  # info to user
  message('Enter ', script.x, ' in your shell,\nthen your Github password')
  # open up shell ..
  system2(os.shell, wait=FALSE, invisible=FALSE)
  # wait for user to complete
  repeat {
    Sys.sleep(.5)
    if (file.exists('auth.log')) break
  }
  # check auth.json
  login <- jsonlite::fromJSON('auth.json')$login
  # exit
  return(login)  # if authentication failed login is NULL
}


