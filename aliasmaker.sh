#!/bin/bash

echo "##---------------------------------------------- ##
 	#           -- new-alias --                    #
 	# creates new alias & writes to ~/.bashrcfile  #
 	#          $1 = alias new                      #
 	#          $2 = alias definition               #
       ##--------------------------------------------- ## "
#new-alias () { 
  if [ -z "$1" ]; then
    echo "alias name:"
    read NAME
  else
    NAME=$1
  fi

  if [ -z "$2" ]; then
    echo "alias definition:"
    read DEFINTION
  else
    if [ "$2" = "-cd" ]; then
      DEFINTION='cd '
    else
      DEFINTION=$2
    fi
  fi

  echo "alias $NAME='$DEFINTION'" >> ~/.bashrc
  . ~/.bashrc

  bash ~/.bashrc
