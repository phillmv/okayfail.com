#!/bin/bash

set -e

if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

cd "$(dirname "$0")/.."
mkdir -p build

if [ ! -d .arquivo ]; then
  git clone https://github.com/phillmv/arquivo.git .arquivo
fi

cd .arquivo
git pull
bundle
yarn install
cd ..
