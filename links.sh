#!/bin/bash

set -u

ROOT=$(cd $(dirname $0) && pwd)

cd $HOME

main() {
  ARCH=
  setARCH
  echo "ARCH = $ARCH"
  echo

  relinks $ROOT/all .
  relinks $ROOT/$ARCH .

  cp $ROOT/sample.gitconfig $HOME/.gitconfig
  cp $ROOT/sample.gitconfig.local $HOME/.gitconfig.local

  echo
  echo Making links SUCCESS
}

relinks() {
  echo "making relinks from $1"
  find $1 -mindepth 1 -maxdepth 1 | while read f
  do
    name=$(basename $f)
    if [ $2 = . ] ; then
        dest=$PWD/$name
    else
        dest=$PWD/$2/$name
    fi  
    echo " ln -s $f"
    [ -h $dest ] && unlink $dest
    ln -s $f $dest
  done
}

setARCH() {
  [ -e /etc/debian_version ] && ARCH=linux
  [ "`uname`" = "Darwin" ] && ARCH=mac
}

main
