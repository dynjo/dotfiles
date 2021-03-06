#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/gitignore ~/.gitignore

# aliases
ln -s ${BASEDIR}/aliases ~/.aliases

# bundler
ln -s ${BASEDIR}/gemrc ~/.gemrc
