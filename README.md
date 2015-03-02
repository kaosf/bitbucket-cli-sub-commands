# Bitbucket CLI sub commands

Add `browse`, `deploy-keys`, `download-archive`, `fork`, `group-privilege` and
`services` sub commands to `bb` command.

Not a sub command, single command such as `bb-browse` can be also used.

## Prerequisites

* Python 2.x and pip (for BitBucket CLI)
* cURL (`curl` command)
* Make (`make` command)
* [BitBucket CLI](https://bitbucket.org/zhemao/bitbucket-cli) (`bitbucket-cli`
and `bb` commands) version 0.4.1
* `~/.bitbucket` file for authentication

### Ubuntu 14.04 example

```sh
sudo apt-get install python-pip make curl
sudo pip install bitbucket-cli==0.4.1
```

```sh
cat <<EOF > ~/.bitbucket
[auth]
username = kaosf
password = xxxxxxxxxx
EOF
chmod 600 ~/.bitbucket
```

## Installation

```sh
./configure
# or
#./configure --prefix=$HOME
make
make install
```

And then, copy and paste `profile` to your `~/.profile`, `~/.bash_profile` or
etc.

Set `BROWSER` environment variable to `bb browse`. For example,
`export BROWSER=firefox`.

## License

[MIT](http://opensource.org/licenses/MIT)

Copyright (C) 2014-2015 ka
