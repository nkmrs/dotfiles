#!/bin/sh

set -eu

ROOT=$(cd $(dirname $0) && pwd)

cd $HOME

main() {
  install $ROOT/install
  echo
  echo Install SCCESS
}

install() {
  echo "installing from $1"
  find $1 -type f | while read f
  do
    name=$(basename $f)
    echo " $name"
    sh $f
  done
}

main
