#!/bin/bash

if [ $# -lt 2 ]
then
  echo 'Usage:' >&2
  echo '  bb fork owner-name repository-name' >&2
  exit 1
fi

source $PREFIX/libexec/bitbucket-cli-sub-commands/auth

curl --request POST --user $USERNAME:$PASSWORD \
  https://bitbucket.org/api/1.0/repositories/$1/$2/fork \
  -F name=$2 \
  -F is_private=true
