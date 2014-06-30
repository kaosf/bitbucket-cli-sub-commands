#!/bin/bash

usage () {
  echo 'Usage:'                                                       >&2
  echo '  bb deploy-keys show   owner-name repository-name'           >&2
  echo '  bb deploy-keys add    owner-name repository-name label key' >&2
  echo '  bb deploy-keys delete owner-name repository-name label'     >&2
}

source $PREFIX/libexec/bitbucket-cli-sub-commands/auth

case $1 in
  show)
    if [ $# != 3 ]
    then
      echo '2 arguments (owner-name, repository-name) are required.' >&2
      exit 1
    fi
    curl --user $USERNAME:$PASSWORD "https://bitbucket.org/!api/1.0/repositories/${2}/${3}/deploy-keys"
    ;;
  add)
    if [ $# != 5 ]
    then
      echo '4 arguments (owner-name, repository-name, label, key) are required.' >&2
      echo 'For example:'                                                        >&2
      echo '  bb deploy-keys add owner repos ka@mypc `cat ~/.ssh/id_rsa.pub`'    >&2
      exit 1
    fi
    curl --request POST --user $USERNAME:$PASSWORD "https://bitbucket.org/!api/1.0/repositories/${2}/${3}/deploy-keys" -F label="$4" -F key="$5"
    ;;
  delete)
    if [ $# != 4 ]
    then
      echo '3 arguments (owner-name, repository-name, label) are required.' >&2
      exit 1
    fi
    curl --request DELETE --user $USERNAME:$PASSWORD "https://bitbucket.org/!api/1.0/repositories/${2}/${3}/deploy-keys/${4}"
    ;;
  *)
    usage
    exit 1
    ;;
esac
