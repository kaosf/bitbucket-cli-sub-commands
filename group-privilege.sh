#!/bin/bash

if [ $# -lt 5 ]
then
echo
  echo 'Usage:' >&2
  echo '  bb group-privilege owner-name repository-name team-name group-name (read|write|admin|none)' >&2
  echo >&2
  echo '    "none" means removing the privilege.' >&2
  exit 1
fi

source $PREFIX/libexec/bitbucket-cli-sub-commands/auth

if [ $5 = none ]
then
  curl --request DELETE --user $USERNAME:$PASSWORD https://bitbucket.org/api/1.0/group-privileges/$1/$2/$3/$4
else
  if [ $5 = read -o $5 = write -o $5 = admin ]
  then
    curl --request PUT --user $USERNAME:$PASSWORD https://bitbucket.org/api/1.0/group-privileges/$1/$2/$3/$4 --data $5
  else
    echo 'Error:' >&2
    echo '  5th argument must be in (read|write|admin|none)' >&2
    exit 1
  fi
fi
