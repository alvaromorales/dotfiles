#!/bin/bash

echo "Starting Alvaro's vim setup"

# Install neovim and dependencies
OS_T="$OSTYPE"
if [[ $OS_T == "linux-gnu" ]]; then
  # Linux (Ubuntu)
  sudo apt-get install git python-pip neovim -y
elif [[ $OS_T == "darwin"* ]]; then
  # Mac OS X
  brew install git neovim/neovim/neovim fzf
fi

# Create the necessary directories
[ -e ~/.config/nvim ] || mkdir -p ~/.config/nvim
[ -e ~/.config/nvim/bundle ] || mkdir -p ~/.config/nvim/bundle
[ -e ~/.config/nvim/ftplugin ] || mkdir -p ~/.config/nvim/ftplugin
[ -e ~/.config/nvim/syntax ] || mkdir -p ~/.config/nvim/syntax

# Install Plug
if [ ! -e ~/.config/nvim/autoload/plug.vim ]; then
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# Copy files
cp ftplugin/*.vim ~/.config/nvim/ftplugin
cp syntax/*.vim ~/.config/nvim/syntax
cp vimrc ~/.config/nvim/init.vim

# Create symbolic links
[ -e ~/.vim ] || ln -s ~/.config/nvim ~/.vim
[ -e ~/.vimrc ] || ln -s ~/.config/nvim/init.vim ~/.vimrc

# Setup virtualenv for neovim
source `which virtualenvwrapper.sh`
mkvirtualenv nvim
pip install --upgrade pip autopep8 neovim pep8 pyflakes
deactivate
mkvirtualenv --python=`which python3` nvim-python3
pip install --upgrade pip autopep8 neovim pep8 pyflakes
deactivate

# TODO: change PYTHONPATH to nvim virtualenv instead of installing system-wide
if ! $(python -c "import autopep8" &> /dev/null); then sudo pip install autopep8; fi;
if ! $(python -c "import neovim" &> /dev/null); then sudo pip install neovim; fi;
if ! $(python -c "import pep8" &> /dev/null); then sudo pip install pep8; fi;
if ! $(python -c "import pyflakes" &> /dev/null); then sudo pip install pyflakes; fi;

# Install npm packages
# TODO: ensure npm is installed
sudo npm i -g eslint eslint-plugin-standard eslint-plugin-skip-nolint-lines

# Install plugins
nvim +PlugInstall +qall

echo "Done setting up vim"
