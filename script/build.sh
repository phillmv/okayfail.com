#!/bin/bash

set -e

if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

cd "$(dirname "$0")/.."

export STATIC_PLS=true
export notebook_name="source"
export NOTEBOOK_PATH="$(pwd)/$notebook_name"

cd .arquivo
bundle exec rails static:generate
