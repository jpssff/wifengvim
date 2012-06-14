vimpath=$HOME/.vim
vimrcpath=$HOME/.vimrc

chmod -R 755 .

[ -d $vimpath ] && mv $vimpath $vimpath.bak
[ -f $vimrcpath ] && mv $vimrcpath $vimrcpath.bak

cp -r ./vimfiles $vimpath
cp ./_vimrc $vimrcpath

echo "ok!"

