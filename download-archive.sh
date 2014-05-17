#!/bin/bash

if [ $# -lt 3 ]
then
  echo 'Usage:' >&2
  echo '  bb download-archive owner-name repository-name tag-name' >&2
  echo >&2
  echo 'Description:' >&2
  echo '  <tag-name>.tar.gz is downloaded.' >&2
  exit 1
fi

source $PREFIX/libexec/bitbucket-cli-sub-commands/auth

curl --digest --user $USERNAME:$PASSWORD https://bitbucket.org/$1/$2/get/$3.tar.gz -o $3.tar.gz
