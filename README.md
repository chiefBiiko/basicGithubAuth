# basicGithubAuth

[![Build Status](https://travis-ci.org/chiefBiiko/basicGithubAuth.svg?branch=master)](https://travis-ci.org/chiefBiiko/basicGithubAuth) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/chiefBiiko/basicGithubAuth?branch=master&svg=true)](https://ci.appveyor.com/project/chiefBiiko/basicGithubAuth) [![Coverage Status](https://img.shields.io/codecov/c/github/chiefBiiko/basicGithubAuth/master.svg)](https://codecov.io/github/chiefBiiko/basicGithubAuth?branch=master)

Basic authentication with the Github API.

## Get it

```r
devtools::install_github('chiefBiiko/basicGithubAuth')
```

## Usage

Provide username and password. Get back `200` if authentication was successful.

```r
basicGithubAuth::authenticate('hadley', 'sesameopen')  # 401
```

MIT