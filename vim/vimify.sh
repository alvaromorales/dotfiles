#!/bin/bash

echo "Starting Alvaro's vim setup"

# Make sure git is installed
OS_T="$OSTYPE"
if [[ $OS_T == "linux-gnu" ]]; then
  # Linux (Ubuntu)
  sudo apt-get install vim -y
  sudo apt-get install git -y
  sudo apt-get install python-pip -y
elif [[ $OS_T == "darwin"* ]]; then
  # MAC OS
  brew install git
fi

# Create the necessary directories
[ -e ~/.vim ] || mkdir -p ~/.vim
[ -e ~/.vim/bundle ] || mkdir -p ~/.vim/bundle
[ -e ~/.vim/ftplugin ] || mkdir -p ~/.vim/ftplugin

# Install Vundle
if [ ! -e ~/.vim/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

sudo pip install pep8
sudo pip install autopep8

cp ftplugin/*.vim ~/.vim/ftplugin
cp vimrc ~/.vimrc

echo "Done setting up vim"
