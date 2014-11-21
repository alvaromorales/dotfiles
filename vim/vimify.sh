sudo apt-get install git-core -y

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/ftplugin

cp ftplugin/python.vim ~/.vim/ftplugin
cp vimrc ~

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
