#!/bin/sh

set -eu

DIR=$HOME/.rbenv

# download
if [ ! -d $DIR ]; then
  git clone https://github.com/sstephenson/rbenv.git $DIR
  git clone https://github.com/sstephenson/ruby-build.git $DIR/plugins/ruby-build
fi

# build and install
if ! /usr/bin/which rbenv > /dev/null ; then
  PATH=$DIR/bin:$PATH
  eval "$(rbenv init -)"
  rbenv install -v 2.2.2
  rbenv rehash
  rbenv global 2.2.2
fi
