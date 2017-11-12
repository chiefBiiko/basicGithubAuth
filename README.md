# basicGithubAuth

[![Build Status](https://travis-ci.org/chiefbiiko/basicGithubAuth.svg?branch=master)](https://travis-ci.org/chiefbiiko/basicGithubAuth) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/chiefbiiko/basicGithubAuth?branch=master&svg=true)](https://ci.appveyor.com/project/chiefbiiko/basicGithubAuth) [![Coverage Status](https://img.shields.io/codecov/c/github/chiefbiiko/basicGithubAuth/master.svg)](https://codecov.io/github/chiefbiiko/basicGithubAuth?branch=master)

***

Basic authentication with the Github API.

***

## Get it

```r
devtools::install_github('chiefbiiko/basicGithubAuth')
```

***

## Usage

Provide username and password. Get back `200` if authentication was successful.

```r
basicGithubAuth::authenticate('hadley', 'sesameopen')  # 401
```

***

## License

[MIT](./LICENSE)
