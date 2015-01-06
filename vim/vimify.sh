sudo apt-get install git-core -y

mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/ftplugin

cp ftplugin/*.vim ~/.vim/ftplugin
cp vimrc ~/.vimrc

if [[ ! e ~/.vim/bundle/vundle ]]
  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi

pip install pep8
pip install autopep8
