#!/bin/bash

echo "Starting Alvaro's Mac setup"

# Homebrew

if test ! $(which brew); then
  echo "Installing Homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew is already installed."
fi

brew update

# Applications

apps=(
 iterm2
 shiftit
)

echo "Installing apps..."
brew tap caskroom/cask
brew cask install --appdir=/Applications ${apps[@]}

# Shell setup

echo "Installing oh-my-zsh"
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

# Python
echo "Installing Python virtualenv"
sudo pip install virtualenv virtualenvwrapper
pip install --user virtualenvwrapper
