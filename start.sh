pwd=${PWD/$HOME/~}

echo $pwd

cd $HOME

rm -rf .vim.bak
rm -rf .vimrc.bak

test -f .vimrc && mv .vimrc .vimrc.bak
test -d .vim   && mv .vim   .vim.bak

rm -f .vimrc
rm -f .vim

ln -s $pwd/_vimrc $HOME/.vimrc
ln -s $pwd/_vim   $HOME/.vim

echo 'done'
