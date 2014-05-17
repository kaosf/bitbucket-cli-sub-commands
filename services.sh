#!/bin/bash

case $1 in
  show)
    if [ $# -lt 3 ]
    then
      echo 'Usage:' >&2
      echo '  bb services show owner-name repository-name' >&2
      exit 1
    fi
    ;;
  add)
    if [ $# -lt 6 ]
    then
      echo 'Usage:' >&2
      echo '  bb services add owner-name repository-name type key value [key2 value2 [key3 value3 ...]]' >&2
      echo >&2
      echo 'Examples:' >&2
      echo '  bb services add kaosf myrepos POST URL http://example.com' >&2
      echo '  bb services add kaosf myrepos AgileZen "API Key" abc "Project Id" xyz' >&2
      exit 1
    fi
    ;;
  *)
    echo 'Usage:' >&2
    echo '  bb services show owner-name repository-name' >&2
    echo '  bb services add owner-name repository-name type key value [key2 value2 [key3 value3 ...]]' >&2
    exit 1
    ;;
esac

source $PREFIX/libexec/bitbucket-cli-sub-commands/auth

if [ $1 == show ]
then
  shift
  curl --user $USERNAME:$PASSWORD https://bitbucket.org/api/1.0/repositories/$1/$2/services
else
  shift
  OWNER=$1
  REPOSITORY=$2
  TYPE=$3
  shift
  shift
  shift
  FIELDS=''
  while [ $# -gt 1 ]
  do
    FIELDS="$FIELDS -F \"$1\"=\"$2\""
    shift
    shift
  done
  CMD="curl --request POST --user $USERNAME:$PASSWORD https://bitbucket.org/api/1.0/repositories/$OWNER/$REPOSITORY/services -F type=\"$TYPE\" $FIELDS"
  eval $CMD
fi
