#!/bin/sh

set -eu

ROOT=$(cd $(dirname $0) && pwd)

cd $HOME

main() {
  ARCH=
  setARCH
  echo "ARCH = $ARCH"
  echo

  relinks $ROOT/all
  relinks $ROOT/$ARCH
  relinks $ROOT/cache

  cp $ROOT/.gitconfig.local $HOME/

  echo
  echo Making links SUCCESS
}

relinks() {
  echo "making relinks from $1"
  find $1 -mindepth 1 -maxdepth 1 | while read f
  do
    name=$(basename $f)
    echo " ln -s $f"
    [ -e $name ] && unlink $name
    ln -s $f
  done
}

setARCH() {
  [ -e /etc/debian_version ] && ARCH=linux
}

main
